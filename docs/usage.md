# Usage

This repository supports two usage shapes:

1. repository instructions via `AGENTS.md` or another agent-native rule file
2. native skill-directory loading via `skills/echobell-notify`

The behavior is intentionally the same across both shapes.

## What the Skill Does

`echobell-notify` helps an agent:

- decide whether a task should trigger a notification
- choose a notification urgency level
- structure a short webhook payload
- send a clean completion or failure message through Echobell

## Expected Trigger Cases

Use the skill when the user asks for any of the following:

- notify me when this finishes
- alert me if this fails
- send an Echobell push when the task is done
- call me if the migration fails
- wire Echobell into my long-running agent workflow

## Notification Levels

| Type | Use when | Typical examples |
| --- | --- | --- |
| `active` | Normal completion or low-priority updates | Documentation draft finished, report generated |
| `time-sensitive` | The user is waiting and should notice quickly | Refactor completed, benchmark finished, PR review done |
| `calling` | Immediate action matters and delay is costly | Production rollback failed, outage triage blocked |

Default to `time-sensitive` only when the user explicitly cares about quick
awareness. Default to `active` for routine completions. Use `calling` sparingly.

## Prompt Patterns

These examples work whether the agent loaded the logic through `AGENTS.md`,
`CLAUDE.md`, a Cursor/Windsurf rule, or a native skill directory.

### Completion notification

```text
Use $echobell-notify and send me an Echobell notification when this finishes.
```

### Completion with urgency

```text
Use $echobell-notify and send a time-sensitive notification when the test suite is done.
```

### Failure-only path

```text
Use $echobell-notify and alert me only if this deployment validation fails.
```

### Completion and failure

```text
Use $echobell-notify. Notify me on failure with calling, and on success with active.
```

## Payload Guidance

Keep payloads short and operational:

- `title`: what happened
- `body`: one or two lines of useful context
- `notificationType`: `active`, `time-sensitive`, or `calling`
- `linkUrl`: optional URL to logs, PRs, previews, or dashboards

Good:

```json
{
  "title": "Refactor finished",
  "body": "12 files updated. Build and typecheck passed.",
  "notificationType": "time-sensitive"
}
```

Bad:

- dumping full logs into the body
- including secrets or tokens
- sending multiple duplicate notifications for the same task

## Suggested Operating Pattern

1. Start the long-running task.
2. Do the work.
3. Summarize the result in one short payload.
4. Send the notification at the end.
5. Only send intermediate notifications when the user explicitly requests them.

## Common Workflows

### Code generation

- success: `active` or `time-sensitive`
- failure: `time-sensitive`

### Repository audit

- success: `active`
- severe finding batch: `time-sensitive`

### Production issue

- success: `time-sensitive`
- blocker or failed remediation: `calling`
