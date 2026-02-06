# Yookassa::PayoutCancellationDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **party** | **String** | Участник процесса выплаты, который принял решение об отмене транзакции. Перечень инициаторов отмены выплаты: для обычных выплат: https://yookassa.ru/developers/payouts/after-the-payout/declined-payouts#cancellation-details-party, для выплат в рамках Безопасной сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/integration/payouts#declined-payouts-cancellation-details-party. |  |
| **reason** | **String** | Причина отмены выплаты. Перечень и описание возможных значений: для обычных выплат: https://yookassa.ru/developers/payouts/after-the-payout/declined-payouts#cancellation-details-reason, для выплат в рамках Безопасной сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/integration/payouts#declined-payouts-cancellation-details-reason. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PayoutCancellationDetails.new(
  party: null,
  reason: insufficient_funds
)
```

