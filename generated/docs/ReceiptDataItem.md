# Yookassa::ReceiptDataItem

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** | Название товара (от 1 до 128 символов). Тег в 54 ФЗ — 1030. |  |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Цена товара (тег в 54 ФЗ — 1079). |  |
| **vat_code** | **Integer** | Ставка НДС (тег в 54 ФЗ — 1199). Перечень возможных значений: для Чеков от ЮKassa: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#vat-codes; для сторонних онлайн-касс: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#vat-codes. |  |
| **quantity** | **Float** | Количество товара (тег в 54 ФЗ — 1023). Можно передать целое или дробное число. Разделитель дробной части — точка, разделитель тысяч отсутствует. Максимально возможное значение и максимальное количество знаков после точки (для дробных значений) зависят от модели вашей онлайн-кассы. Для чеков от ЮKassa максимально возможное значение — 99999.999, не более 3 знаков после точки. |  |
| **measure** | [**ReceiptItemMeasure**](ReceiptItemMeasure.md) |  | [optional] |
| **mark_quantity** | [**MarkQuantity**](MarkQuantity.md) |  | [optional] |
| **payment_subject** | [**ReceiptItemPaymentSubject**](ReceiptItemPaymentSubject.md) |  | [optional] |
| **payment_mode** | [**ReceiptItemPaymentMode**](ReceiptItemPaymentMode.md) |  | [optional] |
| **country_of_origin_code** | **String** | Код страны происхождения товара по общероссийскому классификатору стран мира (OК (MК (ИСО 3166) 004-97) 025-2001: http://docs.cntd.ru/document/842501280). Тег в 54 ФЗ — 1230. Пример: RU. Можно передавать, если используете онлайн-кассу Orange Data, Кит Инвест. | [optional] |
| **customs_declaration_number** | **String** | Номер таможенной декларации (от 1 до 32 символов). Тег в 54 ФЗ — 1231. Можно передавать, если используете онлайн-кассу Orange Data, Кит Инвест. | [optional] |
| **excise** | **String** | Сумма акциза товара с учетом копеек (тег в 54 ФЗ — 1229). Десятичное число с точностью до 2 знаков после точки. Можно передавать, если используете онлайн-кассу Orange Data, Кит Инвест. | [optional] |
| **product_code** | **String** | Код товара (тег в 54 ФЗ — 1162) — уникальный номер, который присваивается экземпляру товара при маркировке. Формат: число в шестнадцатеричном представлении с пробелами. Максимальная длина — 32 байта. Пример: 00 00 00 01 00 21 FA 41 00 23 05 41 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 12 00 AB 00. Обязательный параметр, если одновременно выполняются эти условия: вы используете онлайн-кассу, обновленную до ФФД 1.05; товар нужно маркировать: http://docs.cntd.ru/document/902192509. | [optional] |
| **planned_status** | **Integer** | Планируемый статус товара. Тег в 54 ФЗ — 2003. Указывается только для товаров, которые подлежат обязательной маркировке (в items.mark_code_info передается параметр gs_1m, short или fur). Перечень возможных значений: для Чеков от ЮKassa: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/yoomoney/parameters-values#planned-status; для сторонних онлайн-касс: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/parameters-values#planned-status. | [optional] |
| **mark_code_info** | [**MarkCodeInfo**](MarkCodeInfo.md) |  | [optional] |
| **mark_mode** | **String** | Режим обработки кода маркировки (тег в 54 ФЗ — 2102). Обязательный параметр, если одновременно выполняются эти условия: вы используете Чеки от ЮKassa или онлайн-кассу Атол Онлайн или BusinessRu, обновленную до ФФД 1.2; товар нужно маркировать: http://docs.cntd.ru/document/902192509. Должен принимать значение равное «0». | [optional] |
| **payment_subject_industry_details** | [**Array&lt;IndustryDetails&gt;**](IndustryDetails.md) | Отраслевой реквизит предмета расчета (тег в 54 ФЗ — 1260). Можно передавать, если используете Чеки от ЮKassa или онлайн-кассу, обновленную до ФФД 1.2. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ReceiptDataItem.new(
  description: null,
  amount: null,
  vat_code: null,
  quantity: 1,
  measure: null,
  mark_quantity: null,
  payment_subject: null,
  payment_mode: null,
  country_of_origin_code: RU,
  customs_declaration_number: 10714040/140917/0090376,
  excise: 20.00,
  product_code: 00 00 00 01 00 21 FA 41 00 23 05 41 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 12 00 AB 00,
  planned_status: null,
  mark_code_info: null,
  mark_mode: 0,
  payment_subject_industry_details: null
)
```

