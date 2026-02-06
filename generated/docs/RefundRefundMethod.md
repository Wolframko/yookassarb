# Yookassa::RefundRefundMethod

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'yookassarb'

Yookassa::RefundRefundMethod.openapi_one_of
# =>
# [
#   :'ElectronicCertificateRefundMethod',
#   :'SbpRefundMethod'
# ]
```

### `openapi_discriminator_name`

Returns the discriminator's property name.

#### Example

```ruby
require 'yookassarb'

Yookassa::RefundRefundMethod.openapi_discriminator_name
# => :'type'
```
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'yookassarb'

Yookassa::RefundRefundMethod.build(data)
# => #<ElectronicCertificateRefundMethod:0x00007fdd4aab02a0>

Yookassa::RefundRefundMethod.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `ElectronicCertificateRefundMethod`
- `SbpRefundMethod`
- `nil` (if no type matches)

