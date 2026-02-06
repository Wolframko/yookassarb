# Yookassa::PaymentMethodsConfirmationAttrsRedirect

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enforce** | **Boolean** | Запрос на проведение привязки с аутентификацией по 3-D Secure. Будет работать, если оплату банковской картой вы по умолчанию принимаете без подтверждения платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет управлять ЮKassa. Если хотите принимать платежи и создавать привязки без дополнительного подтверждения пользователем, напишите вашему менеджеру ЮKassa. | [optional] |
| **return_url** | **String** | URL, на который вернется пользователь после подтверждения или отмены привязки на веб-странице. Не более 2048 символов. |  |
| **locale** | [**Locale**](Locale.md) |  | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentMethodsConfirmationAttrsRedirect.new(
  enforce: true,
  return_url: null,
  locale: null
)
```

