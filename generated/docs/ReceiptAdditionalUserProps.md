# Yookassa::ReceiptAdditionalUserProps

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | Наименование дополнительного реквизита пользователя (тег в 54 ФЗ — 1085). Не более 64 символов. |  |
| **value** | **String** | Значение дополнительного реквизита пользователя (тег в 54 ФЗ — 1086). Не более 234 символов. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::ReceiptAdditionalUserProps.new(
  name: mdlp3108805,
  value: ps45102&amp;dnАБV492&amp;&amp;781&amp;dd181110&amp;sid71752852194630&amp;
)
```

