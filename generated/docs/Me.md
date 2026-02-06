# Yookassa::Me

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_id** | **String** | Идентификатор магазина или шлюза. |  |
| **status** | **String** | Статус магазина или шлюза. Возможные значения: enabled — подключен к ЮKassa, может проводить платежи или выплаты; disabled — не может проводить платежи или выплаты (еще не подключен, закрыт или временно не работает). |  |
| **test** | **Boolean** | Это тестовый магазин или шлюз. |  |
| **fiscalization** | [**FiscalizationData**](FiscalizationData.md) |  | [optional] |
| **fiscalization_enabled** | **Boolean** | Устаревший параметр, который раньше использовался для определения настроек отправки чеков в налоговую. Сохранен для поддержки обратной совместимости, в новых версиях API может быть удален. Используйте объект fiscalization, чтобы определить, какие у магазина настройки отправки чеков. | [optional] |
| **payment_methods** | [**Array&lt;PaymentMethodType&gt;**](PaymentMethodType.md) | Список способов оплаты: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods#all, доступных магазину. Присутствует, если вы запрашивали настройки магазина. | [optional] |
| **itn** | **String** | ИНН магазина (от 1 до 20 цифр). Присутствует, если вы запрашивали настройки магазина. | [optional] |
| **payout_methods** | [**Array&lt;PayoutMethodType&gt;**](PayoutMethodType.md) | Список способов получения выплат, доступных шлюзу. Возможные значения: bank_card — выплаты на банковские карты; yoo_money — выплаты на кошельки ЮMoney; sbp — выплаты через СБП. Присутствует, если вы запрашивали настройки шлюза. | [optional] |
| **name** | **String** | Название шлюза, которое отображается в личном кабинете ЮKassa. Присутствует, если вы запрашивали настройки шлюза. | [optional] |
| **payout_balance** | [**MonetaryAmount**](MonetaryAmount.md) | Баланс вашего шлюза. Присутствует, если вы запрашивали настройки шлюза. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::Me.new(
  account_id: 123,
  status: null,
  test: true,
  fiscalization: null,
  fiscalization_enabled: true,
  payment_methods: null,
  itn: 632134181463213,
  payout_methods: null,
  name: TestName,
  payout_balance: null
)
```

