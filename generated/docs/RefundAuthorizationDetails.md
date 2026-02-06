# Yookassa::RefundAuthorizationDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rrn** | **String** | Retrieval Reference Number — идентификатор банковской транзакции. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::RefundAuthorizationDetails.new(
  rrn: 603668680243
)
```

