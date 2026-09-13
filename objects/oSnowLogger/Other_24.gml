/// @desc Constructors

LoggerPayload = function(_name, _level, _message, _data) constructor {
	static __version = 1;
	
	self.level = _level;
	self.name = _name;
	self.message = _message;
	self.data = _data;
	self.timestamp = date_current_datetime();
	
	self.stacktrace = [];
	if (SNOW_LOGGER_STACKTRACE_MAX_DEPTH > 0) {
		self.stacktrace = debug_get_callstack(SNOW_LOGGER_STACKTRACE_MAX_DEPTH);
		array_pop(self.stacktrace);		// remove 0
	}

	static export = function() {
		var _payload = {};
		_payload.__version = self.__version;
		_payload.level = self.level;
		_payload.name = self.name;
		_payload.message = self.message;
		_payload.timestamp = date_datetime_string(self.timestamp);
		_payload.stacktrace = self.stacktrace;
		if (!is_undefined(self.data)) {
			_payload.data = self.data;
		}
		return _payload;
	};
};
