# Yookassa::RefundSourcesDataPlatformFeeAmount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **value** | **String** | Сумма в выбранной валюте. Всегда дробное значение. Разделитель дробной части — точка, разделитель тысяч отсутствует. Количество знаков после точки зависит от выбранной валюты. Пример: 1000.00. |  |
| **currency** | [**CurrencyCode**](CurrencyCode.md) |  |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::RefundSourcesDataPlatformFeeAmount.new(
  value: 1000.00,
  currency: null
)
```

