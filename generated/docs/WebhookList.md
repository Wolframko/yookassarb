# Yookassa::WebhookList

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Формат выдачи результатов запроса. Возможное значение: list (список). |  |
| **items** | [**Array&lt;Webhook&gt;**](Webhook.md) |  |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::WebhookList.new(
  type: null,
  items: null
)
```

