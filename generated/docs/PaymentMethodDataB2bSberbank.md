# Yookassa::PaymentMethodDataB2bSberbank

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_purpose** | **String** | Назначение платежа (не больше 210 символов). |  |
| **vat_data** | [**PaymentMethodDataB2bSberbankAllOfVatData**](PaymentMethodDataB2bSberbankAllOfVatData.md) |  |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentMethodDataB2bSberbank.new(
  payment_purpose: Оплата по договору №2143,
  vat_data: null
)
```

