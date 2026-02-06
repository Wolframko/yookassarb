# Yookassa::PayoutStatementRecipientPersonalDataRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **last_name** | **String** | Фамилия пользователя. |  |
| **first_name** | **String** | Имя пользователя. |  |
| **middle_name** | **String** | Отчество пользователя. Обязательный параметр, если есть в паспорте. | [optional] |
| **birthdate** | **Date** | Дата рождения. Передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601 |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PayoutStatementRecipientPersonalDataRequest.new(
  last_name: Иванов,
  first_name: Иван,
  middle_name: Иванович,
  birthdate: Wed Nov 18 03:00:00 MSK 2020
)
```

