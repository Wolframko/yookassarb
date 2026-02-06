# Yookassa::Airline

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ticket_number** | **String** | Уникальный номер билета. Если при создании платежа вы уже знаете номер билета, тогда ticket_number — обязательный параметр. Если не знаете, тогда вместо ticket_number необходимо передать booking_reference с номером бронирования. | [optional] |
| **booking_reference** | **String** | Номер бронирования. Обязателен, если не передан ticket_number. | [optional] |
| **passengers** | [**Array&lt;AirlinePassenger&gt;**](AirlinePassenger.md) | Список пассажиров. | [optional] |
| **legs** | [**Array&lt;AirlineLeg&gt;**](AirlineLeg.md) | Список перелетов. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::Airline.new(
  ticket_number: 5554916004417,
  booking_reference: IIIKRV,
  passengers: null,
  legs: null
)
```

