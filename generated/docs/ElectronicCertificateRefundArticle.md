# Yookassa::ElectronicCertificateRefundArticle

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **article_number** | **Integer** | Порядковый номер товара в корзине возврата. От 1 до 999 включительно. |  |
| **payment_article_number** | **Integer** | Порядковый номер товара в одобренной корзине покупки (article_number в объекте платежа: https://yookassa.ru/developers/api#payment_object). От 1 до 999 включительно. |  |
| **tru_code** | **String** | Код ТРУ. 30 символов, две группы цифр, разделенные точкой. Формат: NNNNNNNNN.NNNNNNNNNYYYYMMMMZZZ, где NNNNNNNNN.NNNNNNNNN — код вида ТРУ по Перечню ТРУ: https://esnsi.gosuslugi.ru/classifiers/10616/data?pg&#x3D;1&amp;p&#x3D;1, YYYY — код производителя, MMMM — код модели, ZZZ — код страны производителя. Пример: 329921120.06001010200080001643 Как сформировать код ТРУ: https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/basics#payments-preparations-tru-code |  |
| **quantity** | **Integer** | Количество возвращаемых единиц товара. Формат: целое положительное число. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ElectronicCertificateRefundArticle.new(
  article_number: 1,
  payment_article_number: 1,
  tru_code: 329921120.06001010200080001643,
  quantity: 10
)
```

