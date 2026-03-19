---
name: version-increment
description: Increment the project version (SemVer) and consolidate the agent session changelog into a formal release entry in CHANGELOG.md
argument-hint: "[patch|minor|major]"
allowed-tools: Read, Edit, Write, Grep, Glob, "Bash(markdownlint*)"
model: haiku
---

Increment the project version and consolidate the agent session changelog into a formal release entry.

## Argument

$ARGUMENTS must be one of: `patch` | `minor` | `major`
Default to `patch` if no argument is provided.

---

## Step 1 — Detect current version

Search for the version string in this priority order:
1. `pyproject.toml` → `[project] version = "..."` or `[tool.poetry] version = "..."`
2. `setup.cfg` → `version = ...`
3. `setup.py` → `version="..."`
4. `src/<package>/__init__.py` or `<package>/__init__.py` → `__version__ = "..."`

Report the file found and current version before proceeding.

---

## Step 2 — Compute new version

Apply SemVer rules to the detected version:
- `patch`: increment Z in X.Y.Z
- `minor`: increment Y, reset Z to 0
- `major`: increment X, reset Y and Z to 0

---

## Step 3 — Harvest and categorise session entries

Read `.claude/AGENT-CHANGELOG.md`. For each new session entry, which is more recent than the current version, summarise the major changes and classify according to the keep a change log headings:

```markdown
## Version [<X.Y.Z>] - <YYYY-MM-DD>
### Added
  new features, scripts, models, datasets, analysis pipelines
### Changed
  modifications to existing behaviour or interfaces
### Deprecated
  functionality flagged for future removal
### Removed
  deleted files, functions, or data
### Fixed
  bug fixes, data corrections, broken tests
### Security
```

If an object changes multiple times, or is created and removed within the new session entries DO NOT record these into the CHANGELOG.
CHANGELOG version entry should reflect the current state of the package at the time the version is incremented.

`AGENT-CHANGELOG.md` = a full record of all changes iterations and tests made during development
`CHANGELOG.md` = a record of the major changes which remain at the time of version increment.

If ambiguous, default to **Changed**. Only include headings that have entries.

---

## Step 4 — Write the root CHANGELOG.md release block

Prepend a new version block to `CHANGELOG.md` in the project root (create if absent).

## Step 5 — Lint the changelog

Run `markdownlint --fix CHANGELOG.md` to auto-fix any formatting issues.

---

## Step 6 — Update the version in source

Write the new version string back to the exact file and line detected in Step 1.

---

## Step 7 — Archive and reset the agent session log

1. Copy `.claude/AGENT-CHANGELOG.md` → `.claude/archive/sessions-to-vX.Y.Z.md`
2. Reset `.claude/AGENT-CHANGELOG.md` to:

```markdown
# Agent Session Log

Run `/version-increment` to consolidate into the project CHANGELOG.md.

---
```

Do **not** delete individual files in `.claude/sessions/` — they are the permanent record.

---

## Step 8 — Print release summary

```
Version bumped: X.Y.Z → A.B.C  (patch|minor|major)
Version file:   pyproject.toml
CHANGELOG.md:   N entries consolidated under [A.B.C]
Session log:    archived to .claude/archive/sessions-to-vA.B.C.md

Suggested next steps:
  git add CHANGELOG.md pyproject.toml .claude/
  git commit -m "chore: release vA.B.C"
  git tag -a vA.B.C -m "Release vA.B.C"
```
