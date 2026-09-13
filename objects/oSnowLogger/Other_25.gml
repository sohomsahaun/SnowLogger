/// @desc Methods

handle_log = function(_name, _level, _message, _data) {
	var _payload = new LoggerPayload(_name, _level, _message, _data);
	if (connected) {
		logger_send(_payload);
	} else {
		array_push(waiting_queue, _payload);
	}
};

logger_waiting_queue_flush = function() {
	if (array_length(waiting_queue) > 0) {
		array_sort(waiting_queue, function(_log1, _log2) {
			return (_log1.timestamp - _log2.timestamp);
		});
		array_foreach(waiting_queue, logger_send);
		array_resize(waiting_queue, 0);
	}
};

/// @returns {Boolean} Whether it sent all of the payload successfully
logger_send = function(_payload) {
	var _json = json_stringify(_payload.export()) + "\n";
	var _buff = buffer_create(string_byte_length(_json), buffer_fixed, 1);
	buffer_write(_buff, buffer_text, _json);
	var _buff_size = buffer_get_size(_buff);
	var _sent = network_send_raw(socket, _buff, _buff_size);
	buffer_delete(_buff);
	return (_sent == _buff_size);
};
