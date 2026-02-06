# Yookassa::Invoice

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Идентификатор счета в ЮKassa. |  |
| **status** | [**InvoiceStatus**](InvoiceStatus.md) |  |  |
| **cart** | [**Array&lt;LineItem&gt;**](LineItem.md) | Корзина заказа — список товаров или услуг, который отобразится на странице счета перед оплатой. |  |
| **delivery_method** | [**InvoiceDeliveryMethod**](InvoiceDeliveryMethod.md) |  | [optional] |
| **payment_details** | [**PaymentDetails**](PaymentDetails.md) |  | [optional] |
| **created_at** | **Time** | Дата и время создания счета на оплату. Указывается по UTC: https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: 2017-11-03T11:52:31.827Z |  |
| **expires_at** | **Time** | Срок действия счета — дата и время, до которых можно оплатить выставленный счет. Указывается по UTC: https://ru.wikipedia.org/wiki/%D0%92%D1%81%D0%B5%D0%BC%D0%B8%D1%80%D0%BD%D0%BE%D0%B5_%D0%BA%D0%BE%D0%BE%D1%80%D0%B4%D0%B8%D0%BD%D0%B8%D1%80%D0%BE%D0%B2%D0%B0%D0%BD%D0%BD%D0%BE%D0%B5_%D0%B2%D1%80%D0%B5%D0%BC%D1%8F и передается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: 2024-10-18T10:51:18.139Z Присутствует только для счетов в статусе pending. | [optional] |
| **description** | **String** | Описание выставленного счета (не более 128 символов), которое вы увидите в личном кабинете ЮKassa, а пользователь на странице счета. Например: «Счет на оплату по договору 37». | [optional] |
| **cancellation_details** | [**InvoiceCancellationDetails**](InvoiceCancellationDetails.md) |  | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Любые дополнительные данные, которые нужны вам для работы (например, ваш внутренний идентификатор заказа). Передаются в виде набора пар «ключ-значение» и возвращаются в ответе от ЮKassa. Ограничения: максимум 16 ключей, имя ключа не больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в формате UTF-8. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::Invoice.new(
  id: in-e44e8088-bd73-43b1-959a-954f3a7d0c54,
  status: null,
  cart: null,
  delivery_method: null,
  payment_details: null,
  created_at: 2017-11-03T11:52:31.827Z,
  expires_at: 2024-10-18T10:51:18.139Z,
  description: Оплата заказа № 72,
  cancellation_details: null,
  metadata: null
)
```

