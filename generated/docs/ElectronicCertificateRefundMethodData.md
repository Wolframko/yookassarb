# Yookassa::ElectronicCertificateRefundMethodData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **electronic_certificate** | [**ElectronicCertificateRefundDataRequest**](ElectronicCertificateRefundDataRequest.md) |  | [optional] |
| **articles** | [**Array&lt;ElectronicCertificateRefundArticle&gt;**](ElectronicCertificateRefundArticle.md) | Корзина возврата (в терминах НСПК) — список возвращаемых товаров, для оплаты которых использовался электронный сертификат. Данные должны соответствовать товарам из одобренной корзины покупки (articles в объекте платежа: https://yookassa.ru/developers/api#payment_object). Необходимо передавать только при оплате на готовой странице ЮKassa: https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/ready-made-payment-form. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ElectronicCertificateRefundMethodData.new(
  electronic_certificate: null,
  articles: null
)
```

