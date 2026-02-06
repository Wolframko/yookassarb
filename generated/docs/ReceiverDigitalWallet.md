# Yookassa::ReceiverDigitalWallet

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **account_number** | **String** | Идентификатор электронного кошелька для пополнения. Максимум 20 символов. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ReceiverDigitalWallet.new(
  account_number: N41001184120504
)
```

