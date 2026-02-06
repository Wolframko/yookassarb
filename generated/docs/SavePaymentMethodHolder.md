# Yookassa::SavePaymentMethodHolder

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Идентификатор магазина в ЮKassa. |  |
| **gateway_id** | **String** | Идентификатор субаккаунта. Используется для разделения потоков платежей в рамках одного аккаунта. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::SavePaymentMethodHolder.new(
  account_id: 123,
  gateway_id: 456
)
```

