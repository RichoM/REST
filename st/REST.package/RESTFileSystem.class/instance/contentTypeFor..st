requests
contentTypeFor: fileName
	| extension |
	extension := (fileName subStrings: '.') last.
	^ extension caseOf: {
		['html'] -> ['text/html; charset=utf-8'].
		['js'] -> ['text/javascript; charset=utf-8'].
		['css'] -> ['text/css; charset=utf-8']
	} otherwise: ['text/plain; charset=utf-8']