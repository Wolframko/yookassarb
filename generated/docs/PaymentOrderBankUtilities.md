# Yookassa::PaymentOrderBankUtilities

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Название банка получателя. Максимум 45 символов. |  |
| **bic** | **String** | БИК банка получателя. |  |
| **account** | **String** | Счет получателя в банке. |  |
| **correspondent_account** | **String** | Корреспондентский счет банка получателя. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentOrderBankUtilities.new(
  name: null,
  bic: null,
  account: null,
  correspondent_account: null
)
```

