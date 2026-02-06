# Yookassa::PaymentMethodB2bSberbankAllOfVatData

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'yookassarb'

Yookassa::PaymentMethodB2bSberbankAllOfVatData.openapi_one_of
# =>
# [
#   :'B2bSberbankCalculatedVatData',
#   :'B2bSberbankMixedVatData',
#   :'B2bSberbankUntaxedVatData'
# ]
```

### `openapi_discriminator_name`

Returns the discriminator's property name.

#### Example

```ruby
require 'yookassarb'

Yookassa::PaymentMethodB2bSberbankAllOfVatData.openapi_discriminator_name
# => :'type'
```
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'yookassarb'

Yookassa::PaymentMethodB2bSberbankAllOfVatData.build(data)
# => #<B2bSberbankCalculatedVatData:0x00007fdd4aab02a0>

Yookassa::PaymentMethodB2bSberbankAllOfVatData.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `B2bSberbankCalculatedVatData`
- `B2bSberbankMixedVatData`
- `B2bSberbankUntaxedVatData`
- `nil` (if no type matches)

