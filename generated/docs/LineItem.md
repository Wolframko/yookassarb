# Yookassa::LineItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** | Название товара или услуги (от 1 до 128 символов). Пользователь увидит его на странице счета перед оплатой. |  |
| **price** | [**MonetaryAmount**](MonetaryAmount.md) | Полная цена товара или услуги. Пользователь увидит ее на странице счета перед оплатой. |  |
| **discount_price** | [**MonetaryAmount**](MonetaryAmount.md) | Итоговая цена товара с учетом скидки. Если передана, то на странице счета цена отобразится с учетом скидки. Не нужно передавать, если пользователь оплачивает полную стоимость товара или услуги. | [optional] |
| **quantity** | **Float** | Количество товара. Можно передать целое или дробное число. Разделитель дробной части — точка, разделитель тысяч отсутствует, максимум три знака после точки. Пример: 5.000 |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::LineItem.new(
  description: null,
  price: null,
  discount_price: null,
  quantity: 1
)
```

