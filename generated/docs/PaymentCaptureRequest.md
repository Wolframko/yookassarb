# Yookassa::PaymentCaptureRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Итоговая сумма, которая спишется с пользователя. Можно указать часть исходной суммы, тогда остаток вернется пользователю. Для этого проверьте, что выбранный способ оплаты поддерживает частичное списание: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-partly. Сумма указывается с кодом валюты. Если вы разделяете потоки платежей, валюта платежа должна соответствовать валюте субаккаунта (recipient.gateway_id), если не разделяете — валюте аккаунта shopId в личном кабинете). | [optional] |
| **receipt** | [**ReceiptData**](ReceiptData.md) |  | [optional] |
| **airline** | [**Airline**](Airline.md) | Объект с данными для продажи авиабилетов. Используется только для платежей банковской картой. | [optional] |
| **transfers** | [**Array&lt;TransferDataCapture&gt;**](TransferDataCapture.md) | Данные об актуальном распределении денег — сколько и в какой магазин нужно перевести. Необходимо передавать, если вы используете Сплитование платежей: https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics и подтверждаете часть платежа. | [optional] |
| **deal** | [**CapturePaymentDeal**](CapturePaymentDeal.md) |  | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentCaptureRequest.new(
  amount: null,
  receipt: null,
  airline: null,
  transfers: null,
  deal: null
)
```

