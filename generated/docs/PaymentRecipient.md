# Yookassa::PaymentRecipient

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Идентификатор магазина в ЮKassa. |  |
| **gateway_id** | **String** | Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках одного аккаунта. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentRecipient.new(
  account_id: 123,
  gateway_id: 456
)
```

