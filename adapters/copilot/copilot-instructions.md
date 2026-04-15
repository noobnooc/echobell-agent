# Echobell Notify

When the user asks for Echobell notifications tied to agent work:

- require `ECHOBELL_WEBHOOK_URL`
- confirm whether to notify on success, failure, or both
- use `active` for routine completions
- use `time-sensitive` when the user is actively waiting
- use `calling` only for urgent failures
- keep the payload concise
- send one final notification unless the user explicitly asks for progress updates
- do not include secrets, tokens, credentials, or private diffs

