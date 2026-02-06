# Yookassa::InvoiceCancellationDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **party** | **String** | Участник процесса, который принял решение об отмене счета. Возможные значения: merchant — продавец товаров и услуг (вы); yoo_money — ЮKassa. |  |
| **reason** | **String** | Причина отмены счета. Возможные значения: invoice_canceled — счет отменен вручную: https://yookassa.ru/docs/support/merchant/invoices-to-clients/invoicing#invoicing__cancel из личного кабинета ЮKassa; invoice_expired — истек срок действия счета, который вы установили в запросе на создание счета в параметре expires_at, и по счету нет ни одного успешного платежа; general_decline — причина не детализирована, поэтому пользователю следует обратиться к инициатору отмены счета за уточнением подробностей; payment_canceled — платеж отменен по API: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#cancel при оплате в две стадии; payment_expired_on_capture — истек срок списания оплаты: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#hold для платежа в две стадии. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::InvoiceCancellationDetails.new(
  party: null,
  reason: invoice_expired
)
```

