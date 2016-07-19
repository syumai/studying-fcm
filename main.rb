require 'webpush'
require 'json'
require './set_symbolize.rb'

DEFAULT_SUBSCRIPTION = {"endpoint":"https://updates.push.services.mozilla.com/push/v1/gAAAAABXjd50Nrg8d9E6G6BSUcZQxb49UytMQg1zD6GT37pdxUbaWIBaHAHEjUMyqMpaBO8Ue53Fp7d3DTYCsE4chmLYNY7Du5MN6PT8po4pPy-xEkOSglVBPPpyLgII6d3tMmGpIq-G","keys":{"auth":"gg82qcteyzfEJ8eMOdPiJw","p256dh":"BJC9Xh_C3ztAbQI8NnhBIrt3SVFFb__R8nqaDg4SX6uBeaFP_y7WZHWM_1QnOlKT0xvuzuxyL_hPuiGmEmnimNM"}}

subscription_json = ARGV[0]

subscription_data = subscription_json ? JSON.parse(subscription_json) : DEFAULT_SUBSCRIPTION

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
		api_key: ENV['FCM_API_KEY']
	})
)

