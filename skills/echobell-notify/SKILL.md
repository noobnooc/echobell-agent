---
name: echobell-notify
description: Configure or use Echobell notifications for long-running agent work. Use when the user wants an Echobell alert on completion or failure, wants to install or configure the Echobell skill, needs help choosing notification urgency, or needs a clean Echobell webhook payload for task results.
---

# Echobell Notify

Use this skill when the user wants Echobell notifications tied to agent work.

## Prerequisites

- Prefer `ECHOBELL_WEBHOOK_URL`
- If the webhook is missing, ask for it or explain the blocker
- Never write secrets into tracked files unless the user explicitly asks for that

If the user needs installation or environment help, read `references/setup.md`.

If the user needs payload examples or urgency guidance, read
`references/payloads.md`.

## Default Workflow

1. Confirm when the notification should fire:
   - completion only
   - failure only
   - both
2. Choose the urgency:
   - `active` for routine completions
   - `time-sensitive` when the user is actively waiting
   - `calling` only for truly urgent failures or wake-me-up events
3. Keep the payload short:
   - `title`: what finished or failed
   - `body`: one or two lines of useful context
   - `linkUrl`: optional link to a PR, preview, log, or dashboard
4. Send one final notification unless the user explicitly asks for progress updates

## Send Pattern

Use `curl` unless the repository already has a better local HTTP utility:

```bash
curl -X POST "$ECHOBELL_WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Task finished",
    "body": "Build passed and preview is ready.",
    "notificationType": "time-sensitive"
  }'
```

## Operational Rules

- Do not send notifications without explicit user intent or a standing team rule
- Do not dump large logs into the payload body
- Do not include secrets, tokens, credentials, or private diffs
- Prefer one notification with a short summary over multiple noisy updates
- If a task fails before meaningful work starts, notify only if the user asked
  for failure notifications

## Good Fits

- long-running refactors
- repository reviews
- benchmark runs
- build and deployment verification
- data processing jobs
- generated artifact batches

## Poor Fits

- trivial one-command tasks
- chatty progress reporting
- anything that would leak sensitive output into a notification body

