# Yookassa::PaymentCancellationDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **party** | **String** | Участник процесса платежа, который принял решение об отмене транзакции. Может принимать значения yoo_money, payment_network и merchant. Подробнее про инициаторов отмены платежа: https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments#cancellation-details-party |  |
| **reason** | **String** | Причина отмены платежа. Перечень и описание возможных значений: https://yookassa.ru/developers/payment-acceptance/after-the-payment/declined-payments#cancellation-details-reason |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentCancellationDetails.new(
  party: null,
  reason: insufficient_funds
)
```

