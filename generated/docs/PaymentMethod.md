# Yookassa::PaymentMethod

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**PaymentMethodType**](PaymentMethodType.md) |  |  |
| **id** | **String** | Идентификатор способа оплаты. |  |
| **saved** | **Boolean** | Признак сохранения способа оплаты для автоплатежей: https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/pay-with-saved. Возможные значения: true — способ оплаты сохранен для автоплатежей и выплат; false — способ оплаты не сохранен. |  |
| **status** | [**PaymentMethodStatus**](PaymentMethodStatus.md) | Статус проверки и сохранения способа оплаты. Возможные значения: pending — ожидает действий от пользователя; active — способ оплаты сохранен, его можно использовать для автоплатежей или выплат; inactive — способ оплаты не сохранен: возникла ошибка или не было попытки сохранения способа оплаты. |  |
| **title** | **String** | Название способа оплаты. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentMethod.new(
  type: null,
  id: 1da5c87d-0984-50e8-a7f3-8de646dd9ec9,
  saved: true,
  status: null,
  title: Основная карта
)
```

