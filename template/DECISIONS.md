# Decision log

> Append-only. New decisions go at the top. Nothing is ever deleted, only superseded.

**Owner:** {{OWNER}}

## Why this exists

Six months from now, somebody will look at a choice made here and assume it was
accidental. This document is the difference between "why on earth did they do that" and
"right, that still holds" or "right, that no longer holds, and here is precisely what
changed".

Record a decision when it was hard to make, expensive to reverse, or surprising to an
outsider. Do not record routine choices. A log that captures everything gets read by
nobody.

## Format

Copy this block for each new entry.

---

## {{NNN}}. {{Short title in plain language}}

**Date:** {{YYYY-MM-DD}}
**Status:** {{Accepted | Superseded by NNN | Reversed}}
**Decided by:** {{names}}

### Context

{{What was going on that forced a choice. The pressure, the constraint, the deadline,
the discovery. A reader should understand why this could not simply be deferred.}}

### Decision

{{What was chosen, stated plainly and actively. "We will use X for Y."}}

### Alternatives considered

- **{{Option}}**, rejected because {{reason}}.
- **{{Option}}**, rejected because {{reason}}.

This section is the most valuable part of the entry. A future reader proposing a change
usually proposes one of these, and the reasoning here either stops them or gets properly
challenged.

### Consequences

{{What this makes easy, what it makes hard, and what it commits us to. Include the
unpleasant consequences. A decision with no downside was not a decision.}}

### Revisit when

{{The condition that should trigger a fresh look: a scale threshold, a contract renewal,
a dependency reaching end of life. If nothing would ever trigger a review, say
"permanent".}}

---

## Example entry

## 001. Store the wiki content as flat Markdown rather than in a database

**Date:** 2026-01-15
**Status:** Accepted
**Decided by:** {{name}}

### Context

We needed a content store for a two-person team with no dedicated operations capacity.
The first release had a hard deadline and no budget for managed database hosting.

### Decision

Content is stored as Markdown files in the repository, rendered at build time.

### Alternatives considered

- **Managed Postgres**, rejected because it adds a hosting cost and an operational
  surface we cannot staff, for a content set that changes a few times a week.
- **A hosted CMS**, rejected because it puts the content behind a vendor and a monthly
  fee, and the editing audience is technical enough not to need a visual editor.

### Consequences

Editing requires Git literacy, which excludes non-technical contributors. In exchange we
get free hosting, version history, review through pull requests, and no database to back
up. Full-text search must be handled client side or at build time.

### Revisit when

Non-technical contributors need to edit directly, or content exceeds roughly a thousand
documents and build times become uncomfortable.
