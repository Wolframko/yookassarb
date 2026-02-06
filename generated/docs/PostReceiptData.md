# Yookassa::PostReceiptData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **type** | [**ReceiptType**](ReceiptType.md) | Тип чека в онлайн-кассе. Возможные значения: payment (приход), refund (возврат прихода). |  |
| **payment_id** | **String** | Идентификатор платежа в ЮKassa для отображения информации о чеке в личном кабинете: https://yookassa.ru/my/payments, на платеж не влияет. Обязательный параметр при создании чека прихода: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/payments#create-receipt (тип чека — payment, статус платежа — waiting_for_capture или succeeded) и при создании чека возврата прихода: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/payments#payment-receipt-part-capture для отмененного или частично подтвержденного платежа (тип чека — refund, статус платежа — canceled или succeeded). Для одного платежа можно создать не более 30 чеков. | [optional] |
| **refund_id** | **String** | Идентификатор возврата в ЮKassa для отображения информации о чеке в личном кабинете: https://yookassa.ru/my. Обязательный параметр при создании чека возврата прихода: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/refunds#after-refund (если тип чека — refund, статус возврата — succeeded). Для одного возврата можно создать не более 30 чеков. | [optional] |
| **customer** | [**ReceiptDataCustomer**](ReceiptDataCustomer.md) |  |  |
| **items** | [**Array&lt;PostReceiptDataItem&gt;**](PostReceiptDataItem.md) | Список товаров в чеке: для Чеков от ЮKassa: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics — не более 80 товаров, для сторонних онлайн-касс: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics — не более 100 товаров. |  |
| **internet** | **Boolean** | Признак проведения платежа в интернете (тег в 54 ФЗ — 1125) — указывает на оплату через интернет. Возможные значения: true — оплата прошла онлайн, через интернет (например, на вашем сайте или в приложении); false — оплата прошла офлайн, при личном взаимодействии (например, в торговой точке или при встрече с курьером). По умолчанию true. Если вы принимаете платежи офлайн, передайте в запросе значение false. | [optional] |
| **_send** | **Boolean** | Формирование чека в онлайн-кассе сразу после создания объекта чека. Сейчас можно передать только значение true. | [default to true] |
| **tax_system_code** | **Integer** | Система налогообложения магазина (тег в 54 ФЗ — 1055). Для сторонних онлайн-касс: обязательный параметр, если вы используете онлайн-кассу Атол Онлайн, обновленную до ФФД 1.2, или у вас несколько систем налогообложения, в остальных случаях не передается. Перечень возможных значений: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#tax-systems Для Чеков от ЮKassa: параметр передавать не нужно, ЮKassa его проигнорирует. | [optional] |
| **timezone** | **Integer** | Номер часовой зоны для адреса, по которому вы принимаете платежи (тег в 54 ФЗ — 1011). Указывается, только если в чеке есть товары, которые подлежат обязательной маркировке (в items.mark_code_info передается параметр gs_1m, short или fur). Перечень возможных значений: для Чеков от ЮKassa: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#timezone; для сторонних онлайн-касс: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#timezone. | [optional] |
| **additional_user_props** | [**ReceiptAdditionalUserProps**](ReceiptAdditionalUserProps.md) |  | [optional] |
| **receipt_industry_details** | [**Array&lt;IndustryDetails&gt;**](IndustryDetails.md) | Отраслевой реквизит чека (тег в 54 ФЗ — 1261). Нужно передавать, если используете ФФД 1.2. | [optional] |
| **receipt_operational_details** | [**OperationalDetails**](OperationalDetails.md) | Операционный реквизит чека (тег в 54 ФЗ — 1270). Нужно передавать, если используете ФФД 1.2. | [optional] |
| **settlements** | [**Array&lt;Settlement&gt;**](Settlement.md) | Перечень совершенных расчетов. |  |
| **on_behalf_of** | **String** | Идентификатор магазина, от имени которого нужно отправить чек. Выдается ЮKassa, отображается в разделе Продавцы: https://yookassa.ru/my/marketplace/sellers личного кабинета (столбец shopId). Необходимо передавать, если вы используете Сплитование платежей: https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PostReceiptData.new(
  type: null,
  payment_id: 1da5c87d-0984-50e8-a7f3-8de646dd9ec9,
  refund_id: 1ddd77af-0bd7-500d-895b-c475c55fdefc,
  customer: null,
  items: null,
  internet: null,
  _send: null,
  tax_system_code: null,
  timezone: null,
  additional_user_props: null,
  receipt_industry_details: null,
  receipt_operational_details: null,
  settlements: null,
  on_behalf_of: 123
)
```

