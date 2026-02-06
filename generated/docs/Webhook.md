# Yookassa::Webhook

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Идентификатор webhook. |  |
| **event** | [**NotificationEventType**](NotificationEventType.md) | Событие: https://yookassa.ru/developers/using-api/webhooks#events, о котором уведомляет ЮKassa. |  |
| **url** | **String** | URL, на который ЮKassa отправляет уведомления. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::Webhook.new(
  id: wh-e44e8088-bd73-43b1-959a-954f3a7d0c54,
  event: null,
  url: https://www.example.com/notification_url
)
```

