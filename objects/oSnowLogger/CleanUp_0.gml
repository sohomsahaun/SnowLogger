if (!is_undefined(connect_ping_call_later)) {
	call_cancel(connect_ping_call_later);
	connect_ping_call_later = undefined;
}

if (socket >= 0) {
	network_destroy(socket);
	socket = -1;
}