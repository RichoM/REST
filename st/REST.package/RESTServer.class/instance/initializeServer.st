initialize-release
initializeServer	
	server := WebServer newForUrl: self serverUrl.
	server errorHandler: [:err :req | err defaultAction].
	server listenOn: 8080.
	server addService: '/' action: [:request |
		self dispatchRequest: request]