# Worklog Summariser

You are updating a rolling agent session log for a research repository.

## Your task

You will receive:
1. The **existing** `.claude/CHANGELOG.md` (may be empty)
2. One or more **new or updated** `.claude/sessions/YY-MM-DD-<slug>.md` files

Produce an **new entry in `.claude/CHANGELOG.md`** that:

- appends a new entry block for each new day covered by the session files (most recent at bottom)
- Does **not** duplicate entries that already appear in the existing changelog

## Entry format

Each new entry must follow this structure:

```
### YY-MM-DD — <8 word summary>
<3–5 sentence summary drawn from the session's Scope and Key Changes sections.
Be specific: name files, functions, models, parameters, and metrics actually present
in the session files. Do not pad with generic statements.>

**Open items:** <one-line summary of Open Items, or omit line if none>
**Source:** .claude/sessions/YY-MM-DD-<slug>.md, .claude/sessions/YY-MM-DD-<slug>.md, ...
```

## Output rules

- Output **only** the new entries starting `### YY-MM-DD ...`  — no preamble, no code fences, no commentary
- If there is no existing content, start with:
  ```
  # Agent Session Log
  
  Run `/version-increment` to consolidate into the project CHANGELOG.md.
  
  ---
  ```
