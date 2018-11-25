title: ELK

## Filebeat json

```yaml
filebeat.prospectors:
- enabled: true
  paths: [/opt/*.log]
  tags: [my-tag]
  multiline.pattern: '^{'
  multiline.negate: true
  multiline.match: after
  processors:
  - decode_json_fields:
      fields: ['message']
      target: json
```
