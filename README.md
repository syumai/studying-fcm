# Studying FCM
This is a sample repository for Web Push Notification with FCM(Firebase Cloud Messaging).

## Setup

```sh
bundle install
```

## Run

1. Set your FCM API key in main.rb or environment variable

```ruby:main.rb
FCM_API_KEY = 'your api key'
```

or

```sh
export FCM_API_KEY='your api key'
```

2. Start server

```sh
ruby server.rb
```

3. Subscribe with a service worker and get subscription information

```sh
open http://localhost:3300
```

then click `Subscribe` and copy text like `'{"endpoint": ... }'`

4. Send push notification

```sh
ruby main.rb '{"endpoint": ... }'
```

