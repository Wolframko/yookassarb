# Yookassa::ElectronicCertificatePayment

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма, которая спишется с электронного сертификата. |  |
| **basket_id** | **String** | Идентификатор корзины покупки, сформированной в НСПК. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ElectronicCertificatePayment.new(
  amount: null,
  basket_id: 110200010001100000000001
)
```

