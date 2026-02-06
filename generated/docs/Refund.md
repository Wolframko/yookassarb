# Yookassa::Refund

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Идентификатор возврата платежа в ЮKassa. |  |
| **payment_id** | **String** | Идентификатор платежа в ЮKassa. |  |
| **status** | [**RefundStatus**](RefundStatus.md) |  |  |
| **cancellation_details** | [**RefundCancellationDetails**](RefundCancellationDetails.md) |  | [optional] |
| **receipt_registration** | [**ReceiptRegistrationStatus**](ReceiptRegistrationStatus.md) | Статус регистрации чека. Возможные значения: pending — данные в обработке; succeeded — чек успешно зарегистрирован; canceled — чек зарегистрировать не удалось; если используете Чеки от ЮKassa: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics, обратитесь в техническую поддержку, в остальных случаях сформируйте чек вручную. Присутствует, если вы используете решения ЮKassa для отправки чеков в налоговую: https://yookassa.ru/developers/payment-acceptance/receipts/basics. | [optional] |
| **created_at** | **Time** | Время создания возврата. Указывается по UTC: https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601, например 2017-11-03T11:52:31.827Z |  |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма, возвращенная пользователю. |  |
| **description** | **String** | Основание для возврата денег пользователю. | [optional] |
| **sources** | [**Array&lt;RefundSourcesData&gt;**](RefundSourcesData.md) | Данные о том, с какого магазина и какую сумму нужно удержать для проведения возврата. Присутствует, если вы используете Сплитование платежей: https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics. | [optional] |
| **deal** | [**RefundDealInfo**](RefundDealInfo.md) |  | [optional] |
| **refund_method** | [**RefundRefundMethod**](RefundRefundMethod.md) |  | [optional] |
| **refund_authorization_details** | [**RefundAuthorizationDetails**](RefundAuthorizationDetails.md) |  | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Любые дополнительные данные, которые нужны вам для работы (например, ваш внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в формате UTF-8. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::Refund.new(
  id: 1ddd77af-0bd7-500d-895b-c475c55fdefc,
  payment_id: 1da5c87d-0984-50e8-a7f3-8de646dd9ec9,
  status: null,
  cancellation_details: null,
  receipt_registration: null,
  created_at: 2017-11-03T11:52:31.827Z,
  amount: null,
  description: null,
  sources: null,
  deal: null,
  refund_method: null,
  refund_authorization_details: null,
  metadata: null
)
```

