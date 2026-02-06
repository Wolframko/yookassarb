# Yookassa::ReceiptData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **customer** | [**ReceiptDataCustomer**](ReceiptDataCustomer.md) |  | [optional] |
| **items** | [**Array&lt;ReceiptDataItem&gt;**](ReceiptDataItem.md) | Список товаров в заказе. Если используете Чеки от ЮKassa, можно передать максимум 80 товаров, если используете стороннюю онлайн-кассу, максимум 100 товаров. |  |
| **internet** | **Boolean** | Признак проведения платежа в интернете (тег в 54 ФЗ — 1125) — указывает на оплату через интернет. Возможные значения: true — оплата прошла онлайн, через интернет (например, на вашем сайте или в приложении); false — оплата прошла офлайн, при личном взаимодействии (например, в торговой точке или при встрече с курьером). По умолчанию true. Если вы принимаете платежи офлайн, передайте в запросе значение false. | [optional] |
| **tax_system_code** | **Integer** | Система налогообложения магазина (тег в 54 ФЗ — 1055). Для сторонних онлайн-касс: обязательный параметр, если вы используете онлайн-кассу Атол Онлайн, обновленную до ФФД 1.2, или у вас несколько систем налогообложения, в остальных случаях не передается. Перечень возможных значений: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#tax-systems Для Чеков от ЮKassa: параметр передавать не нужно, ЮKassa его проигнорирует. | [optional] |
| **timezone** | **Integer** | Номер часовой зоны для адреса, по которому вы принимаете платежи (тег в 54 ФЗ — 1011). Указывается, только если в чеке есть товары, которые подлежат обязательной маркировке (в items.mark_code_info передается параметр gs_1m, short или fur). Перечень возможных значений: для Чеков от ЮKassa: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#timezone; для сторонних онлайн-касс: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#timezone. | [optional] |
| **receipt_industry_details** | [**Array&lt;IndustryDetails&gt;**](IndustryDetails.md) | Отраслевой реквизит чека (тег в 54 ФЗ — 1261). Можно передавать, если используете Чеки от ЮKassa или онлайн-кассу, обновленную до ФФД 1.2. | [optional] |
| **receipt_operational_details** | [**OperationalDetails**](OperationalDetails.md) | Операционный реквизит чека (тег в 54 ФЗ — 1270). Можно передавать, если используете Чеки от ЮKassa или онлайн-кассу, обновленную до ФФД 1.2. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ReceiptData.new(
  customer: null,
  items: null,
  internet: null,
  tax_system_code: null,
  timezone: null,
  receipt_industry_details: null,
  receipt_operational_details: null
)
```

