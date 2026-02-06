# Yookassa::SettlementRefundItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**SettlementItemType**](SettlementItemType.md) |  |  |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма, на которую необходимо уменьшить вознаграждение продавца. Должна быть меньше суммы возврата или равна ей. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::SettlementRefundItem.new(
  type: null,
  amount: null
)
```

