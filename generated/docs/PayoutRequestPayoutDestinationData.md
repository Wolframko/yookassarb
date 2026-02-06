# Yookassa::PayoutRequestPayoutDestinationData

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'yookassarb'

Yookassa::PayoutRequestPayoutDestinationData.openapi_one_of
# =>
# [
#   :'PayoutToBankCardDestinationData',
#   :'PayoutToSbpDestinationData',
#   :'PayoutToYooMoneyDestinationData'
# ]
```

### `openapi_discriminator_name`

Returns the discriminator's property name.

#### Example

```ruby
require 'yookassarb'

Yookassa::PayoutRequestPayoutDestinationData.openapi_discriminator_name
# => :'type'
```
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'yookassarb'

Yookassa::PayoutRequestPayoutDestinationData.build(data)
# => #<PayoutToBankCardDestinationData:0x00007fdd4aab02a0>

Yookassa::PayoutRequestPayoutDestinationData.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `PayoutToBankCardDestinationData`
- `PayoutToSbpDestinationData`
- `PayoutToYooMoneyDestinationData`
- `nil` (if no type matches)

