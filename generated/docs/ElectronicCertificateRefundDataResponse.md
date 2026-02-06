# Yookassa::ElectronicCertificateRefundDataResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **basket_id** | **String** | Идентификатор корзины возврата, сформированной в НСПК. |  |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма, которая вернется на электронный сертификат. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ElectronicCertificateRefundDataResponse.new(
  basket_id: 110200010001100000000001,
  amount: null
)
```

