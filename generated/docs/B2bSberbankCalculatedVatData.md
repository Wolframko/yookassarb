# Yookassa::B2bSberbankCalculatedVatData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rate** | **String** | Налоговая ставка (в процентах). Возможные значения: 5, 7, 10, 20 и 22. С 1 января 2026 года ставка НДС 22% применяется вместо ставки 20%. |  |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма НДС. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::B2bSberbankCalculatedVatData.new(
  rate: 22,
  amount: null
)
```

