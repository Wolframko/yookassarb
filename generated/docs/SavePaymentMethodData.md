# Yookassa::SavePaymentMethodData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** |  |  |
| **holder** | [**Recipient**](Recipient.md) | Данные магазина, для которого сохраняется способ оплаты. | [optional] |
| **client_ip** | **String** | IPv4 или IPv6-адрес пользователя. Если не указан, используется IP-адрес TCP-подключения. | [optional] |
| **confirmation** | [**PaymentMethodsConfirmationAttrsRedirect**](PaymentMethodsConfirmationAttrsRedirect.md) |  | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::SavePaymentMethodData.new(
  type: null,
  holder: null,
  client_ip: null,
  confirmation: null
)
```

