# Yookassa::RefundSourcesData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Идентификатор магазина, для которого вы хотите провести возврат. Выдается ЮKassa, отображается в разделе Продавцы: https://yookassa.ru/my/marketplace/sellers личного кабинета (столбец shopId). |  |
| **amount** | [**RefundSourcesDataAmount**](RefundSourcesDataAmount.md) |  |  |
| **platform_fee_amount** | [**RefundSourcesDataPlatformFeeAmount**](RefundSourcesDataPlatformFeeAmount.md) |  | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::RefundSourcesData.new(
  account_id: 123,
  amount: null,
  platform_fee_amount: null
)
```

