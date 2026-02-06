# Yookassa::PaymentList

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Формат выдачи результатов запроса. Возможное значение: list (список). |  |
| **items** | [**Array&lt;Payment&gt;**](Payment.md) |  |  |
| **next_cursor** | **String** | Указатель на следующий фрагмент списка. Обязательный параметр, если размер списка больше размера выдачи (limit) и конец выдачи не достигнут. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentList.new(
  type: null,
  items: null,
  next_cursor: 37a5c87d-3984-51e8-a7f3-8de646d39ec15
)
```

