if (keyboard_check_released(ord(player_key))) {
	get_player_log();
}

if (keyboard_check_released(ord(player_inventory_key))) {
	get_player_inventory_log();
}

if (keyboard_check_released(ord(player_stats_key))) {
	get_player_stats_log();
}

if (keyboard_check_released(ord(world_key))) {
	get_world_log();
}