initialize-release
initializeHTTPS
	| port |
	self certName ifNil: [^ self].
	port := self httpsPort.
	http := WebServer newForUrl: self hostname , ':', port.
	http certName: self certName.
	http errorHandler: [:err :req | err defaultAction].
	http listenOn: port.
	http addService: '/' action: [:request |
		self dispatchRequest: request]