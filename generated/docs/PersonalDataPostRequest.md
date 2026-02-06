# Yookassa::PersonalDataPostRequest

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'yookassarb'

Yookassa::PersonalDataPostRequest.openapi_one_of
# =>
# [
#   :'PayoutStatementRecipientPersonalDataRequest',
#   :'SbpPayoutRecipientPersonalDataRequest'
# ]
```

### `openapi_discriminator_name`

Returns the discriminator's property name.

#### Example

```ruby
require 'yookassarb'

Yookassa::PersonalDataPostRequest.openapi_discriminator_name
# => :'type'
```

### `openapi_discriminator_name`

Returns the discriminator's mapping.

#### Example

```ruby
require 'yookassarb'

Yookassa::PersonalDataPostRequest.openapi_discriminator_mapping
# =>
# {
#   :'payout_statement_recipient' => :'PayoutStatementRecipientPersonalDataRequest',
#   :'sbp_payout_recipient' => :'SbpPayoutRecipientPersonalDataRequest'
# }
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'yookassarb'

Yookassa::PersonalDataPostRequest.build(data)
# => #<PayoutStatementRecipientPersonalDataRequest:0x00007fdd4aab02a0>

Yookassa::PersonalDataPostRequest.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `PayoutStatementRecipientPersonalDataRequest`
- `SbpPayoutRecipientPersonalDataRequest`
- `nil` (if no type matches)

