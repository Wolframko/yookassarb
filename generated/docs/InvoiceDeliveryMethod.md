# Yookassa::InvoiceDeliveryMethod

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'yookassarb'

Yookassa::InvoiceDeliveryMethod.openapi_one_of
# =>
# [
#   :'DeliveryMethodEmail',
#   :'DeliveryMethodSelf',
#   :'DeliveryMethodSms'
# ]
```

### `openapi_discriminator_name`

Returns the discriminator's property name.

#### Example

```ruby
require 'yookassarb'

Yookassa::InvoiceDeliveryMethod.openapi_discriminator_name
# => :'type'
```
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'yookassarb'

Yookassa::InvoiceDeliveryMethod.build(data)
# => #<DeliveryMethodEmail:0x00007fdd4aab02a0>

Yookassa::InvoiceDeliveryMethod.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `DeliveryMethodEmail`
- `DeliveryMethodSelf`
- `DeliveryMethodSms`
- `nil` (if no type matches)

