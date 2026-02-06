# Yookassa::PaymentPeriod

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **month** | **Integer** | Месяц периода. Например, 1 — январь. |  |
| **year** | **Integer** | Год периода. Значение должно быть в диапазоне 1920–2050. Например, 2025. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentPeriod.new(
  month: null,
  year: null
)
```

