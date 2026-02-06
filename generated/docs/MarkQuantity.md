# Yookassa::MarkQuantity

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **numerator** | **Integer** | Числитель — количество продаваемых товаров из одной потребительской упаковки (тег в 54 ФЗ — 1293). Не может превышать denominator. |  |
| **denominator** | **Integer** | Знаменатель — общее количество товаров в потребительской упаковке (тег в 54 ФЗ — 1294). |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::MarkQuantity.new(
  numerator: 1,
  denominator: 100
)
```

