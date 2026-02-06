# Yookassa::RefundDealInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Идентификатор сделки. Берется из возвращаемого платежа. |  |
| **refund_settlements** | [**Array&lt;SettlementRefundArrayInner&gt;**](SettlementRefundArrayInner.md) | Данные о распределении денег. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::RefundDealInfo.new(
  id: dl-d68d2fe4-2abb-47e5-8112-32e28f87fb52,
  refund_settlements: null
)
```

