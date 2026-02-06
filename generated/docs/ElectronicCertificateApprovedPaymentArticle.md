# Yookassa::ElectronicCertificateApprovedPaymentArticle

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **article_number** | **Integer** | Порядковый номер товара в корзине. От 1 до 999 включительно. |  |
| **tru_code** | **String** | Код ТРУ. 30 символов, две группы цифр, разделенные точкой. Формат: NNNNNNNNN.NNNNNNNNNYYYYMMMMZZZ, где NNNNNNNNN.NNNNNNNNN — код вида ТРУ по Перечню ТРУ: https://esnsi.gosuslugi.ru/classifiers/10616/data?pg&#x3D;1&amp;p&#x3D;1, YYYY — код производителя, MMMM — код модели, ZZZ — код страны производителя. Пример: 329921120.06001010200080001643 Как сформировать код ТРУ: https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/basics#payments-preparations-tru-code |  |
| **article_code** | **String** | Код товара в вашей системе. Максимум 128 символов. | [optional] |
| **certificates** | [**Array&lt;ElectronicCertificate&gt;**](ElectronicCertificate.md) | Список электронных сертификатов, которые используются для оплаты покупки. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ElectronicCertificateApprovedPaymentArticle.new(
  article_number: 1,
  tru_code: 329921120.06001010200080001643,
  article_code: 432,
  certificates: null
)
```

