# Yookassa::ConfirmationEmbedded

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **confirmation_token** | **String** | Токен для инициализации платежного виджета ЮKassa: https://yookassa.ru/developers/payment-acceptance/integration-scenarios/widget/basics. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ConfirmationEmbedded.new(
  confirmation_token: ct-22e12f66-000f-5000-8000-18db351245c7
)
```

