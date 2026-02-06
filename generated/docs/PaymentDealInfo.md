# Yookassa::PaymentDealInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Идентификатор сделки. |  |
| **settlements** | [**Array&lt;SettlementPaymentArrayInner&gt;**](SettlementPaymentArrayInner.md) | Данные о распределении денег. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentDealInfo.new(
  id: dl-d68d2fe4-2abb-47e5-8112-32e28f87fb52,
  settlements: null
)
```

