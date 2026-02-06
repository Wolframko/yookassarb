# Yookassa::PayoutToSbpDestinationData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone** | **String** | Телефон, к которому привязан счет получателя выплаты в системе участника СБП. Указывается в формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164, например 79000000000. |  |
| **bank_id** | **String** | Идентификатор выбранного участника СБП — банка или платежного сервиса, подключенного к сервису. Формат: 12 символов. Как получить идентификатор участника СБП: https://yookassa.ru/developers/payouts/making-payouts/sbp |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PayoutToSbpDestinationData.new(
  phone: 79000000000,
  bank_id: 100000000111
)
```

