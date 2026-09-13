draw_set_color(c_white);

var _x = 16, _y = 16;
draw_text(_x, _y, $"[{player_key}] to generate a random Player log");

_y += 20;
draw_text(_x, _y, $"[{player_inventory_key}] to generate a random Player Inventory log");

_y += 20;
draw_text(_x, _y, $"[{player_stats_key}] to generate a random Player Stats log");

_y += 20;
draw_text(_x, _y, $"[{world_key}] to generate a random World log");