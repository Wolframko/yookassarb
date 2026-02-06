# Yookassa::PaymentMethodDataElectronicCertificate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **card** | [**CardRequestDataWithCsc**](CardRequestDataWithCsc.md) |  | [optional] |
| **electronic_certificate** | [**ElectronicCertificatePaymentData**](ElectronicCertificatePaymentData.md) |  | [optional] |
| **articles** | [**Array&lt;ElectronicCertificateArticle&gt;**](ElectronicCertificateArticle.md) | Корзина покупки (в терминах НСПК) — список товаров, которые можно оплатить по сертификату. Необходимо передавать только при оплате на готовой странице ЮKassa: https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentMethodDataElectronicCertificate.new(
  card: null,
  electronic_certificate: null,
  articles: null
)
```

