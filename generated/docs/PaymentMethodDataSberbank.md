# Yookassa::PaymentMethodDataSberbank

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone** | **String** | Телефон пользователя, на который зарегистрирован аккаунт в SberPay. Необходим для подтверждения оплаты по смс (сценарий подтверждения external). Указывается в формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164, например 79000000000. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentMethodDataSberbank.new(
  phone: 79000000000
)
```

