---
trigger: always_on
---

# Echobell Notify

- Use Echobell when the user asks for a notification after agent work finishes
  or fails
- Require `ECHOBELL_WEBHOOK_URL`
- Default `active` for routine completions
- Use `time-sensitive` when quick awareness matters
- Use `calling` only for urgent failures
- Keep payloads short and send one final notification unless asked otherwise
- Use `curl` to POST JSON to `$ECHOBELL_WEBHOOK_URL`
- Never include secrets, tokens, credentials, or private diffs

