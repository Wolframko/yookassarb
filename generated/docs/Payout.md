# Yookassa::Payout

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Идентификатор выплаты. |  |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма выплаты. |  |
| **status** | [**PayoutStatus**](PayoutStatus.md) |  |  |
| **payout_destination** | [**PayoutPayoutDestination**](PayoutPayoutDestination.md) |  |  |
| **description** | **String** | Описание транзакции (не более 128 символов). Например: «Выплата по договору 37». | [optional] |
| **created_at** | **Time** | Время создания выплаты. Указывается по UTC: https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: 2017-11-03T11:52:31.827Z |  |
| **succeeded_at** | **Time** | Время успешного проведения выплаты. Указывается по UTC: https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: 2017-11-03T11:52:42.312Z Обязательный параметр для выплат в статусе succeeded. | [optional] |
| **deal** | [**PayoutDeal**](PayoutDeal.md) |  | [optional] |
| **self_employed** | [**PayoutSelfEmployed**](PayoutSelfEmployed.md) |  | [optional] |
| **receipt** | [**IncomeReceipt**](IncomeReceipt.md) |  | [optional] |
| **cancellation_details** | [**PayoutCancellationDetails**](PayoutCancellationDetails.md) |  | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Любые дополнительные данные, которые нужны вам для работы (например, ваш внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в формате UTF-8. | [optional] |
| **test** | **Boolean** | Признак тестовой операции. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::Payout.new(
  id: po-27ced252-0025-5000-9000-0a682a8bab8f,
  amount: null,
  status: null,
  payout_destination: null,
  description: Оплата заказа № 72,
  created_at: 2020-07-03T11:52:31.827Z,
  succeeded_at: 2020-07-03T11:52:42.312Z,
  deal: null,
  self_employed: null,
  receipt: null,
  cancellation_details: null,
  metadata: null,
  test: false
)
```

