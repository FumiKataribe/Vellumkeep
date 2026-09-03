# Project documentation

This folder holds the working memory of {{PROJECT_NAME}}. Eight documents, each with one
job. If you are new here, read them in this order.

| Order | File | Read it when |
| --- | --- | --- |
| 1 | [PROJECT.md](PROJECT.md) | You need to know what this is and why it exists. |
| 2 | [ARCHITECTURE.md](ARCHITECTURE.md) | You need to know how it is built. |
| 3 | [CONTRIBUTING.md](CONTRIBUTING.md) | You are about to change something. |
| 4 | [DECISIONS.md](DECISIONS.md) | You are about to disagree with something. |
| 5 | [ROADMAP.md](ROADMAP.md) | You want to know what is coming. |
| 6 | [OPERATIONS.md](OPERATIONS.md) | Something is on fire, or about to be. |
| 7 | [CLAUDE.md](CLAUDE.md) | You are an AI agent, or configuring one. |
| 8 | This file | You are lost. |

## How to use this pack

1. Copy this folder into your project.
2. Fill in `PROJECT.md` first. Everything else assumes it.
3. Search for `{{` to find unfilled placeholders.
4. Delete any document you genuinely will not maintain. An empty template is worse than
   no template, because it implies the answer exists somewhere.

## Keeping it honest

Documentation rots quietly. Three habits stop most of it:

**Change the doc in the same commit as the code.** Not the same day, the same commit.
A reviewer who sees a behaviour change with no documentation change should ask why.

**Date things that age.** Roadmaps, operational thresholds, and dependency notes should
carry a date so a reader can judge staleness for themselves.

**Review the pack quarterly.** Fifteen minutes, one person, one question per document:
is this still true? Anything false gets fixed or deleted on the spot.

## Ownership

| Document | Owner | Last reviewed |
| --- | --- | --- |
| PROJECT.md | {{OWNER}} | {{DATE}} |
| ARCHITECTURE.md | {{OWNER}} | {{DATE}} |
| DECISIONS.md | {{OWNER}} | {{DATE}} |
| ROADMAP.md | {{OWNER}} | {{DATE}} |
| OPERATIONS.md | {{OWNER}} | {{DATE}} |
| CONTRIBUTING.md | {{OWNER}} | {{DATE}} |
| CLAUDE.md | {{OWNER}} | {{DATE}} |

One named person per row. "The team" is not an owner.
