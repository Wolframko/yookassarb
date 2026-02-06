# Yookassa::DeliveryMethodDataEmail

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **email** | **String** | Адрес электронной почты, на который ЮKassa отправит письмо со ссылкой на счет. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::DeliveryMethodDataEmail.new(
  email: user@yoomoney.ru
)
```

