# Yookassa::CreateWebhookRequest

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **event** | [**NotificationEventType**](NotificationEventType.md) | Событие: https://yookassa.ru/developers/using-api/webhooks#events, которое вы хотите отслеживать. |  |
| **url** | **String** | URL, на который ЮKassa будет отправлять уведомления. |  |

## Example

```ruby
require 'yookassarb'

instance = Yookassa::CreateWebhookRequest.new(
  event: null,
  url: https://www.example.com/notification_url
)
```

