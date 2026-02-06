# Yookassa::IncomeReceipt

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **service_name** | **String** | Описание услуги, оказанной получателем выплаты. Не более 50 символов. |  |
| **npd_receipt_id** | **String** | Идентификатор чека в сервисе. Пример: 208jd98zqe | [optional] |
| **url** | **String** | Ссылка на зарегистрированный чек. Пример: https://www.nalog.gov.ru/api/v1/receipt/&lt;Идентификатор чека&gt;/print | [optional] |
| **amount** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма, указанная в чеке. Присутствует, если в запросе передавалась сумма для печати в чеке. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::IncomeReceipt.new(
  service_name: Оказание услуг по доставке товара,
  npd_receipt_id: 208jd98zqe,
  url: https://www.nalog.gov.ru/api/v1/receipt/208jd98zqe/print,
  amount: null
)
```

