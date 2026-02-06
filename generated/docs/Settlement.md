# Yookassa::Settlement

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Тип расчета. Перечень возможных значений для Чеков от ЮKassa: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#settlement-type; для сторонних онлайн-касс: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#settlement-type. |  |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма расчета. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::Settlement.new(
  type: null,
  amount: null
)
```

