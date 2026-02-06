# Yookassa::ConfirmationRedirect

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enforce** | **Boolean** | Запрос на проведение платежа с аутентификацией по 3-D Secure. Будет работать, если оплату банковской картой вы по умолчанию принимаете без подтверждения платежа пользователем. В остальных случаях аутентификацией по 3-D Secure будет управлять ЮKassa. Если хотите принимать платежи без дополнительного подтверждения пользователем, напишите вашему менеджеру ЮKassa. | [optional][default to false] |
| **return_url** | **String** | URL, на который вернется пользователь после подтверждения или отмены платежа на веб-странице. Не более 2048 символов. | [optional] |
| **confirmation_url** | **String** | URL, на который необходимо перенаправить пользователя для подтверждения оплаты. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ConfirmationRedirect.new(
  enforce: true,
  return_url: null,
  confirmation_url: null
)
```

