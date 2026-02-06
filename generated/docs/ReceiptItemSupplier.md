# Yookassa::ReceiptItemSupplier

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Наименование поставщика (тег в 54 ФЗ — 1225). Параметр предусмотрен форматом фискальных документов (ФФД) и является обязательным, начиная с версии 1.1. | [optional] |
| **phone** | **String** | Телефон поставщика (тег в 54 ФЗ — 1171). Указывается в формате ITU-T E.164: https://ru.wikipedia.org/wiki/E.164, например 79000000000. Параметр предусмотрен форматом фискальных документов (ФФД) и является обязательным, начиная с версии 1.1. | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ReceiptItemSupplier.new(
  name: null,
  phone: 79000000000
)
```

