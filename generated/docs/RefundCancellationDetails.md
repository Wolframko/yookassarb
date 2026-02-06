# Yookassa::RefundCancellationDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **party** | **String** | Участник процесса возврата, который принял решение отменить транзакцию. Перечень и описание возможных значений: https://yookassa.ru/developers/payment-acceptance/after-the-payment/refunds#declined-refunds-cancellation-details-party |  |
| **reason** | **String** | Причина отмены возврата. Перечень и описание возможных значений: https://yookassa.ru/developers/payment-acceptance/after-the-payment/refunds#declined-refunds-cancellation-details-reason |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::RefundCancellationDetails.new(
  party: yoo_money,
  reason: yoo_money_account_closed
)
```

