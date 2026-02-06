# Yookassa::AirlinePassenger

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **first_name** | **String** | Имя пассажира. Необходимо использовать латинские буквы, например SERGEI. |  |
| **last_name** | **String** | Фамилия пассажира. Необходимо использовать латинские буквы, например IVANOV. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::AirlinePassenger.new(
  first_name: SERGEI,
  last_name: IVANOV
)
```

