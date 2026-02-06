# Yookassa::PaymentMethodDataSberBnpl

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone** | **String** | Номер телефона пользователя. Передается партнеру и используется для авторизации в сервисе «Плати частями». Максимум 15 символов. Указывается в формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164. Пример: 79000000000. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentMethodDataSberBnpl.new(
  phone: 79000000000
)
```

