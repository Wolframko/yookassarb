# Yookassa::CardRequestData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **number** | **String** | Номер банковской карты. |  |
| **expiry_year** | **String** | Срок действия, год, YYYY. |  |
| **expiry_month** | **String** | Срок действия, месяц, MM. |  |
| **cardholder** | **String** | Имя владельца карты. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::CardRequestData.new(
  number: 5105105105105100,
  expiry_year: 2017,
  expiry_month: 07,
  cardholder: John Smith
)
```

