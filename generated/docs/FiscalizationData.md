# Yookassa::FiscalizationData

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **enabled** | **Boolean** | В настройках магазина включена отправка чеков. Возможные значения: true — магазин отправляет данные для чеков через ЮKassa; false — магазин выключил отправку чеков через ЮKassa. |  |
| **provider** | [**FiscalizationProvider**](FiscalizationProvider.md) |  |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::FiscalizationData.new(
  enabled: true,
  provider: null
)
```

