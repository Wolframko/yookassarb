# Yookassa::IndustryDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **federal_id** | **String** | Идентификатор федерального органа исполнительной власти (тег в 54 ФЗ — 1262). |  |
| **document_date** | **Date** | Дата документа основания (тег в 54 ФЗ — 1263). Передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601 |  |
| **document_number** | **String** | Номер нормативного акта федерального органа исполнительной власти, регламентирующего порядок заполнения реквизита «значение отраслевого реквизита» (тег в 54 ФЗ — 1264). |  |
| **value** | **String** | Значение отраслевого реквизита (тег в 54 ФЗ — 1265). |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::IndustryDetails.new(
  federal_id: 001,
  document_date: Wed Nov 18 03:00:00 MSK 2020,
  document_number: null,
  value: 123/43
)
```

