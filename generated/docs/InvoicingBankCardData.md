# Yookassa::InvoicingBankCardData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **first6** | **String** | Первые 6 цифр номера карты (BIN). |  |
| **last4** | **String** | Последние 4 цифры номера карты. |  |
| **expiry_year** | **String** | Срок действия, год, YYYY. |  |
| **expiry_month** | **String** | Срок действия, месяц, MM. |  |
| **card_type** | [**BankCardType**](BankCardType.md) |  |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::InvoicingBankCardData.new(
  first6: 427918,
  last4: 7918,
  expiry_year: 2017,
  expiry_month: 07,
  card_type: null
)
```

