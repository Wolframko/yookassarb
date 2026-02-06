# Yookassa::ReceiptItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** | Название товара (не более 128 символов). Тег в 54 ФЗ — 1030). |  |
| **quantity** | **Float** | Количество товара (тег в 54 ФЗ — 1023). Формат: десятичное число, дробная часть — три знака или больше (количество знаков зависит от quantity в запросе). Разделитель дробной части — точка, разделитель тысяч отсутствует. Пример: 5.000 |  |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Цена товара (тег в 54 ФЗ — 1079). |  |
| **vat_code** | **Integer** | Ставка НДС (тег в 54 ФЗ — 1199). Перечень возможных значений: для Чеков от ЮKassa: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#vat-codes; для сторонних онлайн-касс: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#vat-codes. |  |
| **payment_subject** | [**ReceiptItemPaymentSubject**](ReceiptItemPaymentSubject.md) |  | [optional] |
| **payment_mode** | [**ReceiptItemPaymentMode**](ReceiptItemPaymentMode.md) |  | [optional] |
| **country_of_origin_code** | **String** | Код страны происхождения товара по общероссийскому классификатору стран мира (OК (MК (ИСО 3166) 004-97) 025-2001: http://docs.cntd.ru/document/842501280). Тег в 54 ФЗ — 1230. Пример: RU. Онлайн-кассы, которые поддерживают этот параметр: Orange Data, Кит Инвест. | [optional] |
| **customs_declaration_number** | **String** | Номер таможенной декларации (от 1 до 32 символов). Тег в 54 ФЗ — 1231. Онлайн-кассы, которые поддерживают этот параметр: Orange Data, Кит Инвест. | [optional] |
| **excise** | **String** | Сумма акциза товара с учетом копеек (тег в 54 ФЗ — 1229). Десятичное число с точностью до 2 символов после точки. Онлайн-кассы, которые поддерживают этот параметр: Orange Data, Кит Инвест. | [optional] |
| **supplier** | [**ReceiptItemSupplierWithInn**](ReceiptItemSupplierWithInn.md) |  | [optional] |
| **agent_type** | [**ReceiptItemAgentType**](ReceiptItemAgentType.md) |  | [optional] |
| **mark_code_info** | [**MarkCodeInfo**](MarkCodeInfo.md) |  | [optional] |
| **measure** | [**ReceiptItemMeasure**](ReceiptItemMeasure.md) |  | [optional] |
| **payment_subject_industry_details** | [**Array&lt;IndustryDetails&gt;**](IndustryDetails.md) | Отраслевой реквизит предмета расчета  (тег в 54 ФЗ — 1260). Обязателен при использовании ФФД 1.2. | [optional] |
| **product_code** | **String** | Код товара — уникальный номер, который присваивается экземпляру товара при маркировке: http://docs.cntd.ru/document/902192509 (тег в 54 ФЗ — 1162). Формат: число в шестнадцатеричном представлении с пробелами. Максимальная длина — 32 байта. Пример: 00 00 00 01 00 21 FA 41 00 23 05 41 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 12 00 AB 00. Обязательный параметр, если товар нужно маркировать: http://docs.cntd.ru/document/557297080. | [optional] |
| **planned_status** | **Integer** | Планируемый статус товара. Тег в 54 ФЗ — 2003. Указывается только для товаров, которые подлежат обязательной маркировке (в items.mark_code_info передается параметр gs_1m, short или fur). Перечень возможных значений: для Чеков от ЮKassa: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#planned-status; для сторонних онлайн-касс: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#planned-status. | [optional] |
| **mark_mode** | **String** | Режим обработки кода маркировки (тег в 54 ФЗ — 2102). Обязательный параметр, если одновременно выполняются эти условия: вы используете Чеки от ЮKassa или онлайн-кассу Атол Онлайн или BusinessRu, обновленную до ФФД 1.2; товар нужно маркировать: http://docs.cntd.ru/document/902192509. Должен принимать значение равное «0». | [optional] |
| **mark_quantity** | [**MarkQuantity**](MarkQuantity.md) |  | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ReceiptItem.new(
  description: null,
  quantity: 1,
  amount: null,
  vat_code: null,
  payment_subject: null,
  payment_mode: null,
  country_of_origin_code: RU,
  customs_declaration_number: 10714040/140917/0090376,
  excise: 20.00,
  supplier: null,
  agent_type: null,
  mark_code_info: null,
  measure: null,
  payment_subject_industry_details: null,
  product_code: 00 00 00 01 00 21 FA 41 00 23 05 41 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 12 00 AB 00,
  planned_status: null,
  mark_mode: 0,
  mark_quantity: null
)
```

