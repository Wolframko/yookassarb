# Yookassa::PaymentData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма платежа. Должна укладываться в лимиты: https://yookassa.ru/docs/support/payments/limits. Сумма указывается с кодом валюты. Если вы разделяете потоки платежей, валюта платежа должна соответствовать валюте субаккаунта (recipient.gateway_id), если не разделяете — валюте аккаунта shopId в личном кабинете). |  |
| **receipt** | [**ReceiptData**](ReceiptData.md) |  | [optional] |
| **recipient** | [**Recipient**](Recipient.md) |  | [optional] |
| **save_payment_method** | **Boolean** | Сохранение платежных данных для проведения автоплатежей: https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics. Возможные значения: true — сохранить способ оплаты (сохранить платежные данные); false — провести платеж без сохранения способа оплаты. Доступно только после согласования с менеджером ЮKassa. | [optional][default to false] |
| **capture** | **Boolean** | Автоматический прием: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-true поступившего платежа. Возможные значения: true — оплата списывается сразу (платеж в одну стадию); false — оплата холдируется и списывается по вашему запросу (платеж в две стадии: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-and-cancel). По умолчанию false. | [optional][default to false] |
| **client_ip** | **String** | IPv4 или IPv6-адрес пользователя. Если не указан, используется IP-адрес TCP-подключения. | [optional] |
| **description** | **String** | Описание транзакции (не более 128 символов), которое вы увидите в личном кабинете ЮKassa, а пользователь — при оплате. Например: «Оплата заказа № 72 для user@yoomoney.ru». | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Любые дополнительные данные, которые нужны вам для работы (например, ваш внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в формате UTF-8. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentData.new(
  amount: null,
  receipt: null,
  recipient: null,
  save_payment_method: true,
  capture: true,
  client_ip: null,
  description: Оплата заказа № 72,
  metadata: null
)
```

