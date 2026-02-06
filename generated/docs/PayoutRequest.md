# Yookassa::PayoutRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма выплаты. Есть ограничения на минимальный и максимальный размер выплаты и сумму выплат за месяц. Подробнее о лимитах обычных выплат: https://yookassa.ru/developers/payouts/getting-started/payout-types-and-limits и выплат в рамках Безопасной сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/integration/payouts#specifics |  |
| **payout_destination_data** | [**PayoutRequestPayoutDestinationData**](PayoutRequestPayoutDestinationData.md) |  | [optional] |
| **payout_token** | **String** | Токенизированные данные для выплаты. Например, синоним банковской карты. Обязательный параметр, если не передан payout_destination_data или payment_method_id. | [optional] |
| **payment_method_id** | **String** | Идентификатор сохраненного способа оплаты, данные которого нужно использовать для проведения выплаты. Подробнее о выплатах с использованием идентификатора сохраненного способа оплаты: https://yookassa.ru/developers/payouts/scenario-extensions/multipurpose-token Обязательный параметр, если не передан payout_destination_data или payout_token. | [optional] |
| **description** | **String** | Описание транзакции (не более 128 символов). Например: «Выплата по договору 37». | [optional] |
| **deal** | [**PayoutDealInfo**](PayoutDealInfo.md) |  | [optional] |
| **personal_data** | [**Array&lt;PayoutsPersonalData&gt;**](PayoutsPersonalData.md) | Персональные данные получателя выплаты. Только для обычных выплат. Необходимо передавать в этих сценариях: выплаты с проверкой получателя: https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check (только для выплат через СБП); выплаты с передачей данных получателя для выписок из реестра: https://yookassa.ru/developers/payouts/scenario-extensions/recipient-data-send. В массиве можно одновременно передать несколько идентификаторов, но только для разных типов данных. | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Любые дополнительные данные, которые нужны вам для работы (например, ваш внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в формате UTF-8. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PayoutRequest.new(
  amount: null,
  payout_destination_data: null,
  payout_token: hoiCz_UVAdi_eKEthqhjRIJp.SC.001.202101,
  payment_method_id: 1da5c87d-0984-50e8-a7f3-8de646dd9ec9,
  description: Оплата заказа № 72,
  deal: null,
  personal_data: null,
  metadata: null
)
```

