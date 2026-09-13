/// @function SnowLogger(name)
/// @param {String} [_name=""] Name of the logger
/// @description Creates a root-level logger with a name
function SnowLogger(_name = "") constructor {
	self.name = _name;
	
	/// @ignore
	/// @param {Any} _message Value written to GameMaker's standard debug output
	/// @description Writes an internal fallback diagnostic to GameMaker's standard debug output
	static __trace = function(_message) {
		show_debug_message($"[SnowLogger] {_message}");
	};
	
	/// @ignore
	/// @param {String} _level Wire-format log level
	/// @param {String} _message Human-readable log message
	/// @param {Any} [_data=undefined] Optional json data included with the log
	/// @description Forwards a log to oSnowLogger or falls back to standard debug output
	static __log = function(_level, _message, _data) {
		if (instance_exists(oSnowLogger)) {
			var _inst = instance_find(oSnowLogger, 0);
			_inst.handle_log(self.name, _level, _message, _data);
		} else {
			self.__trace("No instance of oSnowLogger found, dumping log here...");
			var _dump = _message;
			if (!is_undefined(_data)) {
				_dump += $"\t{_data}";
			}
			self.__trace(_dump);
		}
	};
	
	/// @param {String} name Name attached to logs emitted by the returned logger
	/// @returns {Struct.SnowLogger} A new logger with the given name
	/// @description Creates an independent named SnowLogger
	static create_named = function(_name) {
		var _new_name = (self.name == "")
			? _name
			: $"{self.name}{SNOW_LOGGER_INHERITED_NAME_DELIMITER}{_name}";
		return new SnowLogger(_new_name);
	};

	/// @param {String} _message Human-readable log message
	/// @param {Any} [_data=undefined] Optional json data included with the log
	/// @description Emits a debug-level log
	static debug = function(_message, _data = undefined) {
		self.__log(self.LEVEL_DEBUG, _message, _data);
	};

	/// @param {String} _message Human-readable log message
	/// @param {Any} [_data=undefined] Optional json data included with the log
	/// @description Emits an info-level log
	static info = function(_message, _data = undefined) {
		self.__log(self.LEVEL_INFO, _message, _data);
	};

	/// @param {String} _message Human-readable log message
	/// @param {Any} [_data=undefined] Optional json data included with the log
	/// @description Emits a warning-level log
	static warning = function(_message, _data = undefined) {
		self.__log(self.LEVEL_WARNING, _message, _data);
	};

	/// @param {String} _message Human-readable log message
	/// @param {Any} [_data=undefined] Optional json data included with the log
	/// @description Alias of warning
	static warn = warning;

	/// @param {String} _message Human-readable log message
	/// @param {Any} [_data=undefined] Optional json data included with the log
	/// @description Emits an error-level log
	static error = function(_message, _data = undefined) {
		self.__log(self.LEVEL_ERROR, _message, _data);
	};

	/// @param {String} _message Human-readable log message
	/// @param {Any} [_data=undefined] Optional json data included with the log
	/// @description Emits a fatal-level log
	static fatal = function(_message, _data = undefined) {
		self.__log(self.LEVEL_FATAL, _message, _data);
	};
	
	static LEVEL_DEBUG = "debug";
	static LEVEL_INFO = "info";
	static LEVEL_WARNING = "warning";
	static LEVEL_ERROR = "error";
	static LEVEL_FATAL = "fatal";
}
