# Yookassa::ReceiverBankAccount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_number** | **String** | Номер банковского счета. Формат — 20 символов. |  |
| **bic** | **String** | Банковский идентификационный код (БИК) банка, в котором открыт счет. Формат — 9 символов. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ReceiverBankAccount.new(
  account_number: 40817810099910004312,
  bic: 044525974
)
```

