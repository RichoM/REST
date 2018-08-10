accessing
detail: req
	| json |
	json := super detail: req.
	children keysAndValuesDo: [:key :value |
		json at: key put: (value summary: req)].
	^ json