# Yookassa::PayoutCardData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **first6** | **String** | Первые 6 цифр номера карты (BIN). |  |
| **last4** | **String** | Последние 4 цифры номера карты. |  |
| **card_type** | [**BankCardType**](BankCardType.md) |  |  |
| **issuer_country** | **String** | Код страны, в которой выпущена карта. Передается в формате ISO-3166 alpha-2: https://www.iso.org/obp/ui/#iso:pub:PUB500001:en. Пример: RU. | [optional] |
| **issuer_name** | **String** | Наименование банка, выпустившего карту. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PayoutCardData.new(
  first6: 427918,
  last4: 7918,
  card_type: null,
  issuer_country: RU,
  issuer_name: Sberbank
)
```

