if (async_load[? "id"] == socket) {
	switch (async_load[? "type"]) {
		case network_type_non_blocking_connect:
			connected = (async_load[? "succeeded"] == 1);
			if (!connected) {
				show_debug_message($"SnowLogger not connected");
			}
		break;
		case network_type_connect:
			connected = true;
		break;
		case network_type_disconnect:
			connected = false;
		break;
		default: break;
	}
}
