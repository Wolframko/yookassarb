# Yookassa::TransferDataCapture

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Идентификатор магазина, в пользу которого вы принимаете оплату. Выдается ЮKassa, отображается в разделе Продавцы: https://yookassa.ru/my/marketplace/sellers личного кабинета (столбец shopId). |  |
| **amount** | [**TransferDataAmount**](TransferDataAmount.md) |  |  |
| **platform_fee_amount** | [**TransferPlatformFeeAmount**](TransferPlatformFeeAmount.md) |  | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::TransferDataCapture.new(
  account_id: 123,
  amount: null,
  platform_fee_amount: null
)
```

