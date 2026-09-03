# Architecture

> How {{PROJECT_NAME}} is put together, and why it is put together that way.

**Owner:** {{OWNER}}
**Last reviewed:** {{DATE}}

## Shape

{{Two or three paragraphs describing the system in plain prose before any diagram. A
reader should be able to picture the moving parts from this alone. Name the major
components and what each one is responsible for.}}

## Diagram

```
{{Keep it in text so it survives in a terminal, a diff, and a code review.

  [ Browser ] ──► [ Web app ] ──► [ API ] ──► [ Database ]
                                    │
                                    └──────► [ Queue ] ──► [ Workers ]
}}
```

## Components

### {{Component name}}

- **Responsibility:** {{One sentence. If it needs two, it may be two components.}}
- **Technology:** {{language, framework, version}}
- **Owns:** {{the data or behaviour nothing else may touch directly}}
- **Talks to:** {{other components, and by what mechanism}}
- **Fails how:** {{what breaks downstream when this is unavailable}}

{{Repeat per component. Keep each block short. The failure mode line is the one people
skip and the one that matters at three in the morning.}}

## Data

**Stores:** {{each datastore, what lives in it, and what the retention policy is}}

**Sources of truth:** {{for each significant entity, the single place that owns it.
Ambiguity here is the root of most data bugs.}}

**Personal data:** {{what personal data is held, on what lawful basis, for how long, and
how a deletion request is honoured. If none is held, say so explicitly. This is a
compliance question and vagueness here is expensive.}}

## Interfaces

| Interface | Type | Consumers | Stability |
| --- | --- | --- | --- |
| {{name}} | {{REST / webhook / queue / file}} | {{who calls it}} | {{public / internal / experimental}} |

Public interfaces cannot change without a deprecation window. Experimental ones can
change without notice, which is the entire reason for labelling them.

## Dependencies

| Dependency | What we use it for | What happens if it disappears |
| --- | --- | --- |
| {{service or library}} | {{purpose}} | {{blast radius and fallback}} |

## Environments

| Environment | Purpose | Who can deploy | Data |
| --- | --- | --- | --- |
| Local | Development | Anyone | Synthetic |
| {{Staging}} | {{Pre-release checks}} | {{who}} | {{anonymised or synthetic}} |
| Production | Live | {{who}} | Real |

Never copy production personal data into a lower environment. If staging needs realistic
data, generate it.

## Constraints that shaped this

{{The forces that made this design the right one: team size, existing systems, cost
ceilings, latency requirements, an inherited codebase. Without this section, every future
reader assumes the design was arbitrary and proposes replacing it.}}

## Known weaknesses

{{Where the design is thin, what would break under ten times the load, what was built
expediently and never revisited. Being candid here saves the next person a fortnight of
discovering it themselves. Each entry should link to a DECISIONS.md entry or a roadmap
item if there is a plan to address it.}}
