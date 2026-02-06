# Yookassa::PaymentMethodB2bSberbank

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_purpose** | **String** | Назначение платежа (не больше 210 символов). |  |
| **vat_data** | [**PaymentMethodB2bSberbankAllOfVatData**](PaymentMethodB2bSberbankAllOfVatData.md) |  |  |
| **payer_bank_details** | [**B2bSberbankPayerBankDetails**](B2bSberbankPayerBankDetails.md) |  | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentMethodB2bSberbank.new(
  payment_purpose: Оплата по договору №2143,
  vat_data: null,
  payer_bank_details: null
)
```

