# Yookassa::Payment

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Идентификатор платежа в ЮKassa. |  |
| **status** | [**PaymentStatus**](PaymentStatus.md) |  |  |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма платежа. Иногда партнеры ЮKassa берут с пользователя дополнительную комиссию, которая не входит в эту сумму. Сумма указывается с кодом валюты. Если вы разделяете потоки платежей, валюта платежа должна соответствовать валюте субаккаунта (recipient.gateway_id), если не разделяете — валюте аккаунта shopId в личном кабинете). |  |
| **income_amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма платежа, которую получит магазин, — значение amount за вычетом комиссии ЮKassa и суммы НДС с этой комиссии. Если вы партнер: https://yookassa.ru/developers/solutions-for-platforms/partners-api/basics и для аутентификации запросов используете OAuth-токен, запросите у магазина право: https://yookassa.ru/developers/solutions-for-platforms/partners-api/oauth/basics на получение информации о комиссиях при платежах. | [optional] |
| **description** | **String** | Описание транзакции (не более 128 символов), которое вы увидите в личном кабинете ЮKassa, а пользователь — при оплате. Например: «Оплата заказа № 72 для user@yoomoney.ru». | [optional] |
| **recipient** | [**PaymentRecipient**](PaymentRecipient.md) |  |  |
| **payment_method** | [**PaymentPaymentMethod**](PaymentPaymentMethod.md) |  | [optional] |
| **captured_at** | **Time** | Время подтверждения платежа. Указывается по UTC: https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. | [optional] |
| **created_at** | **Time** | Время создания заказа. Указывается по UTC: https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: 2017-11-03T11:52:31.827Z |  |
| **expires_at** | **Time** | Время, до которого вы можете бесплатно отменить или подтвердить платеж. В указанное время платеж в статусе waiting_for_capture будет автоматически отменен. Указывается по UTC: https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: 2017-11-03T11:52:31.827Z | [optional] |
| **confirmation** | [**PaymentConfirmation**](PaymentConfirmation.md) |  | [optional] |
| **test** | **Boolean** | Признак тестовой операции. |  |
| **refunded_amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма, которая вернулась пользователю. Присутствует, если у этого платежа есть успешные возвраты. | [optional] |
| **paid** | **Boolean** | Признак оплаты заказа. |  |
| **refundable** | **Boolean** | Возможность провести возврат по API. |  |
| **receipt_registration** | [**ReceiptRegistrationStatus**](ReceiptRegistrationStatus.md) | Статус регистрации чека. Возможные значения: pending — данные в обработке; succeeded — чек успешно зарегистрирован; canceled — чек зарегистрировать не удалось; если используете Чеки от ЮKassa: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics, обратитесь в техническую поддержку, в остальных случаях сформируйте чек вручную. Присутствует, если вы используете решения ЮKassa для отправки чеков в налоговую: https://yookassa.ru/developers/payment-acceptance/receipts/basics. | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Любые дополнительные данные, которые нужны вам для работы (например, ваш внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в формате UTF-8. | [optional] |
| **cancellation_details** | [**PaymentCancellationDetails**](PaymentCancellationDetails.md) |  | [optional] |
| **authorization_details** | [**AuthorizationDetails**](AuthorizationDetails.md) |  | [optional] |
| **transfers** | [**Array&lt;Transfer&gt;**](Transfer.md) | Данные о распределении денег — сколько и в какой магазин нужно перевести. Присутствует, если вы используете Сплитование платежей: https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics. | [optional] |
| **deal** | [**PaymentDealInfo**](PaymentDealInfo.md) | Данные о сделке, в составе которой проходит платеж. Присутствует, если вы проводите Безопасную сделку: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics. | [optional] |
| **merchant_customer_id** | **String** | Идентификатор покупателя в вашей системе, например электронная почта или номер телефона. Не более 200 символов. Присутствует, если вы хотите запомнить банковскую карту и отобразить ее при повторном платеже в виджете ЮKassa: https://yookassa.ru/developers/payment-acceptance/integration-scenarios/widget/basics. | [optional] |
| **invoice_details** | [**PaymentInvoiceDetails**](PaymentInvoiceDetails.md) |  | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::Payment.new(
  id: 1da5c87d-0984-50e8-a7f3-8de646dd9ec9,
  status: null,
  amount: null,
  income_amount: null,
  description: Оплата заказа № 72,
  recipient: null,
  payment_method: null,
  captured_at: 2017-11-03T11:52:31.827Z,
  created_at: 2017-11-03T11:52:31.827Z,
  expires_at: 2017-11-03T11:52:31.827Z,
  confirmation: null,
  test: false,
  refunded_amount: null,
  paid: true,
  refundable: true,
  receipt_registration: null,
  metadata: null,
  cancellation_details: null,
  authorization_details: null,
  transfers: null,
  deal: null,
  merchant_customer_id: user@test.merchant,
  invoice_details: null
)
```

