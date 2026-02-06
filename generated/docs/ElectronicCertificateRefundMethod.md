# Yookassa::ElectronicCertificateRefundMethod

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **electronic_certificate** | [**ElectronicCertificateRefundDataResponse**](ElectronicCertificateRefundDataResponse.md) |  | [optional] |
| **articles** | [**Array&lt;ElectronicCertificateRefundArticle&gt;**](ElectronicCertificateRefundArticle.md) | Корзина возврата — список возвращаемых товаров, для оплаты которых использовался электронный сертификат. Присутствует, если оплата была на готовой странице ЮKassa: https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ElectronicCertificateRefundMethod.new(
  electronic_certificate: null,
  articles: null
)
```

