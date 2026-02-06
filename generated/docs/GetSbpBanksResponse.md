# Yookassa::GetSbpBanksResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | **String** | Формат выдачи результатов запроса. Возможное значение: list (список). |  |
| **items** | [**Array&lt;SbpParticipantBank&gt;**](SbpParticipantBank.md) |  |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::GetSbpBanksResponse.new(
  type: null,
  items: null
)
```

