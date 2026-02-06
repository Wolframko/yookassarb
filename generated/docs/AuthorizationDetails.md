# Yookassa::AuthorizationDetails

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **rrn** | **String** | Retrieval Reference Number — идентификатор банковской транзакции. | [optional] |
| **auth_code** | **String** | Код авторизации. Выдается эмитентом и подтверждает проведение авторизации. | [optional] |
| **three_d_secure** | [**ThreeDSecureDetails**](ThreeDSecureDetails.md) |  |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::AuthorizationDetails.new(
  rrn: 603668680243,
  auth_code: 062467,
  three_d_secure: null
)
```

