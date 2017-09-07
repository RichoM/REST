initialize-release
initializeHTTP
	| port |
	port := self httpPort.
	http := WebServer newForUrl: self hostname , ':', port.
	http errorHandler: [:err :req | err defaultAction].
	http listenOn: port.
	http addService: '/' action: [:request |
		self dispatchRequest: request]