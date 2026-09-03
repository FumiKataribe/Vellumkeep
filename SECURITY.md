# Security

## Scope

Vellumkeep is a set of Markdown templates plus one shell script. It has no
runtime, no network access, no dependencies, and stores no data. The realistic
attack surface is `setup.sh` itself.

Worth reporting:

- Anything in `setup.sh` that could write outside the target directory given a
  crafted path.
- Command injection through a directory name or environment variable.
- Anything that could clobber a file the script reports as "left untouched".

Not in scope: advice inside the templates that you disagree with, and the
`{{PLACEHOLDER}}` markers, which are inert text.

## Reporting

Please do not open a public issue for a security problem.

Use GitHub's private reporting on this repository: **Security** tab, then
**Report a vulnerability**. That opens a private channel with the maintainers.

Include what you found, how to reproduce it, and what an attacker would gain.
A proof of concept helps enormously.

## What to expect

- Acknowledgement within a week.
- An assessment, and a fix or an explanation of why it is not a problem.
- Credit in the release notes, unless you would rather not be named.

This is a small volunteer project, so please be patient. There is no bounty.

## For people adopting the pack

`template/CONTRIBUTING.md` and `template/CLAUDE.md` both carry a rule worth
repeating: never commit secrets, and if you do, rotate the secret immediately
rather than rewriting history first. Rotation is what actually protects you.
Removing it from history is tidying up afterwards.

`template/OPERATIONS.md` has a `{{SECURITY_CONTACT}}` placeholder. Fill it in
before you publish, or delete the line. An unfilled contact is worse than none,
because it implies somebody is listening.
