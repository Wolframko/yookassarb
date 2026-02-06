# Yookassa::MarkCodeInfo

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **mark_code_raw** | **String** | Код товара в том виде, в котором он был прочитан сканером (тег в 54 ФЗ — 2000). Нужно передавать, если используете онлайн-кассу Orange Data. Пример: 010460406000590021N4N57RTCBUZTQ\\u001d2403054002410161218\\u001d1424010191ffd0\\u001g92tIAF/YVpU4roQS3M/m4z78yFq0nc/WsSmLeX6QkF/YVWwy5IMYAeiQ91Xa2m/fFSJcOkb2N+uUUtfr4n0mOX0Q&#x3D;&#x3D; | [optional] |
| **unknown** | **String** | Нераспознанный код товара (тег в 54 ФЗ — 1300). | [optional] |
| **ean_8** | **String** | Код товара в формате EAN-8 (тег в 54 ФЗ — 1301). | [optional] |
| **ean_13** | **String** | Код товара в формате EAN-13 (тег в 54 ФЗ — 1302). | [optional] |
| **itf_14** | **String** | Код товара в формате ITF-14 (тег в 54 ФЗ — 1303). | [optional] |
| **gs_10** | **String** | Код товара в формате GS1.0 (тег в 54 ФЗ — 1304). Можно передавать, если используете онлайн-кассу Orange Data, aQsi, Кит Инвест, АТОЛ Онлайн. | [optional] |
| **gs_1m** | **String** | Код товара в формате GS1.M (тег в 54 ФЗ — 1305). | [optional] |
| **short** | **String** | Код товара в формате короткого кода маркировки (тег в 54 ФЗ — 1306). | [optional] |
| **fur** | **String** | Контрольно-идентификационный знак мехового изделия (тег в 54 ФЗ — 1307). | [optional] |
| **egais_20** | **String** | Код товара в формате ЕГАИС-2.0 (тег в 54 ФЗ — 1308). | [optional] |
| **egais_30** | **String** | Код товара в формате ЕГАИС-3.0 (тег в 54 ФЗ — 1309). | [optional] |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::MarkCodeInfo.new(
  mark_code_raw: null,
  unknown: null,
  ean_8: null,
  ean_13: null,
  itf_14: null,
  gs_10: null,
  gs_1m: null,
  short: null,
  fur: null,
  egais_20: null,
  egais_30: null
)
```

