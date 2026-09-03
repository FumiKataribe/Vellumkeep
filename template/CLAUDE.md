# Working agreement for AI agents

> Read this before making any change to {{PROJECT_NAME}}.

**Owner:** {{OWNER}}
**Last reviewed:** {{DATE}}

This file is read automatically by Claude Code and similar tools. It is also worth a
human read, because it states expectations that apply to everyone.

## The project

{{One paragraph. What this is, who uses it, and what it must never get wrong. Copy the
essentials from PROJECT.md rather than linking, because context loaded is better than
context available.}}

## Commands

```bash
{{install command}}      # Install dependencies
{{dev command}}          # Run locally
{{test command}}         # Run the test suite
{{lint command}}         # Lint
{{format command}}       # Format
{{build command}}        # Production build
```

Run the tests and the linter before proposing any change. Do not report work as complete
without them passing, and if they fail, say so with the output rather than describing the
change as done.

## Layout

```
{{Annotated directory tree. One line per significant folder saying what belongs in it.
This saves an agent a great deal of searching and stops new files landing in the wrong
place.}}
```

## Conventions

{{The patterns this codebase actually uses: naming, error handling, logging,
configuration, how tests are structured. Point at one exemplary file per pattern. A
concrete example beats a paragraph of description.}}

**Follow the surrounding code.** Match its idiom, its naming, and its comment density,
even where you would personally write it differently. Consistency is worth more than any
individual improvement.

## Rules

**Never commit secrets.** Not in code, not in tests, not in fixtures, not in comments.

**Never weaken a test to make it pass.** If a test fails, either the code is wrong or the
test is wrong. Work out which and fix that. Skipping, deleting, or loosening an assertion
is not a fix.

**Do not widen the change.** Fix what was asked. If you spot something else worth doing,
say so separately rather than folding it in. A large diff with an unrelated improvement
buried in it is hard to review and hard to revert.

**Ask before anything destructive or irreversible.** Data migrations, deletions, force
pushes, changes to production configuration, anything with an external side effect.

**Personal data is handled carefully.** {{State what personal data exists and the rules
around it. If none, say so.}}

## Where to look first

| Task | Start here |
| --- | --- |
| {{Adding an endpoint}} | {{path}} |
| {{Changing the data model}} | {{path}}, and read DECISIONS.md first |
| {{Adjusting the UI}} | {{path}} |
| {{Understanding a past choice}} | [DECISIONS.md](DECISIONS.md) |

## Known traps

{{The things that catch people out: a misleading name, a module that looks unused but is
loaded dynamically, a test that fails only in CI, a dependency pinned for a
non-obvious reason. Each entry here saves someone an afternoon.}}

## Definition of done

A change is finished when all of these hold:

- [ ] Tests pass, including any new test covering the change.
- [ ] The linter and formatter pass.
- [ ] Documentation in this folder is updated in the same commit.
- [ ] A decision worth recording is written into [DECISIONS.md](DECISIONS.md).
- [ ] The commit message explains why, not just what.
- [ ] The change is no wider than it needed to be.
