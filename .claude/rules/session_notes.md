

## Claude Session Notes (automatic — every session)

Write a short session summary in `.claude/sessions/YY-MM-DD-<short-topic>.md`.

Each `.claude/sessions/YY-MM-DD-<short-topic>.md` must contain:

```markdown
# Session: YY-MM-DD — <short-topic>

## Scope
## Key Changes
## Tests Run
## Open Items
```

Keep session summaries **specific**: reference real file names, function names, model parameters, dataset versions, and quantitative results where known.

### Directory layout

```
.claude/
  AGENT-CHANGELOG.md              # rolling agent session log (updated by pre-commit)
  sessions/
    YY-MM-DD-<short-topic>.md      # one structured summary per session (permanent record)
  hooks/

```

### AGENT-CHANGELOG (`.claude/AGENT-CHANGELOG.md`)

managed by `.claude/hooks/pre-commit`

