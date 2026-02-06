# Yookassa::ElectronicCertificate

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **certificate_id** | **String** | Идентификатор сертификата. От 20 до 30 символов. |  |
| **tru_quantity** | **Integer** | Количество единиц товара, которое одобрили для оплаты по этому электронному сертификату. |  |
| **available_compensation** | [**MonetaryAmount**](MonetaryAmount.md) | Максимально допустимая сумма, которую может покрыть электронный сертификат для оплаты одной единицы товара. Пример: сертификат может компенсировать максимум 1000 рублей для оплаты этого товара. |  |
| **applied_compensation** | [**MonetaryAmount**](MonetaryAmount.md) | Сумма, которую одобрили для оплаты по сертификату за одну единицу товара. Пример: из 1000 рублей одобрили 500 рублей для оплаты по сертификату. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ElectronicCertificate.new(
  certificate_id: null,
  tru_quantity: null,
  available_compensation: null,
  applied_compensation: null
)
```

