# Yookassa::AirlineLeg

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **departure_airport** | **String** | Код аэропорта вылета по справочнику IATA: https://www.iata.org/publications/Pages/code-search.aspx, например LED. |  |
| **destination_airport** | **String** | Код аэропорта прилета по справочнику IATA: https://www.iata.org/publications/Pages/code-search.aspx, например AMS. |  |
| **departure_date** | **Date** | Дата вылета в формате YYYY-MM-DD по стандарту ISO 8601:2004: http://www.iso.org/iso/catalogue_detail?csnumber&#x3D;40874. |  |
| **carrier_code** | **String** | Код авиакомпании по справочнику IATA: https://www.iata.org/publications/Pages/code-search.aspx. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::AirlineLeg.new(
  departure_airport: LED,
  destination_airport: AMS,
  departure_date: Wed Jun 20 03:00:00 MSK 2018,
  carrier_code: SU
)
```

