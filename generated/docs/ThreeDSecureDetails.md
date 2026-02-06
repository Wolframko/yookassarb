# Yookassa::ThreeDSecureDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **applied** | **Boolean** | Отображение пользователю формы для прохождения аутентификации по 3‑D Secure. Возможные значения: true — ЮKassa отобразила пользователю форму, чтобы он мог пройти аутентификацию по 3‑D Secure; false — платеж проходил без аутентификации по 3‑D Secure. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ThreeDSecureDetails.new(
  applied: true
)
```

