accessing
summary: req
	| json |
	json := super summary: req.
	children keysAndValuesDo: [:key :value || condition |
		condition := conditions at: key ifAbsent: [true].
		(condition cull: self)
			ifTrue: [json at: key put: (value summary: req)]].
	^ json