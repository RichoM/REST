accessing
summary: req
	^ target value ifNotNil: [:t | t summary: req]