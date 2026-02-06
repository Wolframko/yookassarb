# Yookassa::PaymentMethodDataCash

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone** | **String** | Телефон пользователя, на который придет смс с кодом платежа (для внесения наличных). Указывается в формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164, например 79000000000. Поле можно оставить пустым: пользователь сможет заполнить его при оплате на стороне ЮKassa. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentMethodDataCash.new(
  phone: 79000000000
)
```

