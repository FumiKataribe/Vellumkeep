# Contributing

> How work gets proposed, built, reviewed, and merged on {{PROJECT_NAME}}.

**Owner:** {{OWNER}}
**Last reviewed:** {{DATE}}

## Before you start

Check [ROADMAP.md](ROADMAP.md) and the **Not doing** section in particular. A well built
change that was already declined helps nobody.

For anything larger than a bug fix, open an issue first and get agreement on the
approach. Reviewing an approach costs minutes. Reviewing a finished implementation of the
wrong approach costs days and creates an awkward conversation.

## Branches

```
{{main}}              Always deployable
feature/{{short-name}}  New work
fix/{{short-name}}      Bug fixes
```

Branch from `{{main}}`. Keep branches short lived. A branch open for three weeks is a
merge conflict wearing a disguise.

## Commits

Write the subject line as an instruction: "Add listing export", not "Added listing
export" or "listing export stuff". Keep it under about seventy characters.

Use the body to explain why, not what. The diff already shows what changed. What it
cannot show is the reasoning, the alternative you rejected, or the constraint you were
working around.

```
Add rate limiting to the submission endpoint

A single misconfigured client sent four thousand requests in a
minute on Tuesday and exhausted the connection pool. Limiting per
API key rather than per IP, because our main integrator sits
behind a single address.
```

## Pull requests

**Keep them small.** Under roughly four hundred changed lines gets a real review.
Beyond that, reviewers skim, and skimmed reviews find nothing.

**One concern per pull request.** A refactor bundled with a behaviour change means
neither can be assessed properly, and neither can be reverted cleanly.

**Write the description for the reviewer.** What changed, why, how you verified it, and
anything you are unsure about. Flagging your own uncertainty is a strength, it directs
attention to where it is most useful.

**Update the documentation in the same pull request.** Behaviour change without a
documentation change should prompt a reviewer question.

## Review

Reviewers are asked to check, in this order:

1. **Is it correct?** Does it do what it claims, including at the edges?
2. **Is it safe?** Input handling, authorisation, secrets, personal data.
3. **Will it be understood in a year?** By someone with no context.
4. **Is it consistent?** With the surrounding code, not with the reviewer's preferences.

Separate what must change from what you would prefer. Prefix optional comments with
"nit:" so the author can weigh them properly.

Approve with minor comments rather than blocking on them. Holding a pull request for a
naming preference costs more than the naming preference is worth.

Authors: respond to every comment, even if the response is "good point, leaving as is
because X". Silent dismissal is how reviewers stop reviewing carefully.

## Testing

{{State what is expected. For example: new behaviour needs a test, bug fixes need a test
that fails before the fix, and the full suite must pass before merge.}}

Never skip, disable, or delete a failing test to get a build green. A failing test is
information. Removing it removes the information and keeps the problem.

## Style

{{Formatter and linter, with the command to run them. Automate everything automatable so
review never spends time on whitespace.}}

```bash
{{format command}}
{{lint command}}
{{test command}}
```

## Security

Do not open a public issue for a security problem. Contact {{SECURITY_CONTACT}} directly.

Never commit secrets. If you commit one by accident, rotate it immediately, then worry
about removing it from history. Rotation is what actually protects you, history rewriting
is tidying up afterwards.
