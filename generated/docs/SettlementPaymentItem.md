# Yookassa::SettlementPaymentItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**SettlementItemType**](SettlementItemType.md) |  |  |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма вознаграждения продавца. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::SettlementPaymentItem.new(
  type: null,
  amount: null
)
```

