# Yookassa::Receipt

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Идентификатор чека в ЮKassa. |  |
| **type** | [**ReceiptType**](ReceiptType.md) |  |  |
| **payment_id** | **String** | Идентификатор платежа: https://yookassa.ru/developers/api#payment_object, для которого был сформирован чек. | [optional] |
| **refund_id** | **String** | Идентификатор возврата: https://yookassa.ru/developers/api#refund_object, для которого был сформирован чек. Отсутствует в чеке платежа. | [optional] |
| **status** | [**ReceiptRegistrationStatus**](ReceiptRegistrationStatus.md) | Статус доставки данных для чека в онлайн-кассу. Возможные значения: pending — данные в обработке; succeeded — чек успешно зарегистрирован; canceled — чек зарегистрировать не удалось; если используете Чеки от ЮKassa: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics, обратитесь в техническую поддержку, в остальных случаях сформируйте чек вручную. |  |
| **fiscal_document_number** | **String** | Номер фискального документа. | [optional] |
| **fiscal_storage_number** | **String** | Номер фискального накопителя в кассовом аппарате. | [optional] |
| **fiscal_attribute** | **String** | Фискальный признак чека. Формируется фискальным накопителем на основе данных, переданных для регистрации чека. | [optional] |
| **registered_at** | **Time** | Дата и время формирования чека в фискальном накопителе. Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. | [optional] |
| **fiscal_provider_id** | **String** | Идентификатор чека в онлайн-кассе. Присутствует, если чек удалось зарегистрировать. | [optional] |
| **items** | [**Array&lt;ReceiptItem&gt;**](ReceiptItem.md) | Список товаров в чеке: для Чеков от ЮKassa: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/basics — не более 80 товаров, для сторонних онлайн-касс: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics — не более 100 товаров. |  |
| **internet** | **Boolean** | Признак проведения платежа в интернете (тег в 54 ФЗ — 1125) — указывает на оплату через интернет. Возможные значения: true — оплата прошла онлайн, через интернет (например, на вашем сайте или в приложении); false — оплата прошла офлайн, при личном взаимодействии (например, в торговой точке или при встрече с курьером). По умолчанию true. Если вы принимаете платежи офлайн, передайте в запросе значение false. | [optional] |
| **settlements** | [**Array&lt;Settlement&gt;**](Settlement.md) | Перечень совершенных расчетов. | [optional] |
| **on_behalf_of** | **String** | Идентификатор магазина, от имени которого нужно отправить чек. Выдается ЮKassa. Присутствует, если вы используете Сплитование платежей: https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics. | [optional] |
| **tax_system_code** | **Integer** | Система налогообложения магазина (тег в 54 ФЗ — 1055). Для сторонних онлайн-касс: обязательный параметр, если вы используете онлайн-кассу Атол Онлайн, обновленную до ФФД 1.2, или у вас несколько систем налогообложения, в остальных случаях не передается. Перечень возможных значений: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#tax-systems Для Чеков от ЮKassa: параметр передавать не нужно, ЮKassa его проигнорирует. | [optional] |
| **timezone** | **Integer** | Номер часовой зоны для адреса, по которому вы принимаете платежи (тег в 54 ФЗ — 1011). Указывается, только если в чеке есть товары, которые подлежат обязательной маркировке (в items.mark_code_info передается параметр gs_1m, short или fur). Перечень возможных значений: для Чеков от ЮKassa: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#timezone; для сторонних онлайн-касс: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#timezone. | [optional] |
| **receipt_industry_details** | [**Array&lt;IndustryDetails&gt;**](IndustryDetails.md) | Отраслевой реквизит предмета расчета (тег в 54 ФЗ — 1260). | [optional] |
| **receipt_operational_details** | [**OperationalDetails**](OperationalDetails.md) | Операционный реквизит чека (тег в 54 ФЗ — 1270). | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::Receipt.new(
  id: rt-1da5c87d-0984-50e8-a7f3-8de646dd9ec9,
  type: null,
  payment_id: 215d8da0-000f-50be-b000-0003308c89be,
  refund_id: 215d8da0-000f-50be-b000-0003308c89be,
  status: null,
  fiscal_document_number: 3986,
  fiscal_storage_number: 9288000100115785,
  fiscal_attribute: 2617603921,
  registered_at: 2019-05-13T17:56+03:00,
  fiscal_provider_id: fd9e9404-eaca-4000-8ec9-dc228ead2345,
  items: null,
  internet: null,
  settlements: null,
  on_behalf_of: 123,
  tax_system_code: null,
  timezone: null,
  receipt_industry_details: null,
  receipt_operational_details: null
)
```

