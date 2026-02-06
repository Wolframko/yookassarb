# Yookassa::Recipient

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **gateway_id** | **String** | Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках одного аккаунта. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::Recipient.new(
  gateway_id: 456
)
```

