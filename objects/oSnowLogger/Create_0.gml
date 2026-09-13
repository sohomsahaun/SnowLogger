connect_ping_call_later = undefined;
socket = -1;

if (instance_number(oSnowLogger) > 1) {
	instance_destroy(id);
	exit;
}

event_user(14);
event_user(15);

waiting_queue = [];
connected = false;
socket = network_create_socket(network_socket_tcp);
network_connect_raw_async(socket, "127.0.0.1", SNOW_LOGGER_PORT);

connect_ping_call_later = call_later(1, time_source_units_seconds, function() {
	if (connected) {
		logger_waiting_queue_flush();
		call_cancel(connect_ping_call_later);
		connect_ping_call_later = undefined;
	}
}, true);

// Fire-and-forget pattern is reasonable for game logs