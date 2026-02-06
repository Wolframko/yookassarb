# Yookassa::SbpParticipantBank

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bank_id** | **String** | Идентификатор банка или платежного сервиса в СБП (НСПК). |  |
| **name** | **String** | Название банка или платежного сервиса в СБП. |  |
| **bic** | **String** | Банковский идентификационный код (БИК) банка или платежного сервиса. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::SbpParticipantBank.new(
  bank_id: 100000000111,
  name: Сбербанк,
  bic: 044525225
)
```

