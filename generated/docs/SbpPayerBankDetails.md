# Yookassa::SbpPayerBankDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bank_id** | **String** | Идентификатор банка или платежного сервиса в СБП (НСПК). |  |
| **bic** | **String** | Банковский идентификационный код (БИК) банка или платежного сервиса. Используйте значение этого параметра, чтобы узнать дополнительные сведения об организации в Справочнике БИК: https://cbr.ru/PSystem/payment_system/?utm_source&#x3D;w&amp;utm_content&#x3D;page#a_101477. Например, так вы можете определить название банка. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::SbpPayerBankDetails.new(
  bank_id: 100000000111,
  bic: 044525225
)
```

