# Operations

> How to run {{PROJECT_NAME}}, watch it, and get it back when it falls over.

**Owner:** {{OWNER}}
**Last reviewed:** {{DATE}}

Write this document for a competent person who has never seen the system, at an hour
when they are not at their sharpest. Assume nothing.

## Running it locally

```bash
{{Exact commands, in order, from a fresh clone to a working local instance.
No steps omitted as "obvious".}}
```

**Prerequisites:** {{versions of language runtimes, tools, and services}}

**Configuration:** {{which environment variables are needed, where to get values for
them, and which are safe to leave at defaults. Never commit real values. Point to the
secret store instead.}}

## Deploying

| Environment | How | Who can | Rollback |
| --- | --- | --- | --- |
| {{Staging}} | {{command or trigger}} | {{who}} | {{how}} |
| Production | {{command or trigger}} | {{who}} | {{how}} |

**Before deploying:** {{the checks that must pass, and any that must be run by hand}}

**After deploying:** {{what to verify, and how long to watch before considering it
settled}}

## Monitoring

| Signal | Where to look | Healthy range | Who is alerted |
| --- | --- | --- | --- |
| {{metric}} | {{dashboard or command}} | {{range}} | {{who, and by what channel}} |

Every alert should be actionable. An alert nobody acts on gets ignored, and then so do
the ones that matter.

## Common failures

### {{Symptom as it presents, not as it is caused}}

**Looks like:** {{what the reporter actually sees}}
**Usually caused by:** {{cause}}
**Check:** {{the command or dashboard that confirms it}}
**Fix:** {{steps}}
**If that does not work:** {{escalation}}

{{Repeat per known failure. Add a new block every time an incident teaches you
something. This section should grow over the life of the project.}}

## Backups and recovery

**What is backed up:** {{datastores, configuration, secrets, uploaded files}}
**How often:** {{schedule}}
**Where to:** {{location, and whether it is in a different region or account}}
**Retention:** {{how long}}
**Restore procedure:** {{step by step}}
**Last restore test:** {{date}}

An untested backup is a guess. Test the restore, record the date here, and treat a stale
date as a live risk.

## Access

| System | Who has access | How to request | How to revoke |
| --- | --- | --- | --- |
| {{system}} | {{roles or names}} | {{process}} | {{process}} |

Review this table when anyone joins or leaves. Revocation on departure is the step that
gets forgotten.

## Incident handling

1. **Stabilise.** Restore service first. Diagnosis can wait, an outage cannot.
2. **Communicate.** Tell {{who}} through {{channel}}, including an honest estimate. "We
   do not know yet" is a legitimate update.
3. **Diagnose.** Once service is restored, find the cause properly.
4. **Write it up.** {{Where}}. Focus on the conditions that allowed it, not on who typed
   the command.
5. **Fix the class of problem.** Add the symptom to **Common failures** above, and raise
   the preventative work on the roadmap.

**Contacts:** {{names, roles, and how to reach them out of hours, including any supplier
support arrangements and their response times}}
