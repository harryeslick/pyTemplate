

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
  CHANGELOG.md              # rolling agent session log (input to /version-increment)
  sessions/
    YY-MM-DD-<slug>.md      # one structured summary per session (permanent record)
  archive/
    sessions-to-vX.Y.Z.md  # snapshot of CHANGELOG.md at each release
```


### Agent-CHANGELOG (`.claude/CHANGELOG.md`)


---

## Slash Commands

| Command | Purpose |
|---|---|
| `/session-end [slug]` | Close session: write summary file + append to CHANGELOG.md |
| `/session-status` | Print mid-session checkpoint (read-only) |
| `/version-increment [patch\|minor\|major]` | Consolidate session log → CHANGELOG.md, bump version, archive |

Use `/session-end` at the close of every meaningful work session.  
Use `/version-increment patch` for routine releases after a batch of sessions.  
Use `/version-increment minor` when a new pipeline stage, model, or feature is complete.  
Use `/version-increment major` for breaking changes to data formats, APIs, or core model architecture.

---

## Versioning conventions (SemVer for research code)

| Bump | When to use |
|---|---|
| `patch` | Bug fix, parameter tweak, doc update, test addition |
| `minor` | New analysis pipeline, new model variant, new data source integrated |
| `major` | Breaking change to output formats, removal of a pipeline stage, API redesign |

---

