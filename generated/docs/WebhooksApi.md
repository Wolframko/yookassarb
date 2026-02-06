# Yookassa::WebhooksApi

All URIs are relative to *https://api.yookassa.ru/v3*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**webhooks_get**](WebhooksApi.md#webhooks_get) | **GET** /webhooks | Список созданных webhook |
| [**webhooks_post**](WebhooksApi.md#webhooks_post) | **POST** /webhooks | Создание webhook |
| [**webhooks_webhook_id_delete**](WebhooksApi.md#webhooks_webhook_id_delete) | **DELETE** /webhooks/{webhook_id} | Удаление webhook |


## webhooks_get

> <WebhookList> webhooks_get

Список созданных webhook

Запрос позволяет узнать, какие webhook есть для переданного OAuth-токена.

### Examples

```ruby
require 'time'
require 'yookassarb'
# setup authorization
Yookassa.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'

  # Configure HTTP basic authorization: BasicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Yookassa::WebhooksApi.new

begin
  # Список созданных webhook
  result = api_instance.webhooks_get
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling WebhooksApi->webhooks_get: #{e}"
end
```

#### Using the webhooks_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<WebhookList>, Integer, Hash)> webhooks_get_with_http_info

```ruby
begin
  # Список созданных webhook
  data, status_code, headers = api_instance.webhooks_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <WebhookList>
rescue Yookassa::ApiError => e
  puts "Error when calling WebhooksApi->webhooks_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**WebhookList**](WebhookList.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## webhooks_post

> <Webhook> webhooks_post(idempotence_key, create_webhook_request)

Создание webhook

Запрос позволяет подписаться на уведомления о событиях: https://yookassa.ru/developers/using-api/webhooks#events (например, переход платежа в статус succeeded). C помощью webhook можно подписаться только на события платежей и возвратов. Если вы хотите получать уведомления о нескольких событиях, вам нужно для каждого из них создать свой webhook. Для каждого OAuth-токена нужно создавать свой набор webhook.

### Examples

```ruby
require 'time'
require 'yookassarb'
# setup authorization
Yookassa.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'

  # Configure HTTP basic authorization: BasicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Yookassa::WebhooksApi.new
idempotence_key = 'idempotence_key_example' # String | 
create_webhook_request = Yookassa::CreateWebhookRequest.new({event: Yookassa::NotificationEventType::PAYMENT_WAITING_FOR_CAPTURE, url: 'https://www.example.com/notification_url'}) # CreateWebhookRequest | 

begin
  # Создание webhook
  result = api_instance.webhooks_post(idempotence_key, create_webhook_request)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling WebhooksApi->webhooks_post: #{e}"
end
```

#### Using the webhooks_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Webhook>, Integer, Hash)> webhooks_post_with_http_info(idempotence_key, create_webhook_request)

```ruby
begin
  # Создание webhook
  data, status_code, headers = api_instance.webhooks_post_with_http_info(idempotence_key, create_webhook_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Webhook>
rescue Yookassa::ApiError => e
  puts "Error when calling WebhooksApi->webhooks_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **idempotence_key** | **String** |  | [default to &#39;2e1da982-1bb1-41f0-b9cf-758cc8bcf069&#39;] |
| **create_webhook_request** | [**CreateWebhookRequest**](CreateWebhookRequest.md) |  |  |

### Return type

[**Webhook**](Webhook.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## webhooks_webhook_id_delete

> Object webhooks_webhook_id_delete(webhook_id)

Удаление webhook

Запрос позволяет отписаться от уведомлений о событии для переданного OAuth-токена. Чтобы удалить webhook, вам нужно передать в запросе его идентификатор.

### Examples

```ruby
require 'time'
require 'yookassarb'
# setup authorization
Yookassa.configure do |config|
  # Configure OAuth2 access token for authorization: OAuth2
  config.access_token = 'YOUR ACCESS TOKEN'

  # Configure HTTP basic authorization: BasicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Yookassa::WebhooksApi.new
webhook_id = 'webhook_id_example' # String | Идентификатор webhook-a.

begin
  # Удаление webhook
  result = api_instance.webhooks_webhook_id_delete(webhook_id)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling WebhooksApi->webhooks_webhook_id_delete: #{e}"
end
```

#### Using the webhooks_webhook_id_delete_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(Object, Integer, Hash)> webhooks_webhook_id_delete_with_http_info(webhook_id)

```ruby
begin
  # Удаление webhook
  data, status_code, headers = api_instance.webhooks_webhook_id_delete_with_http_info(webhook_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => Object
rescue Yookassa::ApiError => e
  puts "Error when calling WebhooksApi->webhooks_webhook_id_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **webhook_id** | **String** | Идентификатор webhook-a. | [default to &#39;1da5c87d-0984-50e8-a7f3-8de646dd9ec9&#39;] |

### Return type

**Object**

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

