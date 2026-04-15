# Echobell Notify

Use Echobell when the user wants a notification after agent work finishes or
fails.

## Trigger Conditions

Apply these instructions when the user asks for any of the following:

- notify me when this finishes
- alert me if this fails
- send an Echobell push when done
- call me if the task fails
- wire Echobell into this agent workflow

## Preconditions

- Prefer `ECHOBELL_WEBHOOK_URL`
- If the webhook URL is missing, ask for it or explain the blocker
- Never store the webhook URL in tracked files unless the user explicitly asks

## Workflow

1. Confirm whether the notification is for success, failure, or both.
2. Choose the urgency:
   - `active` for routine completions
   - `time-sensitive` when the user is actively waiting
   - `calling` only for truly urgent failures or wake-me-up events
3. Keep the payload concise:
   - `title`: what happened
   - `body`: one or two lines of useful context
   - `linkUrl`: optional PR, preview, logs, or dashboard link
4. Send one final notification unless the user explicitly asks for progress
   updates.

## Send Pattern

Use `curl` unless the repo already has a stronger local HTTP helper:

```bash
curl -X POST "$ECHOBELL_WEBHOOK_URL" \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Task finished",
    "body": "Build passed and preview is ready.",
    "notificationType": "time-sensitive"
  }'
```

## Guardrails

- Do not send notifications without explicit user intent or standing team policy
- Do not dump large logs into the notification body
- Do not include secrets, tokens, credentials, or private diffs
- Prefer one high-signal notification over many noisy updates

