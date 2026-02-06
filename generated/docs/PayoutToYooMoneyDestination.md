# Yookassa::PayoutToYooMoneyDestination

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_number** | **String** | Номер кошелька ЮMoney, например 41001614575714. Длина — от 11 до 33 цифр. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PayoutToYooMoneyDestination.new(
  account_number: 41001614575714
)
```

