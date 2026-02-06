# Yookassa::DeliveryMethodDataSms

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone** | **String** | Номер телефона, на который ЮKassa отправит смс со ссылкой на счет.  Указывается в формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164, например 79000000000. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::DeliveryMethodDataSms.new(
  phone: 79000000000
)
```

