# Payload Reference

## Minimal Completion Payload

```json
{
  "title": "Task finished",
  "body": "The requested work is done.",
  "notificationType": "active"
}
```

## Completion With Artifact Link

```json
{
  "title": "Preview ready",
  "body": "Build passed and the preview is live.",
  "notificationType": "time-sensitive",
  "linkUrl": "https://example.com/preview"
}
```

## Failure Payload

```json
{
  "title": "Validation failed",
  "body": "Typecheck failed in 3 files. See linked logs.",
  "notificationType": "calling",
  "linkUrl": "https://example.com/logs"
}
```

## Urgency Guidance

- `active`: normal completion, no hurry
- `time-sensitive`: the user should notice soon
- `calling`: use only when delayed action is expensive

