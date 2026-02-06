# Yookassa::SbpPayoutRecipientPersonalDataRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **last_name** | **String** | Фамилия пользователя. |  |
| **first_name** | **String** | Имя пользователя. |  |
| **middle_name** | **String** | Отчество пользователя. Обязательный параметр, если есть в паспорте. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::SbpPayoutRecipientPersonalDataRequest.new(
  last_name: Иванов,
  first_name: Иван,
  middle_name: Иванович
)
```

