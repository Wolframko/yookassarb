# Yookassa::PaymentDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Идентификатор платежа в ЮKassa. |  |
| **status** | [**PaymentStatus**](PaymentStatus.md) | Статус платежа. Возможные значения: waiting_for_capture — для платежей в две стадии: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-and-cancel: платеж оплачен, деньги авторизованы, вам необходимо списать оплату или отменить платеж; succeeded — платеж успешно завершен, деньги будут перечислены на ваш расчетный счет в соответствии с вашим договором с ЮKassa (финальный и неизменяемый статус); canceled — для платежей в две стадии: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-and-cancel: вы отменили платеж по API (финальный и неизменяемый статус). |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentDetails.new(
  id: 1da5c87d-0984-50e8-a7f3-8de646dd9ec9,
  status: null
)
```

