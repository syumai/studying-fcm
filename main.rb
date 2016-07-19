require 'webpush'
require 'json'
require './set_symbolize.rb'

FCM_API_KEY = nil # Set your FCM API key

subscription_data = JSON.parse(ARGV[0])

def subscription_params subscription
	{
		endpoint: subscription[:endpoint],
		p256dh: subscription[:keys][:p256dh],
		auth: subscription[:keys][:auth],
	}
end

message = {
	title: "test title",
	body: "body",
	url: "https://hugvr.com"
}

Webpush.payload_send(
	subscription_params(subscription_data).merge({
		message: JSON.generate(message),
		ttl: 600,
		api_key: FCM_API_KEY || ENV['FCM_API_KEY']
	})
)

