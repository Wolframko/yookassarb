# Yookassa::BankCardData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **first6** | **String** | Первые 6 цифр номера карты (BIN). При оплате картой, сохраненной в ЮKassa: https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics и других сервисах, переданный BIN может не соответствовать значениям last4, expiry_year, expiry_month. | [optional] |
| **last4** | **String** | Последние 4 цифры номера карты. |  |
| **expiry_year** | **String** | Срок действия, год, YYYY. |  |
| **expiry_month** | **String** | Срок действия, месяц, MM. |  |
| **card_type** | [**BankCardType**](BankCardType.md) |  |  |
| **card_product** | [**BankCardProduct**](BankCardProduct.md) |  | [optional] |
| **issuer_country** | **String** | Код страны, в которой выпущена карта. Передается в формате ISO-3166 alpha-2: https://www.iso.org/obp/ui/#iso:pub:PUB500001:en. Пример: RU. | [optional] |
| **issuer_name** | **String** | Наименование банка, выпустившего карту. | [optional] |
| **source** | [**BankCardDataSource**](BankCardDataSource.md) |  | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::BankCardData.new(
  first6: 427918,
  last4: 7918,
  expiry_year: 2017,
  expiry_month: 07,
  card_type: null,
  card_product: null,
  issuer_country: RU,
  issuer_name: Sberbank,
  source: null
)
```

