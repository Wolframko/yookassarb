# Yookassa::ElectronicCertificatePaymentData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма, которую необходимо использовать по электронному сертификату, — значение totalCertAmount, которое вы получили в ФЭС НСПК в запросе на предварительное одобрение использования сертификата (Pre-Auth): https://www.nspk.ru/developer/api-fes#operation/preAuthPurchase. Сумма должна быть не больше общей суммы платежа (amount). |  |
| **basket_id** | **String** | Идентификатор корзины покупки, сформированной в НСПК, — значение purchaseBasketId, которое вы получили в ФЭС НСПК в запросе на предварительное одобрение использования сертификата (Pre-Auth): https://www.nspk.ru/developer/api-fes#operation/preAuthPurchase. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ElectronicCertificatePaymentData.new(
  amount: null,
  basket_id: 110200010001100000000001
)
```

