# Yookassa::PayoutToSbpDestination

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **phone** | **String** | Телефон, к которому привязан счет получателя выплаты в системе участника СБП. Указывается в формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164, например 79000000000. |  |
| **bank_id** | **String** | Идентификатор участника СБП — банка или платежного сервиса, подключенного к сервису. |  |
| **recipient_checked** | **Boolean** | Проверка получателя выплаты: https://yookassa.ru/developers/payouts/scenario-extensions/recipient-check: true — выплата проходила с проверкой получателя, false — выплата проходила без проверки получателя. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PayoutToSbpDestination.new(
  phone: 79000000000,
  bank_id: 100000000111,
  recipient_checked: false
)
```

