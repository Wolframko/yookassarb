# Yookassa::SbpRefundMethod

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sbp_operation_id** | **String** | Идентификатор операции в СБП (НСПК). Пример: 1027088AE4CB48CB81287833347A8777. Обязательный параметр для возвратов в статусе succeeded. В остальных случаях может отсутствовать. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::SbpRefundMethod.new(
  sbp_operation_id: 1027088AE4CB48CB81287833347A8777
)
```

