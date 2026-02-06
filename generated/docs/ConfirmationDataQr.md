# Yookassa::ConfirmationDataQr

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **return_url** | **String** | Адрес страницы, на которую пользователь вернется после подтверждения или отмены платежа в приложении банка. Например, если хотите вернуть пользователя на сайт, вы можете передать URL, если в мобильное приложение — диплинк. URI должен соответствовать стандарту RFC-3986: https://www.ietf.org/rfc/rfc3986.txt. Не более 2048 символов. Доступно только для платежей через СБП: https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/other/sbp. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ConfirmationDataQr.new(
  return_url: null
)
```

