# Yookassa::PaymentMethodSberbank

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone** | **String** | Телефон пользователя, на который зарегистрирован аккаунт в SberPay. Указывается в формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164, например 79000000000. | [optional] |
| **card** | [**InvoicingBankCardData**](InvoicingBankCardData.md) |  | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentMethodSberbank.new(
  phone: 79000000000,
  card: null
)
```

