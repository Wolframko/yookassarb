# Yookassa::BankCardProduct

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **code** | **String** | Код карточного продукта. Пример: MCP |  |
| **name** | **String** | Название карточного продукта. Пример: MIR Privilege | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::BankCardProduct.new(
  code: MCP,
  name: MIR Privilege
)
```

