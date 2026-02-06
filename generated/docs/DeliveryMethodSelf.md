# Yookassa::DeliveryMethodSelf

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **url** | **String** | URL страницы счета, который необходимо передать пользователю для оплаты. Не более 2048 символов. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::DeliveryMethodSelf.new(
  url: null
)
```

