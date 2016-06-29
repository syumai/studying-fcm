'use strict';

console.log('Started', self);

self.addEventListener('install', function(event) {
	self.skipWaiting();
	console.log('Installed', event);
});

self.addEventListener('activate', function(event) {
	console.log('Activated', event);
});

self.addEventListener('push', function(event) {
	console.log('Push message received', event);
	console.log(self.registration);
	var title = 'Push message';
	event.waitUntil(
			self.registration.showNotification(title, {
				body: 'The Message',
				icon: 'images/icon.png',
				tag: 'my-tag',
				vibrate: [100, 100]
			})
		);
});

self.addEventListener('notificationclick', function(event) {
	console.log('Notification click: tag ', event.notification.tag);
	event.notification.close();
	var url = 'http://localhost:8080';
	event.waitUntil(
			clients.matchAll({
				type: 'window'
			})
			.then(function(windowClients) {
				var isFocused  = false;
				windowClients.forEach(function(client) {
					console.log(client.url);
					if(client.url.indexOf(url) >= 0 && client.focus) {
						client.focus();
						isFocused = true;
					}
				});
				if(!isFocused && clients.openWindow) {
					return clients.openWindow(url);
				}
			})
		);
});

