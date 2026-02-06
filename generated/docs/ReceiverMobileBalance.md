# Yookassa::ReceiverMobileBalance

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone** | **String** | Номер телефона для пополнения. Максимум 15 символов. Указывается в формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164. Пример: 79000000000. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ReceiverMobileBalance.new(
  phone: 79000000000
)
```

