# Yookassa::PaymentMethodYooMoney

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_number** | **String** | Номер кошелька ЮMoney, из которого заплатил пользователь. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentMethodYooMoney.new(
  account_number: 41001184120504
)
```

