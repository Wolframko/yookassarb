# Yookassa::Error

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Тип объекта. | [optional] |
| **id** | **String** | Идентификатор ошибки. Используйте его, если возникла необходимость обратиться в техническую поддержку. | [optional] |
| **description** | **String** | Подробное описание ошибки. | [optional] |
| **parameter** | **String** | Название параметра, из-за которого произошла ошибка. | [optional] |
| **retry_after** | **Integer** | Рекомендуемое количество миллисекунд, спустя которое следует повторить запрос. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::Error.new(
  type: null,
  id: ecf255db-cce8-4f15-8fc2-3d7a4678c867,
  description: Invalid API key provided,
  parameter: payment_method,
  retry_after: 1800
)
```

