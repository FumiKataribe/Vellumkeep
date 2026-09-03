<div align="center">

```
██╗   ██╗███████╗██╗     ██╗     ██╗   ██╗███╗   ███╗
██║   ██║██╔════╝██║     ██║     ██║   ██║████╗ ████║
██║   ██║█████╗  ██║     ██║     ██║   ██║██╔████╔██║
╚██╗ ██╔╝██╔══╝  ██║     ██║     ██║   ██║██║╚██╔╝██║
 ╚████╔╝ ███████╗███████╗███████╗╚██████╔╝██║ ╚═╝ ██║
  ╚═══╝  ╚══════╝╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝
                     ██╗  ██╗███████╗███████╗██████╗
                     ██║ ██╔╝██╔════╝██╔════╝██╔══██╗
                     █████╔╝ █████╗  █████╗  ██████╔╝
                     ██╔═██╗ ██╔══╝  ██╔══╝  ██╔═══╝
                     ██║  ██╗███████╗███████╗██║
                     ╚═╝  ╚═╝╚══════╝╚══════╝╚═╝
```

### Eight documents. One shared memory.

An open-source project framework that gives any codebase the context
a new contributor, or an AI agent, needs on day one.

[![Licence: MIT](https://img.shields.io/badge/Licence-MIT-2ea44f?style=flat-square)](LICENSE)
[![Dependencies: none](https://img.shields.io/badge/Dependencies-none-44cc99?style=flat-square)](#requirements)
[![Documents: 8](https://img.shields.io/badge/Documents-8-0aa?style=flat-square)](#what-is-in-the-pack)
[![Shell: bash](https://img.shields.io/badge/Shell-bash-f0ad4e?style=flat-square)](setup.sh)
[![PRs welcome](https://img.shields.io/badge/PRs-welcome-blueviolet?style=flat-square)](CONTRIBUTING.md)

</div>

---

## The problem

Most projects fail their documentation twice. First when nobody writes anything
down, then again when somebody writes down far too much and nobody reads it.

Vellumkeep aims at the narrow band in between: eight documents, each with a
single job, each short enough that keeping it current is realistic.

## Quick start

```bash
git clone https://github.com/FumiKataribe/vellumkeep.git
cd vellumkeep
./setup.sh install ~/your-project/docs
```

That copies the pack in, skipping anything already there, so it is safe to run
twice. Then check your progress at any point:

```bash
./setup.sh check ~/your-project/docs
```

```
  ◐ PROJECT.md         4 placeholder(s) left
  ✔ ARCHITECTURE.md    complete
  ✔ DECISIONS.md       complete
  ✘ ROADMAP.md         missing
  ✔ OPERATIONS.md      complete
  ✔ CONTRIBUTING.md    complete
  ✘ CLAUDE.md          missing
  ✔ README.md          complete

  ────────────────────────────────────────────────────────
    Documents present  ██████████████████░░░░░░  75%   6 of 8
  ────────────────────────────────────────────────────────
```

Prefer to do it by hand? Just copy `template/` wherever you want it. There is
nothing magic in the script.

## What is in the pack

| Document | Answers |
| --- | --- |
| **`PROJECT.md`** | What are we building, for whom, and how will we know it worked? |
| **`ARCHITECTURE.md`** | How is it put together, and why that way? |
| **`DECISIONS.md`** | What did we settle, when, and what did we rule out? |
| **`ROADMAP.md`** | What is next, and what are we deliberately not doing yet? |
| **`OPERATIONS.md`** | How do we run it, watch it, and recover it when it breaks? |
| **`CONTRIBUTING.md`** | How does work get proposed, reviewed, and merged? |
| **`CLAUDE.md`** | What does an AI agent need to know before touching this code? |
| **`README.md`** | Index and reading order for the pack itself. |

Start with `PROJECT.md`. The other seven lean on it, and it is the one most
likely to expose that a project is less well defined than it felt.

## Design principles

**Short beats complete.** A one-page architecture note that is accurate is worth
more than a twenty-page one that drifted six months ago.

**Every document has an owner.** Shared ownership of a document means nobody
owns it. The index carries a table with one named person per row.

**Decisions are append-only.** `DECISIONS.md` records what you chose and what you
rejected. Superseded entries stay, marked as superseded, because the reasoning
behind a reversal is usually more valuable than the reversal itself.

**Tool-agnostic.** Nothing assumes a language, host, tracker, or CI system. The
framework describes the shape of the information, not the tooling around it.

**Written for two audiences.** A new human contributor in their first week, and
an AI agent in its first minute. Both need the same things: scope, constraints,
and the reasoning behind past choices.

## Why the AI agent file matters

Coding agents perform far better against an explicit brief than an implied one.
`CLAUDE.md` is read automatically by Claude Code and similar tools, and it gives
them the commands to run, the conventions to follow, the traps to avoid, and a
definition of done. It is also worth a human read, because it states
expectations that apply to everyone.

## Requirements

Bash and coreutils. That is the whole list. No package manager, no runtime, no
install step, nothing to keep updated.

The script honours [`NO_COLOR`](https://no-color.org/) and drops colour
automatically when output is not a terminal, so it behaves in CI and in pipes.

## Filling it in

Placeholders are written as `{{LIKE_THIS}}`. Search for `{{` to find anything
outstanding, or let `./setup.sh check` count them for you.

Delete any document you genuinely will not maintain. An empty template is worse
than no template, because it implies the answer exists somewhere.

## Keeping it honest

Documentation rots quietly. Three habits stop most of it:

1. **Change the doc in the same commit as the code.** Not the same day, the same
   commit. A reviewer seeing a behaviour change with no documentation change
   should ask why.
2. **Date things that age.** Roadmaps, operational thresholds, and dependency
   notes should carry a date so a reader can judge staleness themselves.
3. **Review quarterly.** Fifteen minutes, one person, one question per document:
   is this still true? Anything false gets fixed or deleted on the spot.

## Contributing

Issues and pull requests are welcome. See [CONTRIBUTING.md](CONTRIBUTING.md) for
how work gets proposed and reviewed, and [SECURITY.md](SECURITY.md) for
reporting anything sensitive.

## Licence

MIT. See [LICENSE](LICENSE). Use it commercially, fork it, rename it, strip the
attribution if you like.
