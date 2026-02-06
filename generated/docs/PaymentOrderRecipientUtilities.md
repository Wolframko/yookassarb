# Yookassa::PaymentOrderRecipientUtilities

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Название получателя. |  |
| **inn** | **String** | ИНН получателя. |  |
| **kpp** | **String** | КПП получателя. |  |
| **bank** | [**PaymentOrderBankUtilities**](PaymentOrderBankUtilities.md) | Банк получателя. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::PaymentOrderRecipientUtilities.new(
  name: null,
  inn: null,
  kpp: null,
  bank: null
)
```

