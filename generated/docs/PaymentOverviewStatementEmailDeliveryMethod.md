# Yookassa::PaymentOverviewStatementEmailDeliveryMethod

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **email** | **String** | Электронная почта пользователя для отправки справки. Адрес электронной почты должен соответствовать стандарту RFC 5322: https://www.ietf.org/rfc/rfc5322.txt. Пример: user@example.com. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentOverviewStatementEmailDeliveryMethod.new(
  email: user@yoomoney.ru
)
```

