# Yookassa::ConfirmationDataMobileApplication

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **return_url** | **String** | URL или диплинк, на который вернется пользователь после подтверждения или отмены платежа в приложении. Если платеж делали из мобильной версии сайта, передайте URL, если из мобильного приложения — диплинк. Не более 255 символов для платежей через SberPay: https://yookassa.ru/developers/payment-acceptance/integration-scenarios/manual-integration/sberpay#create-payment-mobile-application. Для других способов оплаты: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods#all не более 2048 символов. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ConfirmationDataMobileApplication.new(
  return_url: null
)
```

