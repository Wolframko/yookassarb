# Yookassa::RefundRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_id** | **String** | Идентификатор платежа в ЮKassa. |  |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма, которую нужно вернуть пользователю. Сумма указывается с кодом валюты. Если вы разделяете потоки платежей, валюта возврата должна соответствовать валюте субаккаунта, которая была указана для платежа (recipient.gateway_id), если не разделяете — валюте аккаунта shopId в личном кабинете). |  |
| **description** | **String** | Комментарий к возврату, основание для возврата денег пользователю. | [optional] |
| **receipt** | [**ReceiptData**](ReceiptData.md) |  | [optional] |
| **sources** | [**Array&lt;RefundSourcesData&gt;**](RefundSourcesData.md) | Данные о том, с какого магазина и какую сумму нужно удержать для проведения возврата. Необходимо передавать, если вы используете Сплитование платежей: https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics. Сейчас в этом параметре можно передать данные только одного магазина. | [optional] |
| **deal** | [**RefundDealData**](RefundDealData.md) |  | [optional] |
| **refund_method_data** | [**ElectronicCertificateRefundMethodData**](ElectronicCertificateRefundMethodData.md) |  | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Любые дополнительные данные, которые нужны вам для работы (например, ваш внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в формате UTF-8. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::RefundRequest.new(
  payment_id: 1da5c87d-0984-50e8-a7f3-8de646dd9ec9,
  amount: null,
  description: null,
  receipt: null,
  sources: null,
  deal: null,
  refund_method_data: null,
  metadata: null
)
```

