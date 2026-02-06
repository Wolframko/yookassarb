# Yookassa::PersonalDataCancellationDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **party** | **String** | Участник процесса, который принял решение о прекращении хранения персональных данных. Возможное значение: yoo_money — ЮKassa. |  |
| **reason** | **String** | Причина прекращения хранения персональных данных. Возможное значение: expired_by_timeout — истек срок хранения или использования персональных данных. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PersonalDataCancellationDetails.new(
  party: null,
  reason: expired_by_timeout
)
```

