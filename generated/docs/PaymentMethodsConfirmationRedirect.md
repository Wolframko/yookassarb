# Yookassa::PaymentMethodsConfirmationRedirect

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **confirmation_url** | **String** | URL, на который необходимо перенаправить пользователя для подтверждения привязки. |  |
| **enforce** | **Boolean** | Запрос на проведение привязки с аутентификацией по 3-D Secure. Будет работать, если оплату банковской картой вы по умолчанию принимаете без подтверждения платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет управлять ЮKassa. Если хотите принимать платежи и создавать привязки без дополнительного подтверждения пользователем, напишите вашему менеджеру ЮKassa. | [optional] |
| **return_url** | **String** | URL, на который вернется пользователь после подтверждения или отмены привязки на веб-странице. Не более 2048 символов. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentMethodsConfirmationRedirect.new(
  confirmation_url: null,
  enforce: true,
  return_url: null
)
```

