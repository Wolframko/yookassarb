# Yookassa::CardDataForPayoutDestination

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **number** | **String** | Номер банковской карты. Формат: только цифры, без пробелов. Пример: 5555555555554477 |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::CardDataForPayoutDestination.new(
  number: 5555555555554477
)
```

