# Yookassa::DefaultApi

All URIs are relative to *https://api.yookassa.ru/v3*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**deals_deal_id_get**](DefaultApi.md#deals_deal_id_get) | **GET** /deals/{deal_id} | Информация о сделке |
| [**deals_get**](DefaultApi.md#deals_get) | **GET** /deals | Список сделок |
| [**deals_post**](DefaultApi.md#deals_post) | **POST** /deals | Создание сделки |
| [**invoices_invoice_id_get**](DefaultApi.md#invoices_invoice_id_get) | **GET** /invoices/{invoice_id} | Информация о счете |
| [**invoices_post**](DefaultApi.md#invoices_post) | **POST** /invoices | Создание счета |
| [**me_get**](DefaultApi.md#me_get) | **GET** /me | Информация о настройках магазина или шлюза |
| [**payment_methods_payment_method_id_get**](DefaultApi.md#payment_methods_payment_method_id_get) | **GET** /payment_methods/{payment_method_id} | Информация о способе оплаты |
| [**payment_methods_post**](DefaultApi.md#payment_methods_post) | **POST** /payment_methods | Создание способа оплаты |
| [**payments_get**](DefaultApi.md#payments_get) | **GET** /payments | Список платежей |
| [**payments_payment_id_cancel_post**](DefaultApi.md#payments_payment_id_cancel_post) | **POST** /payments/{payment_id}/cancel | Отмена платежа |
| [**payments_payment_id_capture_post**](DefaultApi.md#payments_payment_id_capture_post) | **POST** /payments/{payment_id}/capture | Подтверждение платежа |
| [**payments_payment_id_get**](DefaultApi.md#payments_payment_id_get) | **GET** /payments/{payment_id} | Информация о платеже |
| [**payments_post**](DefaultApi.md#payments_post) | **POST** /payments | Создание платежа |
| [**payouts_get**](DefaultApi.md#payouts_get) | **GET** /payouts | Список выплат |
| [**payouts_payout_id_get**](DefaultApi.md#payouts_payout_id_get) | **GET** /payouts/{payout_id} | Информация о выплате |
| [**payouts_post**](DefaultApi.md#payouts_post) | **POST** /payouts | Создание выплаты |
| [**payouts_search_get**](DefaultApi.md#payouts_search_get) | **GET** /payouts/search | Поиск выплат |
| [**personal_data_personal_data_id_get**](DefaultApi.md#personal_data_personal_data_id_get) | **GET** /personal_data/{personal_data_id} | Информация о персональных данных |
| [**personal_data_post**](DefaultApi.md#personal_data_post) | **POST** /personal_data | Создание персональных данных |
| [**receipts_get**](DefaultApi.md#receipts_get) | **GET** /receipts | Список чеков |
| [**receipts_post**](DefaultApi.md#receipts_post) | **POST** /receipts | Создание чека |
| [**receipts_receipt_id_get**](DefaultApi.md#receipts_receipt_id_get) | **GET** /receipts/{receipt_id} | Информация о чеке |
| [**refunds_get**](DefaultApi.md#refunds_get) | **GET** /refunds | Список возвратов |
| [**refunds_post**](DefaultApi.md#refunds_post) | **POST** /refunds | Создание возврата |
| [**refunds_refund_id_get**](DefaultApi.md#refunds_refund_id_get) | **GET** /refunds/{refund_id} | Информация о возврате |
| [**sbp_banks_get**](DefaultApi.md#sbp_banks_get) | **GET** /sbp_banks | Список участников СБП |


## deals_deal_id_get

> <SafeDeal> deals_deal_id_get(deal_id)

Информация о сделке

Запрос позволяет получить информацию о текущем состоянии сделки по ее уникальному идентификатору.

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

api_instance = Yookassa::DefaultApi.new
deal_id = 'deal_id_example' # String | 

begin
  # Информация о сделке
  result = api_instance.deals_deal_id_get(deal_id)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->deals_deal_id_get: #{e}"
end
```

#### Using the deals_deal_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SafeDeal>, Integer, Hash)> deals_deal_id_get_with_http_info(deal_id)

```ruby
begin
  # Информация о сделке
  data, status_code, headers = api_instance.deals_deal_id_get_with_http_info(deal_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SafeDeal>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->deals_deal_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **deal_id** | **String** |  |  |

### Return type

[**SafeDeal**](SafeDeal.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## deals_get

> <DealList> deals_get(opts)

Список сделок

Запрос позволяет получить список сделок, отфильтрованный по заданным критериям. Подробнее о работе со списками: https://yookassa.ru/developers/using-api/lists

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

api_instance = Yookassa::DefaultApi.new
opts = {
  created_at_gte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gte=2018-07-18T10:51:18.139Z
  created_at_gt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gt=2018-07-18T10:51:18.139Z
  created_at_lte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lte=2018-07-18T10:51:18.139Z
  created_at_lt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть меньше указанного значения («по такой-то момент, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lt=2018-07-18T10:51:18.139Z
  expires_at_gte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени автоматического закрытия сделки: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: expires_at.gte=2018-07-18T10:51:18.139Z
  expires_at_gt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени автоматического закрытия сделки: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: expires_at.gt=2018-07-18T10:51:18.139Z
  expires_at_lte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени автоматического закрытия сделки: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: expires_at.lte=2018-07-18T10:51:18.139Z
  expires_at_lt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени автоматического закрытия сделки: время должно быть меньше указанного значения («по такой-то момент, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: expires_at.lt=2018-07-18T10:51:18.139Z
  status: Yookassa::DealStatus::OPENED, # DealStatus | Фильтр по статусу сделки. Пример: status=closed
  full_text_search: 'full_text_search_example', # String | Фильтр по описанию сделки — параметру description (например, идентификатор сделки на стороне вашей интернет-площадки в ЮKassa, идентификатор покупателя или продавца). От 4 до 128 символов. Пример: 123554642-2432FF344R
  limit: 56, # Integer | Размер выдачи результатов запроса — количество объектов, передаваемых в ответе. Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
  cursor: 'cursor_example' # String | Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо использовать значение параметра next_cursor, полученное в ответе на предыдущий запрос. Используется, если в списке больше объектов, чем может поместиться в выдаче (limit), и конец выдачи не достигнут. Пример использования: https://yookassa.ru/developers/using-api/lists#pagination
}

begin
  # Список сделок
  result = api_instance.deals_get(opts)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->deals_get: #{e}"
end
```

#### Using the deals_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<DealList>, Integer, Hash)> deals_get_with_http_info(opts)

```ruby
begin
  # Список сделок
  data, status_code, headers = api_instance.deals_get_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <DealList>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->deals_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **created_at_gte** | **Time** | Фильтр по времени создания: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_gt** | **Time** | Фильтр по времени создания: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_lte** | **Time** | Фильтр по времени создания: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_lt** | **Time** | Фильтр по времени создания: время должно быть меньше указанного значения («по такой-то момент, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **expires_at_gte** | **Time** | Фильтр по времени автоматического закрытия сделки: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: expires_at.gte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **expires_at_gt** | **Time** | Фильтр по времени автоматического закрытия сделки: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: expires_at.gt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **expires_at_lte** | **Time** | Фильтр по времени автоматического закрытия сделки: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: expires_at.lte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **expires_at_lt** | **Time** | Фильтр по времени автоматического закрытия сделки: время должно быть меньше указанного значения («по такой-то момент, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: expires_at.lt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **status** | [**DealStatus**](.md) | Фильтр по статусу сделки. Пример: status&#x3D;closed | [optional] |
| **full_text_search** | **String** | Фильтр по описанию сделки — параметру description (например, идентификатор сделки на стороне вашей интернет-площадки в ЮKassa, идентификатор покупателя или продавца). От 4 до 128 символов. Пример: 123554642-2432FF344R | [optional] |
| **limit** | **Integer** | Размер выдачи результатов запроса — количество объектов, передаваемых в ответе. Возможные значения: от 1 до 100. Пример: limit&#x3D;50 Значение по умолчанию: 10 | [optional][default to 10] |
| **cursor** | **String** | Указатель на следующий фрагмент списка. Пример: cursor&#x3D;37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо использовать значение параметра next_cursor, полученное в ответе на предыдущий запрос. Используется, если в списке больше объектов, чем может поместиться в выдаче (limit), и конец выдачи не достигнут. Пример использования: https://yookassa.ru/developers/using-api/lists#pagination | [optional] |

### Return type

[**DealList**](DealList.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## deals_post

> <SafeDeal> deals_post(idempotence_key, safe_deal_request)

Создание сделки

Запрос позволяет создать сделку, в рамках которой необходимо принять оплату от покупателя и перечислить ее продавцу.

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

api_instance = Yookassa::DefaultApi.new
idempotence_key = 'idempotence_key_example' # String | 
safe_deal_request = Yookassa::SafeDealRequest.new({type: Yookassa::DealType::SAFE_DEAL, fee_moment: Yookassa::FeeMoment::PAYMENT_SUCCEEDED}) # SafeDealRequest | 

begin
  # Создание сделки
  result = api_instance.deals_post(idempotence_key, safe_deal_request)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->deals_post: #{e}"
end
```

#### Using the deals_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SafeDeal>, Integer, Hash)> deals_post_with_http_info(idempotence_key, safe_deal_request)

```ruby
begin
  # Создание сделки
  data, status_code, headers = api_instance.deals_post_with_http_info(idempotence_key, safe_deal_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SafeDeal>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->deals_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **idempotence_key** | **String** |  | [default to &#39;2e1da982-1bb1-41f0-b9cf-758cc8bcf069&#39;] |
| **safe_deal_request** | [**SafeDealRequest**](SafeDealRequest.md) |  |  |

### Return type

[**SafeDeal**](SafeDeal.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## invoices_invoice_id_get

> <Invoice> invoices_invoice_id_get(invoice_id)

Информация о счете

Используйте этот запрос, чтобы получить информацию о текущем состоянии счета по его уникальному идентификатору.

### Examples

```ruby
require 'time'
require 'yookassarb'
# setup authorization
Yookassa.configure do |config|
  # Configure HTTP basic authorization: BasicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Yookassa::DefaultApi.new
invoice_id = 'invoice_id_example' # String | Идентификатор счета в ЮKassa.

begin
  # Информация о счете
  result = api_instance.invoices_invoice_id_get(invoice_id)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->invoices_invoice_id_get: #{e}"
end
```

#### Using the invoices_invoice_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Invoice>, Integer, Hash)> invoices_invoice_id_get_with_http_info(invoice_id)

```ruby
begin
  # Информация о счете
  data, status_code, headers = api_instance.invoices_invoice_id_get_with_http_info(invoice_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Invoice>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->invoices_invoice_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **invoice_id** | **String** | Идентификатор счета в ЮKassa. | [default to &#39;in-e44e8088-bd73-43b1-959a-954f3a7d0c54?&gt;&#39;] |

### Return type

[**Invoice**](Invoice.md)

### Authorization

[BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## invoices_post

> <Invoice> invoices_post(idempotence_key, create_invoice_request)

Создание счета

Используйте этот запрос, чтобы создать в ЮKassa объект счета: https://yookassa.ru/developers/api#invoice_object. В запросе необходимо передать данные о заказе, которые отобразятся на странице счета, и данные для проведения платежа.

### Examples

```ruby
require 'time'
require 'yookassarb'
# setup authorization
Yookassa.configure do |config|
  # Configure HTTP basic authorization: BasicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Yookassa::DefaultApi.new
idempotence_key = 'idempotence_key_example' # String | 
create_invoice_request = Yookassa::CreateInvoiceRequest.new({payment_data: Yookassa::PaymentData.new({amount: Yookassa::MonetaryAmount.new({value: '1000.00', currency: Yookassa::CurrencyCode::RUB})}), cart: [Yookassa::LineItem.new({description: 'description_example', price: Yookassa::MonetaryAmount.new({value: '1000.00', currency: Yookassa::CurrencyCode::RUB}), quantity: 1})], expires_at: Time.parse('2024-10-18T10:51:18.139Z')}) # CreateInvoiceRequest | 

begin
  # Создание счета
  result = api_instance.invoices_post(idempotence_key, create_invoice_request)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->invoices_post: #{e}"
end
```

#### Using the invoices_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Invoice>, Integer, Hash)> invoices_post_with_http_info(idempotence_key, create_invoice_request)

```ruby
begin
  # Создание счета
  data, status_code, headers = api_instance.invoices_post_with_http_info(idempotence_key, create_invoice_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Invoice>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->invoices_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **idempotence_key** | **String** |  | [default to &#39;2e1da982-1bb1-41f0-b9cf-758cc8bcf069&#39;] |
| **create_invoice_request** | [**CreateInvoiceRequest**](CreateInvoiceRequest.md) |  |  |

### Return type

[**Invoice**](Invoice.md)

### Authorization

[BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## me_get

> <Me> me_get(opts)

Информация о настройках магазина или шлюза

С помощью этого запроса вы можете получить информацию о магазине или шлюзе: Для Сплитования платежей: https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics: в запросе необходимо передать параметр on_behalf_of с идентификатором магазина продавца и ваши данные для аутентификации: https://yookassa.ru/developers/using-api/interaction-format#auth (идентификатор и секретный ключ вашей платформы).; Для партнеров: https://yookassa.ru/developers/solutions-for-platforms/partners-api/basics: в запросе необходимо передать OAuth-токен магазина.; Для выплат: https://yookassa.ru/developers/payouts/overview: в запросе необходимо передать ваши данные для аутентификации: https://yookassa.ru/developers/using-api/interaction-format#auth (идентификатор и секретный ключ вашего шлюза).

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

api_instance = Yookassa::DefaultApi.new
opts = {
  on_behalf_of: 'on_behalf_of_example' # String | Только для тех, кто использует Сплитование платежей: https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics. Идентификатор магазина продавца, подключенного к вашей платформе, информацию о котором вы хотите узнать.
}

begin
  # Информация о настройках магазина или шлюза
  result = api_instance.me_get(opts)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->me_get: #{e}"
end
```

#### Using the me_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Me>, Integer, Hash)> me_get_with_http_info(opts)

```ruby
begin
  # Информация о настройках магазина или шлюза
  data, status_code, headers = api_instance.me_get_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Me>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->me_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **on_behalf_of** | **String** | Только для тех, кто использует Сплитование платежей: https://yookassa.ru/developers/solutions-for-platforms/split-payments/basics. Идентификатор магазина продавца, подключенного к вашей платформе, информацию о котором вы хотите узнать. | [optional] |

### Return type

[**Me**](Me.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## payment_methods_payment_method_id_get

> <SavePaymentMethodBankCard> payment_methods_payment_method_id_get(payment_method_id)

Информация о способе оплаты

Используйте этот запрос, чтобы получить информацию о текущем состоянии способа оплаты по его уникальному идентификатору.

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

api_instance = Yookassa::DefaultApi.new
payment_method_id = 'payment_method_id_example' # String | Идентификатор сохраненного способа оплаты.

begin
  # Информация о способе оплаты
  result = api_instance.payment_methods_payment_method_id_get(payment_method_id)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payment_methods_payment_method_id_get: #{e}"
end
```

#### Using the payment_methods_payment_method_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SavePaymentMethodBankCard>, Integer, Hash)> payment_methods_payment_method_id_get_with_http_info(payment_method_id)

```ruby
begin
  # Информация о способе оплаты
  data, status_code, headers = api_instance.payment_methods_payment_method_id_get_with_http_info(payment_method_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SavePaymentMethodBankCard>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payment_methods_payment_method_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_method_id** | **String** | Идентификатор сохраненного способа оплаты. |  |

### Return type

[**SavePaymentMethodBankCard**](SavePaymentMethodBankCard.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## payment_methods_post

> <SavePaymentMethodBankCard> payment_methods_post(idempotence_key, save_payment_method_data_bank_card)

Создание способа оплаты

Используйте этот запрос, чтобы создать в ЮKassa объект способа оплаты: https://yookassa.ru/developers/api#payment_method_object. В запросе необходимо передать код способа оплаты, который вы хотите сохранить, и при необходимости дополнительные параметры, связанные с той функциональностью, которую вы хотите использовать. Идентификатор созданного способа оплаты вы можете использовать при проведении автоплатежей: https://yookassa.ru/developers/payment-acceptance/scenario-extensions/recurring-payments/create-recurring или выплат: https://yookassa.ru/developers/payouts/scenario-extensions/multipurpose-token.

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

api_instance = Yookassa::DefaultApi.new
idempotence_key = 'idempotence_key_example' # String | 
save_payment_method_data_bank_card = Yookassa::SavePaymentMethodDataBankCard.new({type: 'bank_card'}) # SavePaymentMethodDataBankCard | 

begin
  # Создание способа оплаты
  result = api_instance.payment_methods_post(idempotence_key, save_payment_method_data_bank_card)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payment_methods_post: #{e}"
end
```

#### Using the payment_methods_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SavePaymentMethodBankCard>, Integer, Hash)> payment_methods_post_with_http_info(idempotence_key, save_payment_method_data_bank_card)

```ruby
begin
  # Создание способа оплаты
  data, status_code, headers = api_instance.payment_methods_post_with_http_info(idempotence_key, save_payment_method_data_bank_card)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SavePaymentMethodBankCard>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payment_methods_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **idempotence_key** | **String** |  | [default to &#39;2e1da982-1bb1-41f0-b9cf-758cc8bcf069&#39;] |
| **save_payment_method_data_bank_card** | [**SavePaymentMethodDataBankCard**](SavePaymentMethodDataBankCard.md) |  |  |

### Return type

[**SavePaymentMethodBankCard**](SavePaymentMethodBankCard.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## payments_get

> <PaymentList> payments_get(opts)

Список платежей

Используйте этот запрос, чтобы получить список платежей. Для выгрузки доступны платежи, созданные за последние 3 года. Список можно отфильтровать по различным критериям. Подробнее о работе со списками: https://yookassa.ru/developers/using-api/lists

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

api_instance = Yookassa::DefaultApi.new
opts = {
  created_at_gte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gte=2018-07-18T10:51:18.139Z
  created_at_gt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gt=2018-07-18T10:51:18.139Z
  created_at_lte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lte=2018-07-18T10:51:18.139Z
  created_at_lt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть меньше указанного значения («по такой-то момент, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lt=2018-07-18T10:51:18.139Z
  captured_at_gte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени подтверждения платежей: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: captured_at.gte=2018-07-18T10:51:18.139Z
  captured_at_gt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени подтверждения платежей: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: captured_at.gt=2018-07-18T10:51:18.139Z
  captured_at_lte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени подтверждения платежей: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: captured_at.lte=2018-07-18T10:51:18.139Z
  captured_at_lt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени подтверждения платежей: время должно быть меньше указанного значения («по такой-то момент, не включая его») Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: captured_at.lt=2018-07-18T10:51:18.139Z
  payment_method: Yookassa::PaymentMethodType::BANK_CARD, # PaymentMethodType | Фильтр по коду способа оплаты: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods#all. Пример: payment_method=bank_card
  status: Yookassa::PaymentStatus::PENDING, # PaymentStatus | Фильтр по статусу платежа: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#lifecycle. Пример: status=succeeded
  limit: 56, # Integer | Размер выдачи результатов запроса — количество объектов, передаваемых в ответе. Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
  cursor: 'cursor_example' # String | Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо использовать значение параметра next_cursor, полученное в ответе на предыдущий запрос. Используется, если в списке больше объектов, чем может поместиться в выдаче (limit), и конец выдачи не достигнут. Пример использования: https://yookassa.ru/developers/using-api/lists#pagination
}

begin
  # Список платежей
  result = api_instance.payments_get(opts)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payments_get: #{e}"
end
```

#### Using the payments_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PaymentList>, Integer, Hash)> payments_get_with_http_info(opts)

```ruby
begin
  # Список платежей
  data, status_code, headers = api_instance.payments_get_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PaymentList>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payments_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **created_at_gte** | **Time** | Фильтр по времени создания: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_gt** | **Time** | Фильтр по времени создания: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_lte** | **Time** | Фильтр по времени создания: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_lt** | **Time** | Фильтр по времени создания: время должно быть меньше указанного значения («по такой-то момент, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **captured_at_gte** | **Time** | Фильтр по времени подтверждения платежей: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: captured_at.gte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **captured_at_gt** | **Time** | Фильтр по времени подтверждения платежей: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: captured_at.gt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **captured_at_lte** | **Time** | Фильтр по времени подтверждения платежей: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: captured_at.lte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **captured_at_lt** | **Time** | Фильтр по времени подтверждения платежей: время должно быть меньше указанного значения («по такой-то момент, не включая его») Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: captured_at.lt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **payment_method** | [**PaymentMethodType**](.md) | Фильтр по коду способа оплаты: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-methods#all. Пример: payment_method&#x3D;bank_card | [optional] |
| **status** | [**PaymentStatus**](.md) | Фильтр по статусу платежа: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#lifecycle. Пример: status&#x3D;succeeded | [optional] |
| **limit** | **Integer** | Размер выдачи результатов запроса — количество объектов, передаваемых в ответе. Возможные значения: от 1 до 100. Пример: limit&#x3D;50 Значение по умолчанию: 10 | [optional][default to 10] |
| **cursor** | **String** | Указатель на следующий фрагмент списка. Пример: cursor&#x3D;37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо использовать значение параметра next_cursor, полученное в ответе на предыдущий запрос. Используется, если в списке больше объектов, чем может поместиться в выдаче (limit), и конец выдачи не достигнут. Пример использования: https://yookassa.ru/developers/using-api/lists#pagination | [optional] |

### Return type

[**PaymentList**](PaymentList.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## payments_payment_id_cancel_post

> <Payment> payments_payment_id_cancel_post(payment_id, idempotence_key)

Отмена платежа

Отменяет платеж, находящийся в статусе waiting_for_capture. Отмена платежа значит, что вы не готовы выдать пользователю товар или оказать услугу. Как только вы отменяете платеж, мы начинаем возвращать деньги на счет плательщика. Для платежей банковскими картами, из кошелька ЮMoney или через SberPay отмена происходит мгновенно. Для остальных способов оплаты возврат может занимать до нескольких дней. Подробнее о подтверждении и отмене платежей: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-and-cancel

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

api_instance = Yookassa::DefaultApi.new
payment_id = 'payment_id_example' # String | Идентификатор платежа.
idempotence_key = 'idempotence_key_example' # String | 

begin
  # Отмена платежа
  result = api_instance.payments_payment_id_cancel_post(payment_id, idempotence_key)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payments_payment_id_cancel_post: #{e}"
end
```

#### Using the payments_payment_id_cancel_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Payment>, Integer, Hash)> payments_payment_id_cancel_post_with_http_info(payment_id, idempotence_key)

```ruby
begin
  # Отмена платежа
  data, status_code, headers = api_instance.payments_payment_id_cancel_post_with_http_info(payment_id, idempotence_key)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Payment>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payments_payment_id_cancel_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_id** | **String** | Идентификатор платежа. |  |
| **idempotence_key** | **String** |  | [default to &#39;2e1da982-1bb1-41f0-b9cf-758cc8bcf069&#39;] |

### Return type

[**Payment**](Payment.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## payments_payment_id_capture_post

> <Payment> payments_payment_id_capture_post(payment_id, idempotence_key, payment_capture_request)

Подтверждение платежа

Подтверждает вашу готовность принять платеж. После подтверждения платеж перейдет в статус succeeded. Это значит, что вы можете выдать товар или оказать услугу пользователю. Подтвердить можно только платеж в статусе waiting_for_capture и только в течение определенного времени (зависит от способа оплаты). Если вы не подтвердите платеж в отведенное время, он автоматически перейдет в статус canceled, и деньги вернутся пользователю. Подробнее о подтверждении и отмене платежей: https://yookassa.ru/developers/payment-acceptance/getting-started/payment-process#capture-and-cancel

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

api_instance = Yookassa::DefaultApi.new
payment_id = 'payment_id_example' # String | Идентификатор платежа.
idempotence_key = 'idempotence_key_example' # String | 
payment_capture_request = Yookassa::PaymentCaptureRequest.new # PaymentCaptureRequest | 

begin
  # Подтверждение платежа
  result = api_instance.payments_payment_id_capture_post(payment_id, idempotence_key, payment_capture_request)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payments_payment_id_capture_post: #{e}"
end
```

#### Using the payments_payment_id_capture_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Payment>, Integer, Hash)> payments_payment_id_capture_post_with_http_info(payment_id, idempotence_key, payment_capture_request)

```ruby
begin
  # Подтверждение платежа
  data, status_code, headers = api_instance.payments_payment_id_capture_post_with_http_info(payment_id, idempotence_key, payment_capture_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Payment>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payments_payment_id_capture_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_id** | **String** | Идентификатор платежа. |  |
| **idempotence_key** | **String** |  | [default to &#39;2e1da982-1bb1-41f0-b9cf-758cc8bcf069&#39;] |
| **payment_capture_request** | [**PaymentCaptureRequest**](PaymentCaptureRequest.md) |  |  |

### Return type

[**Payment**](Payment.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## payments_payment_id_get

> <Payment> payments_payment_id_get(payment_id)

Информация о платеже

Запрос позволяет получить информацию о текущем состоянии платежа по его уникальному идентификатору.

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

api_instance = Yookassa::DefaultApi.new
payment_id = 'payment_id_example' # String | Идентификатор платежа.

begin
  # Информация о платеже
  result = api_instance.payments_payment_id_get(payment_id)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payments_payment_id_get: #{e}"
end
```

#### Using the payments_payment_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Payment>, Integer, Hash)> payments_payment_id_get_with_http_info(payment_id)

```ruby
begin
  # Информация о платеже
  data, status_code, headers = api_instance.payments_payment_id_get_with_http_info(payment_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Payment>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payments_payment_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payment_id** | **String** | Идентификатор платежа. |  |

### Return type

[**Payment**](Payment.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## payments_post

> <Payment> payments_post(idempotence_key, create_payment_request)

Создание платежа

Чтобы принять оплату, необходимо создать объект платежа: https://yookassa.ru/developers/api#payment_object — Payment. Он содержит всю необходимую информацию для проведения оплаты (сумму, валюту и статус). У платежа линейный жизненный цикл, он последовательно переходит из статуса в статус.

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

api_instance = Yookassa::DefaultApi.new
idempotence_key = 'idempotence_key_example' # String | 
create_payment_request = Yookassa::CreatePaymentRequest.new({amount: Yookassa::MonetaryAmount.new({value: '1000.00', currency: Yookassa::CurrencyCode::RUB})}) # CreatePaymentRequest | 

begin
  # Создание платежа
  result = api_instance.payments_post(idempotence_key, create_payment_request)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payments_post: #{e}"
end
```

#### Using the payments_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Payment>, Integer, Hash)> payments_post_with_http_info(idempotence_key, create_payment_request)

```ruby
begin
  # Создание платежа
  data, status_code, headers = api_instance.payments_post_with_http_info(idempotence_key, create_payment_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Payment>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payments_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **idempotence_key** | **String** |  | [default to &#39;2e1da982-1bb1-41f0-b9cf-758cc8bcf069&#39;] |
| **create_payment_request** | [**CreatePaymentRequest**](CreatePaymentRequest.md) |  |  |

### Return type

[**Payment**](Payment.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## payouts_get

> <PayoutsList> payouts_get(opts)

Список выплат

Используйте этот запрос, чтобы получить список выплат. Для выгрузки доступны выплаты, созданные за последние 3 года. Список можно отфильтровать по различным критериям. Данные для аутентификации: https://yookassa.ru/developers/using-api/interaction-format#auth запросов зависят от того, какое платежное решение вы используете — обычные выплаты: https://yookassa.ru/developers/payouts/overview или выплаты в рамках Безопасной сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics. Подробнее о работе со списками: https://yookassa.ru/developers/using-api/lists

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

api_instance = Yookassa::DefaultApi.new
opts = {
  created_at_gte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gte=2018-07-18T10:51:18.139Z
  created_at_gt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gt=2018-07-18T10:51:18.139Z
  created_at_lte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lte=2018-07-18T10:51:18.139Z
  created_at_lt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть меньше указанного значения («по такой-то момент, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lt=2018-07-18T10:51:18.139Z
  payout_destination_type: Yookassa::PayoutDestinationDataType::YOO_MONEY, # PayoutDestinationDataType | Фильтр по коду способа получения выплаты: https://yookassa.ru/developers/payouts/getting-started/payout-types-and-limits#types-destination. Пример: payout_destination.type=bank_card
  status: Yookassa::PayoutStatus::PENDING, # PayoutStatus | Фильтр по статусу выплаты: https://yookassa.ru/developers/api#payout_object_status. Пример: status=succeeded
  limit: 56, # Integer | Размер выдачи результатов запроса — количество объектов, передаваемых в ответе. Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
  cursor: 'cursor_example' # String | Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо использовать значение параметра next_cursor, полученное в ответе на предыдущий запрос. Используется, если в списке больше объектов, чем может поместиться в выдаче (limit), и конец выдачи не достигнут. Пример использования: https://yookassa.ru/developers/using-api/lists#pagination
}

begin
  # Список выплат
  result = api_instance.payouts_get(opts)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payouts_get: #{e}"
end
```

#### Using the payouts_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PayoutsList>, Integer, Hash)> payouts_get_with_http_info(opts)

```ruby
begin
  # Список выплат
  data, status_code, headers = api_instance.payouts_get_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PayoutsList>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payouts_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **created_at_gte** | **Time** | Фильтр по времени создания: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_gt** | **Time** | Фильтр по времени создания: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_lte** | **Time** | Фильтр по времени создания: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_lt** | **Time** | Фильтр по времени создания: время должно быть меньше указанного значения («по такой-то момент, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **payout_destination_type** | [**PayoutDestinationDataType**](.md) | Фильтр по коду способа получения выплаты: https://yookassa.ru/developers/payouts/getting-started/payout-types-and-limits#types-destination. Пример: payout_destination.type&#x3D;bank_card | [optional] |
| **status** | [**PayoutStatus**](.md) | Фильтр по статусу выплаты: https://yookassa.ru/developers/api#payout_object_status. Пример: status&#x3D;succeeded | [optional] |
| **limit** | **Integer** | Размер выдачи результатов запроса — количество объектов, передаваемых в ответе. Возможные значения: от 1 до 100. Пример: limit&#x3D;50 Значение по умолчанию: 10 | [optional][default to 10] |
| **cursor** | **String** | Указатель на следующий фрагмент списка. Пример: cursor&#x3D;37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо использовать значение параметра next_cursor, полученное в ответе на предыдущий запрос. Используется, если в списке больше объектов, чем может поместиться в выдаче (limit), и конец выдачи не достигнут. Пример использования: https://yookassa.ru/developers/using-api/lists#pagination | [optional] |

### Return type

[**PayoutsList**](PayoutsList.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## payouts_payout_id_get

> <Payout> payouts_payout_id_get(payout_id)

Информация о выплате

Используйте этот запрос, чтобы получить информацию о текущем состоянии выплаты по ее уникальному идентификатору. Данные для аутентификации: https://yookassa.ru/developers/using-api/interaction-format#auth запросов зависят от того, какое платежное решение вы используете — обычные выплаты: https://yookassa.ru/developers/payouts/overview или выплаты в рамках Безопасной сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.

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

api_instance = Yookassa::DefaultApi.new
payout_id = 'payout_id_example' # String | 

begin
  # Информация о выплате
  result = api_instance.payouts_payout_id_get(payout_id)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payouts_payout_id_get: #{e}"
end
```

#### Using the payouts_payout_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Payout>, Integer, Hash)> payouts_payout_id_get_with_http_info(payout_id)

```ruby
begin
  # Информация о выплате
  data, status_code, headers = api_instance.payouts_payout_id_get_with_http_info(payout_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Payout>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payouts_payout_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **payout_id** | **String** |  |  |

### Return type

[**Payout**](Payout.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## payouts_post

> <Payout> payouts_post(idempotence_key, payout_request)

Создание выплаты

Используйте этот запрос, чтобы создать в ЮKassa объект выплаты: https://yookassa.ru/developers/api#payout_object. В запросе необходимо передать сумму выплаты, данные о способе получения выплаты (например, номер кошелька ЮMoney), описание выплаты и при необходимости дополнительные параметры, связанные с той функциональностью, которую вы хотите использовать. Передаваемые параметры и данные для аутентификации: https://yookassa.ru/developers/using-api/interaction-format#auth запросов зависят от того, какое платежное решение вы используете — обычные выплаты: https://yookassa.ru/developers/payouts/overview или выплаты в рамках Безопасной сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.

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

api_instance = Yookassa::DefaultApi.new
idempotence_key = 'idempotence_key_example' # String | 
payout_request = Yookassa::PayoutRequest.new({amount: Yookassa::MonetaryAmount.new({value: '1000.00', currency: Yookassa::CurrencyCode::RUB})}) # PayoutRequest | 

begin
  # Создание выплаты
  result = api_instance.payouts_post(idempotence_key, payout_request)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payouts_post: #{e}"
end
```

#### Using the payouts_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Payout>, Integer, Hash)> payouts_post_with_http_info(idempotence_key, payout_request)

```ruby
begin
  # Создание выплаты
  data, status_code, headers = api_instance.payouts_post_with_http_info(idempotence_key, payout_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Payout>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payouts_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **idempotence_key** | **String** |  | [default to &#39;2e1da982-1bb1-41f0-b9cf-758cc8bcf069&#39;] |
| **payout_request** | [**PayoutRequest**](PayoutRequest.md) |  |  |

### Return type

[**Payout**](Payout.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## payouts_search_get

> <PayoutsList> payouts_search_get(opts)

Поиск выплат

Используйте этот запрос для поиска выплат по заданным критериям. Доступно только для выплат, созданных за последние 3 месяца. Сейчас доступен поиск только по параметру metadata. Дополнительно можно указать дату и время создания выплаты (параметр created_at). Данные для аутентификации: https://yookassa.ru/developers/using-api/interaction-format#auth запросов зависят от того, какое платежное решение вы используете — обычные выплаты: https://yookassa.ru/developers/payouts/overview или выплаты в рамках Безопасной сделки: https://yookassa.ru/developers/solutions-for-platforms/safe-deal/basics.

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

api_instance = Yookassa::DefaultApi.new
opts = {
  created_at_gte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gte=2018-07-18T10:51:18.139Z
  created_at_gt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gt=2018-07-18T10:51:18.139Z
  created_at_lte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lte=2018-07-18T10:51:18.139Z
  created_at_lt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть меньше указанного значения («по такой-то момент, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lt=2018-07-18T10:51:18.139Z
  metadata: { key: { key: 'inner_example'}}, # Hash<String, String> | Фильтр по объекту metadata. Строгий поиск по паре «ключ-значение»: возвращаются объекты, у которых в metadata есть точное совпадение по ключу и по значению. Ограничения: можно передать максимум одну пару «ключ-значение», имя ключа не больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в формате UTF-8 в URL-encoded виде. Шаблон: metadata[key]=value Пример: metadata%5Boperation_id%5D=e2ab2e1c-776d-4376-aba8-d2099243d1f6
  limit: 56, # Integer | Размер выдачи результатов запроса — количество объектов, передаваемых в ответе. Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
  cursor: 'cursor_example' # String | Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо использовать значение параметра next_cursor, полученное в ответе на предыдущий запрос. Используется, если в списке больше объектов, чем может поместиться в выдаче (limit), и конец выдачи не достигнут. Пример использования: https://yookassa.ru/developers/using-api/lists#pagination
}

begin
  # Поиск выплат
  result = api_instance.payouts_search_get(opts)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payouts_search_get: #{e}"
end
```

#### Using the payouts_search_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PayoutsList>, Integer, Hash)> payouts_search_get_with_http_info(opts)

```ruby
begin
  # Поиск выплат
  data, status_code, headers = api_instance.payouts_search_get_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PayoutsList>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->payouts_search_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **created_at_gte** | **Time** | Фильтр по времени создания: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_gt** | **Time** | Фильтр по времени создания: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_lte** | **Time** | Фильтр по времени создания: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_lt** | **Time** | Фильтр по времени создания: время должно быть меньше указанного значения («по такой-то момент, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **metadata** | [**Hash&lt;String, String&gt;**](String.md) | Фильтр по объекту metadata. Строгий поиск по паре «ключ-значение»: возвращаются объекты, у которых в metadata есть точное совпадение по ключу и по значению. Ограничения: можно передать максимум одну пару «ключ-значение», имя ключа не больше 32 символов, значение ключа не больше 512 символов, тип данных — строка в формате UTF-8 в URL-encoded виде. Шаблон: metadata[key]&#x3D;value Пример: metadata%5Boperation_id%5D&#x3D;e2ab2e1c-776d-4376-aba8-d2099243d1f6 | [optional] |
| **limit** | **Integer** | Размер выдачи результатов запроса — количество объектов, передаваемых в ответе. Возможные значения: от 1 до 100. Пример: limit&#x3D;50 Значение по умолчанию: 10 | [optional][default to 10] |
| **cursor** | **String** | Указатель на следующий фрагмент списка. Пример: cursor&#x3D;37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо использовать значение параметра next_cursor, полученное в ответе на предыдущий запрос. Используется, если в списке больше объектов, чем может поместиться в выдаче (limit), и конец выдачи не достигнут. Пример использования: https://yookassa.ru/developers/using-api/lists#pagination | [optional] |

### Return type

[**PayoutsList**](PayoutsList.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## personal_data_personal_data_id_get

> <PersonalData> personal_data_personal_data_id_get(personal_data_id)

Информация о персональных данных

С помощью этого запроса вы можете получить информацию о текущем статусе объекта персональных данных по его уникальному идентификатору.

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

api_instance = Yookassa::DefaultApi.new
personal_data_id = 'personal_data_id_example' # String | 

begin
  # Информация о персональных данных
  result = api_instance.personal_data_personal_data_id_get(personal_data_id)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->personal_data_personal_data_id_get: #{e}"
end
```

#### Using the personal_data_personal_data_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PersonalData>, Integer, Hash)> personal_data_personal_data_id_get_with_http_info(personal_data_id)

```ruby
begin
  # Информация о персональных данных
  data, status_code, headers = api_instance.personal_data_personal_data_id_get_with_http_info(personal_data_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PersonalData>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->personal_data_personal_data_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **personal_data_id** | **String** |  |  |

### Return type

[**PersonalData**](PersonalData.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## personal_data_post

> <PersonalData> personal_data_post(idempotence_key, personal_data_post_request)

Создание персональных данных

Используйте этот запрос, чтобы создать в ЮKassa объект персональных данных: https://yookassa.ru/developers/api#personal_data_object. В запросе необходимо указать тип данных (с какой целью они будут использоваться) и передать информацию о пользователе: фамилию, имя, отчество и другие — в зависимости от выбранного типа. Идентификатор созданного объекта персональных данных необходимо использовать в запросе на создание выплаты: https://yookassa.ru/developers/api#create_payout.

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

api_instance = Yookassa::DefaultApi.new
idempotence_key = 'idempotence_key_example' # String | 
personal_data_post_request = Yookassa::PayoutStatementRecipientPersonalDataRequest.new({last_name: 'Иванов', first_name: 'Иван', birthdate: Date.parse('Wed Nov 18 03:00:00 MSK 2020'), type: Yookassa::PersonalDataType::PAYOUT_STATEMENT_RECIPIENT}) # PersonalDataPostRequest | 

begin
  # Создание персональных данных
  result = api_instance.personal_data_post(idempotence_key, personal_data_post_request)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->personal_data_post: #{e}"
end
```

#### Using the personal_data_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PersonalData>, Integer, Hash)> personal_data_post_with_http_info(idempotence_key, personal_data_post_request)

```ruby
begin
  # Создание персональных данных
  data, status_code, headers = api_instance.personal_data_post_with_http_info(idempotence_key, personal_data_post_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PersonalData>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->personal_data_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **idempotence_key** | **String** |  | [default to &#39;2e1da982-1bb1-41f0-b9cf-758cc8bcf069&#39;] |
| **personal_data_post_request** | [**PersonalDataPostRequest**](PersonalDataPostRequest.md) |  |  |

### Return type

[**PersonalData**](PersonalData.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## receipts_get

> <ReceiptList> receipts_get(opts)

Список чеков

Запрос позволяет получить список чеков, отфильтрованный по заданным критериям. Можно запросить чеки по конкретному платежу, чеки по конкретному возврату или все чеки магазина. Подробнее о работе со списками: https://yookassa.ru/developers/using-api/lists

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

api_instance = Yookassa::DefaultApi.new
opts = {
  created_at_gte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gte=2018-07-18T10:51:18.139Z
  created_at_gt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gt=2018-07-18T10:51:18.139Z
  created_at_lte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lte=2018-07-18T10:51:18.139Z
  created_at_lt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть меньше указанного значения («по такой-то момент, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lt=2018-07-18T10:51:18.139Z
  status: Yookassa::ReceiptRegistrationStatus::PENDING, # ReceiptRegistrationStatus | Фильтр по статусу чека. Возможные значения: pending — в обработке, succeeded — успешно зарегистрирован, canceled — отменен. Пример: status=succeeded
  payment_id: 'payment_id_example', # String | Фильтр по идентификатору платежа: https://yookassa.ru/developers/api#payment_object_id (получить все чеки для указанного платежа). Пример: payment_id=1da5c87d-0984-50e8-a7f3-8de646dd9ec9 В запросе можно передать только что-то одно: или идентификатор платежа, или идентификатор возврата.
  refund_id: 'refund_id_example', # String | Фильтр по идентификатору возврата: https://yookassa.ru/developers/api#refund_object_id (получить все чеки для указанного возврата). Пример: refund_id=1da5c87d-0984-50e8-a7f3-8de646dd9ec9 В запросе можно передать только что-то одно: или идентификатор платежа, или идентификатор возврата.
  limit: 56, # Integer | Размер выдачи результатов запроса — количество объектов, передаваемых в ответе. Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
  cursor: 'cursor_example' # String | Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо использовать значение параметра next_cursor, полученное в ответе на предыдущий запрос. Используется, если в списке больше объектов, чем может поместиться в выдаче (limit), и конец выдачи не достигнут. Пример использования: https://yookassa.ru/developers/using-api/lists#pagination
}

begin
  # Список чеков
  result = api_instance.receipts_get(opts)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->receipts_get: #{e}"
end
```

#### Using the receipts_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReceiptList>, Integer, Hash)> receipts_get_with_http_info(opts)

```ruby
begin
  # Список чеков
  data, status_code, headers = api_instance.receipts_get_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReceiptList>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->receipts_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **created_at_gte** | **Time** | Фильтр по времени создания: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_gt** | **Time** | Фильтр по времени создания: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_lte** | **Time** | Фильтр по времени создания: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_lt** | **Time** | Фильтр по времени создания: время должно быть меньше указанного значения («по такой-то момент, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **status** | [**ReceiptRegistrationStatus**](.md) | Фильтр по статусу чека. Возможные значения: pending — в обработке, succeeded — успешно зарегистрирован, canceled — отменен. Пример: status&#x3D;succeeded | [optional] |
| **payment_id** | **String** | Фильтр по идентификатору платежа: https://yookassa.ru/developers/api#payment_object_id (получить все чеки для указанного платежа). Пример: payment_id&#x3D;1da5c87d-0984-50e8-a7f3-8de646dd9ec9 В запросе можно передать только что-то одно: или идентификатор платежа, или идентификатор возврата. | [optional] |
| **refund_id** | **String** | Фильтр по идентификатору возврата: https://yookassa.ru/developers/api#refund_object_id (получить все чеки для указанного возврата). Пример: refund_id&#x3D;1da5c87d-0984-50e8-a7f3-8de646dd9ec9 В запросе можно передать только что-то одно: или идентификатор платежа, или идентификатор возврата. | [optional] |
| **limit** | **Integer** | Размер выдачи результатов запроса — количество объектов, передаваемых в ответе. Возможные значения: от 1 до 100. Пример: limit&#x3D;50 Значение по умолчанию: 10 | [optional][default to 10] |
| **cursor** | **String** | Указатель на следующий фрагмент списка. Пример: cursor&#x3D;37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо использовать значение параметра next_cursor, полученное в ответе на предыдущий запрос. Используется, если в списке больше объектов, чем может поместиться в выдаче (limit), и конец выдачи не достигнут. Пример использования: https://yookassa.ru/developers/using-api/lists#pagination | [optional] |

### Return type

[**ReceiptList**](ReceiptList.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## receipts_post

> <Receipt> receipts_post(idempotence_key, post_receipt_data)

Создание чека

Используйте этот запрос при оплате с соблюдением требований 54-ФЗ: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/basics, чтобы создать чек зачета предоплаты. Если вы работаете по сценарию Сначала платеж, потом чек: https://yookassa.ru/developers/payment-acceptance/receipts/54fz/other-services/basics#receipt-after-payment, в запросе также нужно передавать данные для формирования чека прихода и чека возврата прихода.

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

api_instance = Yookassa::DefaultApi.new
idempotence_key = 'idempotence_key_example' # String | 
post_receipt_data = Yookassa::PostReceiptData.new({type: Yookassa::ReceiptType::PAYMENT, customer: Yookassa::ReceiptDataCustomer.new, items: [Yookassa::PostReceiptDataItem.new({description: 'description_example', amount: Yookassa::MonetaryAmount.new({value: '1000.00', currency: Yookassa::CurrencyCode::RUB}), vat_code: 37, quantity: 1})], _send: false, settlements: [Yookassa::Settlement.new({type: 'cashless', amount: Yookassa::MonetaryAmount.new({value: '1000.00', currency: Yookassa::CurrencyCode::RUB})})]}) # PostReceiptData | 

begin
  # Создание чека
  result = api_instance.receipts_post(idempotence_key, post_receipt_data)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->receipts_post: #{e}"
end
```

#### Using the receipts_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Receipt>, Integer, Hash)> receipts_post_with_http_info(idempotence_key, post_receipt_data)

```ruby
begin
  # Создание чека
  data, status_code, headers = api_instance.receipts_post_with_http_info(idempotence_key, post_receipt_data)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Receipt>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->receipts_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **idempotence_key** | **String** |  | [default to &#39;2e1da982-1bb1-41f0-b9cf-758cc8bcf069&#39;] |
| **post_receipt_data** | [**PostReceiptData**](PostReceiptData.md) |  |  |

### Return type

[**Receipt**](Receipt.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## receipts_receipt_id_get

> <Receipt> receipts_receipt_id_get(receipt_id)

Информация о чеке

Запрос позволяет получить информацию о текущем состоянии чека по его уникальному идентификатору.

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

api_instance = Yookassa::DefaultApi.new
receipt_id = 'receipt_id_example' # String | Идентификатор чека.

begin
  # Информация о чеке
  result = api_instance.receipts_receipt_id_get(receipt_id)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->receipts_receipt_id_get: #{e}"
end
```

#### Using the receipts_receipt_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Receipt>, Integer, Hash)> receipts_receipt_id_get_with_http_info(receipt_id)

```ruby
begin
  # Информация о чеке
  data, status_code, headers = api_instance.receipts_receipt_id_get_with_http_info(receipt_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Receipt>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->receipts_receipt_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **receipt_id** | **String** | Идентификатор чека. |  |

### Return type

[**Receipt**](Receipt.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## refunds_get

> <RefundList> refunds_get(opts)

Список возвратов

Используйте этот запрос, чтобы получить список возвратов. Для выгрузки доступны возвраты, созданные за последние 3 года. Список можно отфильтровать по различным критериям. Подробнее о работе со списками: https://yookassa.ru/developers/using-api/lists

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

api_instance = Yookassa::DefaultApi.new
opts = {
  created_at_gte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gte=2018-07-18T10:51:18.139Z
  created_at_gt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gt=2018-07-18T10:51:18.139Z
  created_at_lte: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lte=2018-07-18T10:51:18.139Z
  created_at_lt: Time.parse('2013-10-20T19:20:30+01:00'), # Time | Фильтр по времени создания: время должно быть меньше указанного значения («по такой-то момент, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lt=2018-07-18T10:51:18.139Z
  payment_id: 'payment_id_example', # String | Фильтр по идентификатору платежа: https://yookassa.ru/developers/api#payment_object_id (получить все возвраты по платежу). Пример: payment_id=1da5c87d-0984-50e8-a7f3-8de646dd9ec9
  status: Yookassa::RefundStatus::PENDING, # RefundStatus | Фильтр по статусу возврата. Возможные значения: pending — в обработке, succeeded — успешно выполнен, canceled — отменен. Пример: status=succeeded
  limit: 56, # Integer | Размер выдачи результатов запроса — количество объектов, передаваемых в ответе. Возможные значения: от 1 до 100. Пример: limit=50 Значение по умолчанию: 10
  cursor: 'cursor_example' # String | Указатель на следующий фрагмент списка. Пример: cursor=37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо использовать значение параметра next_cursor, полученное в ответе на предыдущий запрос. Используется, если в списке больше объектов, чем может поместиться в выдаче (limit), и конец выдачи не достигнут. Пример использования: https://yookassa.ru/developers/using-api/lists#pagination
}

begin
  # Список возвратов
  result = api_instance.refunds_get(opts)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->refunds_get: #{e}"
end
```

#### Using the refunds_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<RefundList>, Integer, Hash)> refunds_get_with_http_info(opts)

```ruby
begin
  # Список возвратов
  data, status_code, headers = api_instance.refunds_get_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <RefundList>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->refunds_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **created_at_gte** | **Time** | Фильтр по времени создания: время должно быть больше указанного значения или равно ему («с такого-то момента включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_gt** | **Time** | Фильтр по времени создания: время должно быть больше указанного значения («с такого-то момента, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.gt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_lte** | **Time** | Фильтр по времени создания: время должно быть меньше указанного значения или равно ему («по такой-то момент включительно»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lte&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **created_at_lt** | **Time** | Фильтр по времени создания: время должно быть меньше указанного значения («по такой-то момент, не включая его»). Указывается в формате ISO 8601: https://en.wikipedia.org/wiki/ISO_8601. Пример: created_at.lt&#x3D;2018-07-18T10:51:18.139Z | [optional] |
| **payment_id** | **String** | Фильтр по идентификатору платежа: https://yookassa.ru/developers/api#payment_object_id (получить все возвраты по платежу). Пример: payment_id&#x3D;1da5c87d-0984-50e8-a7f3-8de646dd9ec9 | [optional] |
| **status** | [**RefundStatus**](.md) | Фильтр по статусу возврата. Возможные значения: pending — в обработке, succeeded — успешно выполнен, canceled — отменен. Пример: status&#x3D;succeeded | [optional] |
| **limit** | **Integer** | Размер выдачи результатов запроса — количество объектов, передаваемых в ответе. Возможные значения: от 1 до 100. Пример: limit&#x3D;50 Значение по умолчанию: 10 | [optional][default to 10] |
| **cursor** | **String** | Указатель на следующий фрагмент списка. Пример: cursor&#x3D;37a5c87d-3984-51e8-a7f3-8de646d39ec15 В качестве указателя необходимо использовать значение параметра next_cursor, полученное в ответе на предыдущий запрос. Используется, если в списке больше объектов, чем может поместиться в выдаче (limit), и конец выдачи не достигнут. Пример использования: https://yookassa.ru/developers/using-api/lists#pagination | [optional] |

### Return type

[**RefundList**](RefundList.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## refunds_post

> <Refund> refunds_post(idempotence_key, refund_request)

Создание возврата

Создает возврат успешного платежа на указанную сумму. Платеж можно вернуть только в течение трех лет с момента его создания: https://yookassa.ru/developers/api#create_payment. Комиссия ЮKassa за проведение платежа не возвращается.

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

api_instance = Yookassa::DefaultApi.new
idempotence_key = 'idempotence_key_example' # String | 
refund_request = Yookassa::RefundRequest.new({payment_id: '1da5c87d-0984-50e8-a7f3-8de646dd9ec9', amount: Yookassa::MonetaryAmount.new({value: '1000.00', currency: Yookassa::CurrencyCode::RUB})}) # RefundRequest | 

begin
  # Создание возврата
  result = api_instance.refunds_post(idempotence_key, refund_request)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->refunds_post: #{e}"
end
```

#### Using the refunds_post_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Refund>, Integer, Hash)> refunds_post_with_http_info(idempotence_key, refund_request)

```ruby
begin
  # Создание возврата
  data, status_code, headers = api_instance.refunds_post_with_http_info(idempotence_key, refund_request)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Refund>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->refunds_post_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **idempotence_key** | **String** |  | [default to &#39;2e1da982-1bb1-41f0-b9cf-758cc8bcf069&#39;] |
| **refund_request** | [**RefundRequest**](RefundRequest.md) |  |  |

### Return type

[**Refund**](Refund.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## refunds_refund_id_get

> <Refund> refunds_refund_id_get(refund_id)

Информация о возврате

Запрос позволяет получить информацию о текущем состоянии возврата по его уникальному идентификатору.

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

api_instance = Yookassa::DefaultApi.new
refund_id = 'refund_id_example' # String | Идентификатор возврата.

begin
  # Информация о возврате
  result = api_instance.refunds_refund_id_get(refund_id)
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->refunds_refund_id_get: #{e}"
end
```

#### Using the refunds_refund_id_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Refund>, Integer, Hash)> refunds_refund_id_get_with_http_info(refund_id)

```ruby
begin
  # Информация о возврате
  data, status_code, headers = api_instance.refunds_refund_id_get_with_http_info(refund_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Refund>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->refunds_refund_id_get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **refund_id** | **String** | Идентификатор возврата. | [default to &#39;cae993f2-eb15-45f5-91c5-efb87107ae10&#39;] |

### Return type

[**Refund**](Refund.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## sbp_banks_get

> <GetSbpBanksResponse> sbp_banks_get

Список участников СБП

С помощью этого запроса вы можете получить актуальный список всех участников СБП. Список нужно вывести получателю выплаты, идентификатор выбранного участника СБП необходимо использовать в запросе на создание выплаты: https://yookassa.ru/developers/api#create_payout. Подробнее о выплатах через СБП: https://yookassa.ru/developers/payouts/making-payouts/sbp

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

api_instance = Yookassa::DefaultApi.new

begin
  # Список участников СБП
  result = api_instance.sbp_banks_get
  p result
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->sbp_banks_get: #{e}"
end
```

#### Using the sbp_banks_get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<GetSbpBanksResponse>, Integer, Hash)> sbp_banks_get_with_http_info

```ruby
begin
  # Список участников СБП
  data, status_code, headers = api_instance.sbp_banks_get_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <GetSbpBanksResponse>
rescue Yookassa::ApiError => e
  puts "Error when calling DefaultApi->sbp_banks_get_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**GetSbpBanksResponse**](GetSbpBanksResponse.md)

### Authorization

[OAuth2](../README.md#OAuth2), [BasicAuth](../README.md#BasicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

