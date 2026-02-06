# Yookassa::ElectronicCertificateArticle

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **article_number** | **Integer** | Порядковый номер товара в корзине. От 1 до 999 включительно. |  |
| **tru_code** | **String** | Код ТРУ. 30 символов, две группы цифр, разделенные точкой. Формат: NNNNNNNNN.NNNNNNNNNYYYYMMMMZZZ, где NNNNNNNNN.NNNNNNNNN — код вида ТРУ по Перечню ТРУ: https://esnsi.gosuslugi.ru/classifiers/10616/data?pg&#x3D;1&amp;p&#x3D;1, YYYY — код производителя, MMMM — код модели, ZZZ — код страны производителя. Пример: 329921120.06001010200080001643 Как сформировать код ТРУ: https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/electronic-certificate/basics#payments-preparations-tru-code |  |
| **article_code** | **String** | Код товара в вашей системе. Максимум 128 символов. | [optional] |
| **article_name** | **String** | Название товара в вашей системе. Отображается на готовой платежной форме ЮKassa. Максимум 128 символов. |  |
| **quantity** | **Integer** | Количество единиц товара. Формат: целое положительное число. |  |
| **price** | [**MonetaryAmount**](MonetaryAmount.md) | Цена за единицу товара. |  |
| **metadata** | **Hash&lt;String, String&gt;** | Любые дополнительные данные, которые нужны вам для работы (например, ваш внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в формате UTF-8. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ElectronicCertificateArticle.new(
  article_number: 1,
  tru_code: 329921120.06001010200080001643,
  article_code: 432,
  article_name: Item #432,
  quantity: 4,
  price: null,
  metadata: null
)
```

