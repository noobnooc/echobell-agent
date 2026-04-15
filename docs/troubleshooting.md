# Troubleshooting

## The skill does not appear in Codex

Check that the skill exists here:

```text
${CODEX_HOME:-$HOME/.codex}/skills/echobell-notify
```

Then restart Codex.

## The installer says the destination already exists

Remove the installed copy first:

```bash
./scripts/uninstall-codex-skill.sh
./scripts/install-codex-skill.sh
```

## Notifications are not arriving

Check the basics:

1. `ECHOBELL_WEBHOOK_URL` is exported in the same environment that launches Codex
2. the webhook URL is still valid
3. the agent has network access
4. the selected `notificationType` matches the urgency you expect

## The agent sends too many notifications

Tighten your prompt:

- ask for completion-only
- ask for failure-only
- ask for one final notification and no progress updates

## The payload is too noisy

Use a one-line title and one- or two-line body. Put large artifacts in a PR,
preview URL, log link, or dashboard, then attach that link instead of the raw
content.

