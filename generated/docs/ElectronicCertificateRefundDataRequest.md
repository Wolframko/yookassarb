# Yookassa::ElectronicCertificateRefundDataRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма, которая вернется на электронный сертификат, — значение totalCertAmount, которое вы получили в ФЭС НСПК в запросе на предварительное одобрение возврата (Refund Pre-Auth): https://www.nspk.ru/developer/api-fes#tag/Protokol-FES-NSPK-v1/operation/preAuthReturn. |  |
| **basket_id** | **String** | Идентификатор корзины возврата, сформированной в НСПК, — значение returnBasketId, которое вы получили в ФЭС НСПК в запросе на предварительное одобрение возврата (Refund Pre-Auth): https://www.nspk.ru/developer/api-fes#tag/Protokol-FES-NSPK-v1/operation/preAuthReturn. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ElectronicCertificateRefundDataRequest.new(
  amount: null,
  basket_id: 110200010001100000000001
)
```

