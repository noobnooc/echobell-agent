# Setup Reference

## Required Environment

Preferred:

```bash
export ECHOBELL_WEBHOOK_URL="https://hook.echobell.one/..."
```

The skill assumes the runtime can access the webhook URL directly.

## Installation Destination

Codex discovers skills from:

```text
${CODEX_HOME:-$HOME/.codex}/skills
```

This repository installs:

```text
${CODEX_HOME:-$HOME/.codex}/skills/echobell-notify
```

## Operational Advice

- Keep the webhook URL outside the repo, usually in the shell environment
- Restart Codex after installation or updates
- Use shared channel webhooks for teams and Direct webhooks for personal flows

