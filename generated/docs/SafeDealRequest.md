# Yookassa::SafeDealRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**DealType**](DealType.md) |  |  |
| **fee_moment** | [**FeeMoment**](FeeMoment.md) |  | [default to &#39;payment_succeeded&#39;] |
| **metadata** | **Hash&lt;String, String&gt;** | Любые дополнительные данные, которые нужны вам для работы (например, ваш внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в формате UTF-8. | [optional] |
| **description** | **String** | Описание сделки (не более 128 символов). Используется для фильтрации при получении списка сделок: https://yookassa.ru/developers/api#get_deals_list. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::SafeDealRequest.new(
  type: null,
  fee_moment: null,
  metadata: null,
  description: Оплата заказа № 72
)
```

