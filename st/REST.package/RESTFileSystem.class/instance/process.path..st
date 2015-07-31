requests
process: request path: path
	| dir fileName |
	request isGetRequest 
		ifFalse: [request send405Response: self allowedMethods. ^ true].
	path ifEmpty: [^ false].
	
	fileName := path last.
	
	dir := path allButLast
		inject: directory
		into: [:subTotal :next | subTotal directoryNamed: next ].

	(dir exists and: [dir fileExists: fileName])
		ifFalse: [^ false].
	
	dir 
		fileNamed: fileName 
		do: [:file | request 
			send200Response: file contents 
			contentType: (self contentTypeFor: fileName)].
	^ true