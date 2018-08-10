accessing
summary: req
	^ (super summary: req)
		at: #elements 
		put: (children collect: [:child | child summary: req] as: Array);
		yourself 