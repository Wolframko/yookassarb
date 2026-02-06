# Yookassa::Transfer

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Идентификатор магазина, в пользу которого вы принимаете оплату. Выдается ЮKassa, отображается в разделе Продавцы: https://yookassa.ru/my/marketplace/sellers личного кабинета (столбец shopId). |  |
| **amount** | [**TransferAmount**](TransferAmount.md) |  |  |
| **status** | [**TransferStatus**](TransferStatus.md) |  |  |
| **platform_fee_amount** | [**TransferPlatformFeeAmount**](TransferPlatformFeeAmount.md) |  | [optional] |
| **description** | **String** | Описание транзакции (не более 128 символов), которое продавец увидит в личном кабинете ЮKassa. Например: «Заказ маркетплейса №72». | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Любые дополнительные данные, которые нужны вам для работы (например, ваш внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в формате UTF-8. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::Transfer.new(
  account_id: 123,
  amount: null,
  status: null,
  platform_fee_amount: null,
  description: Заказ маркетплейса №72,
  metadata: null
)
```

