# Yookassa::PaymentMethodDataMobileBalance

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone** | **String** | Телефон, с баланса которого осуществляется платеж. Указывается в формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164, например 79000000000. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentMethodDataMobileBalance.new(
  phone: 79000000000
)
```

