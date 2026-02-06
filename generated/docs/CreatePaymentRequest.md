# Yookassa::CreatePaymentRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма платежа. Иногда партнеры ЮKassa берут с пользователя дополнительную комиссию, которая не входит в эту сумму. Сумма указывается с кодом валюты. Если вы разделяете потоки платежей, валюта платежа должна соответствовать валюте субаккаунта (recipient.gateway_id), если не разделяете — валюте аккаунта shopId в личном кабинете). |  |
| **description** | **String** | Описание транзакции (не более 128 символов), которое вы увидите в личном кабинете ЮKassa, а пользователь — при оплате. Например: «Оплата заказа № 72 для user@yoomoney.ru». | [optional] |
| **receipt** | [**ReceiptData**](ReceiptData.md) |  | [optional] |
| **recipient** | [**Recipient**](Recipient.md) |  | [optional] |
| **payment_token** | **String** | Одноразовый токен для проведения оплаты, сформированный с помощью Checkout.js: https://yookassa.ru/developers/payment-acceptance/integration-scenarios/checkout-js/basics или мобильного SDK: https://yookassa.ru/developers/payment-acceptance/integration-scenarios/mobile-sdks/basics. | [optional] |
| **payment_method_id** | **String** | Идентификатор сохраненного способа оплаты: https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics. | [optional] |
| **payment_method_data** | [**CreatePaymentRequestPaymentMethodData**](CreatePaymentRequestPaymentMethodData.md) |  | [optional] |
| **confirmation** | [**CreatePaymentRequestConfirmation**](CreatePaymentRequestConfirmation.md) |  | [optional] |
| **save_payment_method** | **Boolean** | Сохранение платежных данных для проведения автоплатежей: https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/basics. Возможные значения: true — сохранить способ оплаты (сохранить платежные данные); false — провести платеж без сохранения способа оплаты. Доступно только после согласования с менеджером ЮKassa. | [optional][default to false] |
| **capture** | **Boolean** | Автоматический прием: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-true поступившего платежа. Возможные значения: true — оплата списывается сразу (платеж в одну стадию); false — оплата холдируется и списывается по вашему запросу (платеж в две стадии: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-and-cancel). По умолчанию false. | [optional][default to false] |
| **client_ip** | **String** | IPv4 или IPv6-адрес пользователя. Если не указан, используется IP-адрес TCP-подключения. | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Любые дополнительные данные, которые нужны вам для работы (например, ваш внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в формате UTF-8. | [optional] |
| **airline** | [**Airline**](Airline.md) | Объект с данными для продажи авиабилетов. Используется только для платежей банковской картой. | [optional] |
| **transfers** | [**Array&lt;TransferDataPayment&gt;**](TransferDataPayment.md) | Данные о распределении денег — сколько и в какой магазин нужно перевести. Необходимо передавать, если вы используете Сплитование платежей: https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics. | [optional] |
| **deal** | [**PaymentDealInfo**](PaymentDealInfo.md) | Данные о сделке, в составе которой проходит платеж. Необходимо передавать, если вы проводите Безопасную сделку: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics. | [optional] |
| **merchant_customer_id** | **String** | Идентификатор покупателя в вашей системе, например электронная почта или номер телефона. Не более 200 символов. Присутствует, если вы хотите запомнить банковскую карту и отобразить ее при повторном платеже в виджете ЮKassa: https://yookassa.ru/developers/payment-acceptance/integration-scenarios/widget/basics. | [optional] |
| **payment_order** | [**PaymentOrderDataUtilities**](PaymentOrderDataUtilities.md) |  | [optional] |
| **receiver** | [**CreatePaymentRequestReceiver**](CreatePaymentRequestReceiver.md) |  | [optional] |
| **statements** | [**Array&lt;CreatePaymentRequestStatementsInner&gt;**](CreatePaymentRequestStatementsInner.md) | Данные для отправки справки. Необходимо передавать, если вы хотите, чтобы после оплаты пользователь получил справку. Сейчас доступен один тип справок — квитанция по платежу. Это информация об успешном платеже, которую ЮKassa отправляет на электронную почту пользователя. Квитанцию можно отправить, если оплата прошла с банковской карты, через SberPay или СБП. Отправка квитанции доступна во всех сценариях интеграции: https://yookassa.ru/developers/payment-acceptance/getting-started/selecting-integration-scenario. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::CreatePaymentRequest.new(
  amount: null,
  description: Оплата заказа № 72,
  receipt: null,
  recipient: null,
  payment_token: +u7PDjMTkf08NtD66P6+eYWa2yjU3gsSIhOOO+OWsOg&#x3D;,
  payment_method_id: 1da5c87d-0984-50e8-a7f3-8de646dd9ec9,
  payment_method_data: null,
  confirmation: null,
  save_payment_method: true,
  capture: true,
  client_ip: null,
  metadata: null,
  airline: null,
  transfers: null,
  deal: null,
  merchant_customer_id: user@test.merchant,
  payment_order: null,
  receiver: null,
  statements: null
)
```

