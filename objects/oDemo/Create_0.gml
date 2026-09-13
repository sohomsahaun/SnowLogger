// Create an instance of oSnowLogger before using the logger
instance_create_depth(0, 0, 0, oSnowLogger);

randomize();

// Create loggers for different purposes
player_key = "Z";
player_inventory_key = "X";
player_stats_key = "C";
world_key = "V";

player_logger = LOGGER.create_named("Player");
player_inventory_logger = player_logger.create_named("Inventory"); // Player.Inventory
player_stats_logger = player_logger.create_named("Stats");         // Player.Stats
world_logger = LOGGER.create_named("World");

// Generate example logs for demo
get_player_log = function() {
	switch (irandom(4)) {
		case 0:
			player_logger.debug("Player spawned", {
				x: irandom_range(0, 1024),
				y: irandom_range(0, 1024),
			});
		break;

		case 1:
			player_logger.info("Player entered a new area", {
				area: choose("Village", "Whispering Forest", "Ancient Ruins", "Crystal Cavern"),
			});
		break;

		case 2:
			player_logger.warning("Player health is low", {
				health: irandom_range(1, 25),
				max_health: 100,
			});
		break;

		case 3:
			player_logger.error("Player action failed", {
				action: choose("attack", "dodge", "interact", "use_item"),
				reason: choose("on cooldown", "target unavailable", "insufficient stamina"),
			});
		break;

		case 4:
			player_logger.fatal("Player state could not be restored", {
				checkpoint: irandom_range(1, 8),
				reason: "saved state is invalid",
			});
		break;
	}
};

get_player_inventory_log = function() {
	switch (irandom(4)) {
		case 0:
			player_inventory_logger.debug("Inventory opened", {
				used_slots: irandom_range(4, 18),
				total_slots: 20,
			});
		break;

		case 1:
			player_inventory_logger.info("Item added to inventory", {
				item: choose("Health Potion", "Iron Key", "Moonstone", "Travel Rations"),
				quantity: irandom_range(1, 5),
			});
		break;

		case 2:
			player_inventory_logger.warning("Inventory is nearly full", {
				used_slots: irandom_range(18, 19),
				total_slots: 20,
			});
		break;

		case 3:
			player_inventory_logger.error("Could not equip item", {
				item: choose("Bronze Sword", "Hunter Bow", "Mage Robe"),
				reason: choose("level requirement not met", "slot is locked", "inventory is full"),
			});
		break;

		case 4:
			player_inventory_logger.fatal("Inventory data could not be loaded", {
				save_slot: irandom_range(1, 3),
				reason: "inventory payload is corrupt",
			});
		break;
	}
};

get_player_stats_log = function() {
	switch (irandom(4)) {
		case 0:
			player_stats_logger.debug("Recalculating player stats", {
				active_modifiers: irandom_range(0, 6),
			});
		break;

		case 1:
			player_stats_logger.info("Player level increased", {
				level: irandom_range(2, 30),
				unspent_points: irandom_range(1, 3),
			});
		break;

		case 2:
			player_stats_logger.warning("Stat is outside the expected range", {
				stat: choose("movement_speed", "attack_speed", "critical_chance"),
				value: irandom_range(125, 200),
			});
		break;

		case 3:
			player_stats_logger.error("Stat modifier could not be applied", {
				modifier: choose("poison", "haste", "armor_boost"),
				reason: "modifier definition is missing",
			});
		break;

		case 4:
			player_stats_logger.fatal("Player stats are invalid", {
				stat: choose("health", "strength", "defense"),
				value: -irandom_range(1, 100),
			});
		break;
	}
};

get_world_log = function() {
	switch (irandom(4)) {
		case 0:
			world_logger.debug("World chunk loaded", {
				chunk_x: irandom_range(-8, 8),
				chunk_y: irandom_range(-8, 8),
				load_time_ms: irandom_range(4, 28),
			});
		break;

		case 1:
			world_logger.info("Weather changed", {
				weather: choose("clear", "rain", "fog", "thunderstorm"),
				duration_seconds: irandom_range(30, 240),
			});
		break;

		case 2:
			world_logger.warning("World streaming is falling behind", {
				queued_chunks: irandom_range(3, 9),
				frame_time_ms: irandom_range(24, 48),
			});
		break;

		case 3:
			world_logger.error("Room transition failed", {
				from: choose("Village", "Forest", "Ruins"),
				to: choose("Forest", "Ruins", "Cavern"),
				reason: "destination room is unavailable",
			});
		break;

		case 4:
			world_logger.fatal("World state could not be restored", {
				save_slot: irandom_range(1, 3),
				reason: "incompatible data",
			});
		break;
	}
};
