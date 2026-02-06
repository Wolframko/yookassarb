# Yookassa::PaymentOrderDataUtilities

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма платежного поручения — сумма, которую пользователь переводит получателю платежа. Равна общей сумме платежа. |  |
| **payment_purpose** | **String** | Назначение платежа (не больше 210 символов). Рекомендуется формировать с учетом рекомендаций из Письма Банка России № ИН-04-45|12 от 22.02.2018: https://my.dom.gosuslugi.ru/filestore/publicDownloadServlet?context&#x3D;contentmanagement&amp;uid&#x3D;ef9a477a-2beb-4212-be30-aed231160db1&amp;mode&#x3D;view. Пример: Оплата ЖКХ;ЕЛС 80KX478547;ПРД 12.2024;Иванов Иван;г.Москва, ул.Флотская, д.1, кв.1 |  |
| **recipient** | [**PaymentOrderRecipientUtilities**](PaymentOrderRecipientUtilities.md) | Получатель платежа — государственная или коммерческая организация, которая предоставляет услуги или является информационным посредником, который собирает и обрабатывает начисления от других поставщиков услуг. |  |
| **kbk** | **String** | Код бюджетной классификации (КБК). | [optional] |
| **oktmo** | **String** | Код ОКТМО (Общероссийский классификатор территорий муниципальных образований). | [optional] |
| **payment_period** | [**PaymentPeriod**](PaymentPeriod.md) |  | [optional] |
| **payment_document_id** | **String** | Идентификатор платежного документа. Обязательный параметр, если не передан payment_document_number, account_number, unified_account_number или service_id. | [optional] |
| **payment_document_number** | **String** | Номер платежного документа на стороне поставщика ЖКУ. Обязательный параметр, если не передан payment_document_id, account_number, unified_account_number или service_id. | [optional] |
| **account_number** | **String** | Номер лицевого счета на стороне поставщика ЖКУ. Обязательный параметр, если не передан payment_document_id, payment_document_number, unified_account_number или service_id. | [optional] |
| **unified_account_number** | **String** | Единый лицевой счет. Уникальный идентификатор в ГИС ЖКХ, который характеризует связку «собственник-помещение». Обязательный параметр, если не передан payment_document_id, payment_document_number, account_number или service_id. | [optional] |
| **service_id** | **String** | Идентификатор жилищно-коммунальной услуги (ЖКУ). Обязательный параметр, если не передан payment_document_id, payment_document_number, account_number или unified_account_number. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentOrderDataUtilities.new(
  amount: null,
  payment_purpose: Оплата по договору №2143,
  recipient: null,
  kbk: 70311105013130000120,
  oktmo: 98627153,
  payment_period: null,
  payment_document_id: 34СТ185329-01-2352,
  payment_document_number: null,
  account_number: null,
  unified_account_number: 60АА000593,
  service_id: 34СТ185329-01
)
```

