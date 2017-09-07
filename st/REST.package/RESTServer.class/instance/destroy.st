initialize-release
destroy
	http ifNotNil: [:s | s destroy].
	https ifNotNil: [:s | s destroy]