# Contributing to Vellumkeep

Thanks for considering it. This is a small project with a deliberately narrow
scope, so the most useful thing you can read first is the **Not doing** list
below.

## What this project is

Eight documents, tool-agnostic, plus a dependency-free shell script that copies
them and reports progress. That is the whole surface area.

## Not doing

| Request | Why not |
| --- | --- |
| A ninth document | The cap is the point. Eight is what a small team can realistically keep current. Make the case that one of the existing eight should be replaced instead. |
| A package published to npm, pip or brew | It would add a release process and a dependency for something that is a `cp` command. |
| Rewriting the script in another language | Bash and coreutils are already everywhere. A runtime would make adoption harder, not easier. |
| Web UI or hosted service | Out of scope. The pack is plain Markdown on purpose so it lives in the repo it describes. |

If you disagree with any of these, open an issue rather than a pull request.
Reasoning changes minds; a finished implementation of a rejected idea just
creates an awkward conversation.

## Good contributions

- Sharpening the prose in a template so it prompts a better answer.
- Fixing anything inaccurate, ambiguous, or unnecessarily long.
- Shell script fixes, especially portability across bash versions and macOS.
- Real-world feedback on which prompts in the templates actually got answered
  and which got skipped. This is the most valuable feedback there is.

## Before you open a pull request

```bash
bash -n setup.sh                      # syntax check
shellcheck setup.sh                   # if you have it installed
./setup.sh install /tmp/vk-test       # exercise the install path
./setup.sh check   /tmp/vk-test       # exercise the check path
./setup.sh install /tmp/vk-test       # run twice, must skip cleanly
```

Also run it once with `NO_COLOR=1` and once piped through `cat`, to confirm the
output degrades properly when it is not attached to a terminal.

## Style

British English. Short paragraphs. No em dashes.

Write template prose as a question the reader must answer, not as a description
of what the section is for. "What is broken today, from the point of view of the
person who suffers it?" produces a better document than "This section describes
the problem."

## Commits

Write the subject line as an instruction: "Add macOS compatibility note", not
"Added" or "macos stuff". Explain why in the body, not what. The diff already
shows what changed.

## Reporting security issues

Do not open a public issue. See [SECURITY.md](SECURITY.md).
