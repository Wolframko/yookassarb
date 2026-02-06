# Yookassa::PaymentMethodElectronicCertificate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **card** | [**BankCardData**](BankCardData.md) | Данные банковской карты «Мир». | [optional] |
| **electronic_certificate** | [**ElectronicCertificatePayment**](ElectronicCertificatePayment.md) |  | [optional] |
| **articles** | [**Array&lt;ElectronicCertificateApprovedPaymentArticle&gt;**](ElectronicCertificateApprovedPaymentArticle.md) | Одобренная корзина покупки — список товаров, одобренных к оплате по электронному сертификату. Присутствует только при оплате на готовой странице ЮKassa: https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentMethodElectronicCertificate.new(
  card: null,
  electronic_certificate: null,
  articles: null
)
```

