# Yookassa::SavePaymentMethod

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**SavePaymentMethodType**](SavePaymentMethodType.md) |  |  |
| **id** | **String** | Идентификатор сохраненного способа оплаты. |  |
| **saved** | **Boolean** | Признак сохранения способа оплаты для автоплатежей: https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/pay-with-saved. Возможные значения: true — способ оплаты сохранен для автоплатежей и выплат; false — способ оплаты не сохранен. |  |
| **status** | [**PaymentMethodStatus**](PaymentMethodStatus.md) |  |  |
| **holder** | [**SavePaymentMethodHolder**](SavePaymentMethodHolder.md) |  |  |
| **title** | **String** | Название способа оплаты. | [optional] |
| **confirmation** | [**PaymentMethodsConfirmationRedirect**](PaymentMethodsConfirmationRedirect.md) |  | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::SavePaymentMethod.new(
  type: null,
  id: 1da5c87d-0984-50e8-a7f3-8de646dd9ec9,
  saved: true,
  status: null,
  holder: null,
  title: Основная карта,
  confirmation: null
)
```

