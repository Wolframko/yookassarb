# YooKassa Ruby SDK

[![Gem Version](https://img.shields.io/gem/v/yookassa.svg)](https://rubygems.org/gems/yookassa)
[![Ruby](https://img.shields.io/badge/ruby-%3E%3D%203.1-ruby.svg)](https://www.ruby-lang.org)
[![License: MIT](https://img.shields.io/badge/license-MIT-green.svg)](LICENSE)

Удобная Ruby-библиотека для работы с [YooKassa API v3](https://yookassa.ru/developers/api). Платежи, возвраты, чеки, выплаты, сделки, вебхуки — всё через простой и идиоматичный Ruby-интерфейс.

## Установка

```ruby
# Gemfile
gem "yookassa"
```

```bash
bundle install

# или напрямую
gem install yookassa
```

## Быстрый старт

```ruby
require "yookassa"

Yookassa.configure do |config|
  config.shop_id = "your_shop_id"
  config.api_key = "your_secret_key"
end

# Создать платёж
payment = Yookassa::Payment.create(
  amount: { value: "100.00", currency: "RUB" },
  confirmation: { type: "redirect", return_url: "https://example.com/thanks" },
  description: "Заказ #72"
)

# Перенаправить пользователя на оплату
redirect_to payment.confirmation_url

# Проверить статус
payment = Yookassa::Payment.find(payment.id)
payment.succeeded?          # => true/false
payment.waiting_for_capture? # => true/false
```

## Использование

### Платежи

```ruby
# Создание
payment = Yookassa::Payment.create(
  amount: { value: "500.00", currency: "RUB" },
  payment_method_data: { type: "bank_card" },
  confirmation: { type: "redirect", return_url: "https://example.com/return" },
  description: "Подписка на месяц",
  metadata: { order_id: "42" }
)

payment.id                # => "2a7834f6-0001-5000-a000-1da326e5e123"
payment.status            # => "pending"
payment.confirmation_url  # => "https://yoomoney.ru/checkout/..."
payment.amount.value      # => "500.00"
payment.amount.currency   # => "RUB"

# Подтверждение (capture) двухстадийного платежа
captured = Yookassa::Payment.capture(payment.id,
  amount: { value: "500.00", currency: "RUB" }
)

# Отмена
canceled = Yookassa::Payment.cancel(payment.id)

# Получение по ID
payment = Yookassa::Payment.find("2a7834f6-0001-5000-a000-1da326e5e123")

# Список с фильтрами
payments = Yookassa::Payment.list(
  created_at_gte: "2024-01-01T00:00:00Z",
  status: "succeeded",
  limit: 10
)

payments.each { |p| puts "#{p.id}: #{p.amount.value} #{p.amount.currency}" }
payments.has_next? # => true/false — есть ли следующая страница
```

**Хелперы статусов:**

```ruby
payment.pending?             # => true
payment.waiting_for_capture? # => true
payment.succeeded?           # => true
payment.canceled?            # => true
```

### Возвраты

```ruby
refund = Yookassa::Refund.create(
  payment_id: "2a7834f6-0001-5000-a000-1da326e5e123",
  amount: { value: "50.00", currency: "RUB" }
)

refund = Yookassa::Refund.find(refund.id)
refunds = Yookassa::Refund.list(payment_id: "2a7834f6-...")

refund.succeeded? # => true
refund.canceled?  # => true
```

### Чеки (54-ФЗ)

```ruby
receipt = Yookassa::Receipt.create(
  customer: { email: "user@example.com" },
  items: [
    {
      description: "Подписка",
      amount: { value: "500.00", currency: "RUB" },
      vat_code: 1,
      quantity: "1"
    }
  ],
  payment_id: "2a7834f6-...",
  type: "payment"
)

receipt = Yookassa::Receipt.find(receipt.id)
receipts = Yookassa::Receipt.list(payment_id: "2a7834f6-...")
```

### Выплаты

```ruby
payout = Yookassa::Payout.create(
  amount: { value: "1000.00", currency: "RUB" },
  payout_destination_data: { type: "bank_card", card: { number: "5555555555554444" } },
  description: "Выплата продавцу"
)

payout = Yookassa::Payout.find(payout.id)
payouts = Yookassa::Payout.list(status: "succeeded")

payout.succeeded? # => true
payout.canceled?  # => true
```

### Сделки

```ruby
deal = Yookassa::Deal.create(
  type: "safe_deal",
  fee_moment: "payment_succeeded",
  description: "Безопасная сделка"
)

deal = Yookassa::Deal.find(deal.id)
deals = Yookassa::Deal.list(status: "opened")

deal.opened? # => true
deal.closed? # => true
```

### Вебхуки (управление подписками)

```ruby
client = Yookassa::Client.new(shop_id: "id", api_key: "key")

# Подписаться на событие
webhook = client.webhooks.create(
  event: "payment.succeeded",
  url: "https://example.com/webhooks/yookassa"
)

# Список подписок
client.webhooks.list.each { |wh| puts "#{wh.id}: #{wh.event}" }

# Удалить подписку
client.webhooks.delete(webhook.id)
```

### Счета

```ruby
client = Yookassa::Client.new(shop_id: "id", api_key: "key")

invoice = client.invoices.create(
  payment_data: {
    amount: { value: "1000.00", currency: "RUB" }
  },
  cart: [{ description: "Товар", amount: { value: "1000.00", currency: "RUB" }, quantity: 1 }],
  delivery_method_data: { type: "self" }
)

invoice = client.invoices.find(invoice.id)
```

### Настройки магазина

```ruby
client = Yookassa::Client.new(shop_id: "id", api_key: "key")

settings = client.settings.retrieve
settings.account_id # => "123456"
settings.status     # => "enabled"
```

## Мульти-тенантность

Для работы с несколькими магазинами используйте инстансы `Client`:

```ruby
shop_a = Yookassa::Client.new(shop_id: "shop_a", api_key: "key_a")
shop_b = Yookassa::Client.new(shop_id: "shop_b", api_key: "key_b")

payment = shop_a.payments.create(amount: { value: "100.00", currency: "RUB" }, ...)
payout  = shop_b.payouts.find("payout_id")
```

Также поддерживается OAuth2-авторизация:

```ruby
client = Yookassa::Client.new(auth_token: "your_oauth_token")
```

## Обработка входящих вебхуков

```ruby
# В контроллере (Rails, Sinatra, etc.)
class WebhooksController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    # Проверить IP отправителя
    unless Yookassa::Webhook::IpChecker.trusted?(request.remote_ip)
      head :forbidden
      return
    end

    # Распарсить уведомление
    notification = Yookassa::Webhook::Notification.parse(request.raw_post)

    case notification.event
    when Yookassa::Webhook::EventTypes::PAYMENT_SUCCEEDED
      handle_payment(notification.object)
    when Yookassa::Webhook::EventTypes::PAYMENT_CANCELED
      handle_cancellation(notification.object)
    when Yookassa::Webhook::EventTypes::REFUND_SUCCEEDED
      handle_refund(notification.object)
    end

    head :ok
  end

  private

  def handle_payment(payment)
    order = Order.find_by(payment_id: payment.id)
    order.complete! if payment.succeeded?
  end
end
```

**Типы событий:**

| Константа | Значение |
|-----------|----------|
| `PAYMENT_WAITING_FOR_CAPTURE` | `payment.waiting_for_capture` |
| `PAYMENT_SUCCEEDED` | `payment.succeeded` |
| `PAYMENT_CANCELED` | `payment.canceled` |
| `REFUND_SUCCEEDED` | `refund.succeeded` |
| `PAYOUT_SUCCEEDED` | `payout.succeeded` |
| `PAYOUT_CANCELED` | `payout.canceled` |
| `DEAL_CLOSED` | `deal.closed` |

## Обработка ошибок

```ruby
begin
  Yookassa::Payment.create(amount: { value: "-1", currency: "RUB" })
rescue Yookassa::BadRequestError => e
  e.http_code    # => 400
  e.code         # => "invalid_request"
  e.description  # => "Невалидное значение параметра amount"
  e.parameter    # => "amount"
rescue Yookassa::UnauthorizedError
  # Неверные креденшлы (401)
rescue Yookassa::ForbiddenError
  # Нет доступа (403)
rescue Yookassa::NotFoundError
  # Объект не найден (404)
rescue Yookassa::TooManyRequestsError
  # Превышен лимит запросов (429)
rescue Yookassa::InternalServerError
  # Ошибка на стороне YooKassa (500)
rescue Yookassa::ConnectionError
  # Проблемы с сетью
rescue Yookassa::TimeoutError
  # Таймаут запроса
end
```

## Конфигурация

```ruby
Yookassa.configure do |config|
  # Аутентификация (один из двух вариантов)
  config.shop_id    = "your_shop_id"   # ID магазина
  config.api_key    = "your_secret_key" # Секретный ключ
  # или
  config.auth_token = "oauth_token"     # OAuth2-токен

  # Настройки HTTP
  config.timeout     = 30   # таймаут запроса в секундах (по умолчанию: 30)
  config.max_retries = 3    # макс. количество повторов (по умолчанию: 3)
  config.retry_delay = 1.8  # базовая задержка между повторами в секундах (по умолчанию: 1.8)
  config.logger      = Rails.logger  # логгер (по умолчанию: nil)
end
```

## Встроенные механизмы

### Идемпотентность

POST и DELETE запросы автоматически получают заголовок `Idempotence-Key` (UUID v4). Можно передать свой:

```ruby
Yookassa::Payment.create(params, idempotency_key: "my-unique-key-123")
```

### Автоматические повторы

SDK автоматически повторяет запросы при HTTP 202 (Accepted), 500 и сетевых ошибках. Задержка растёт линейно: `retry_delay * attempt`.

### Обработка ошибок API

HTTP-ошибки автоматически преобразуются в типизированные исключения с полным контекстом (код, описание, параметр, тело ответа).

## Совместимость

- Ruby >= 3.1
- Faraday 1.x или 2.x

## Разработка

```bash
bundle install
bundle exec rspec          # запуск тестов
bundle exec rubocop        # линтинг
gem build yookassa.gemspec # сборка гема
```

## Лицензия

[MIT](LICENSE)
