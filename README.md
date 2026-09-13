<h1 align="center">SnowLogger 0.1.0</h1>

<p align="center">Rich, structured logging for GameMaker</p>

&nbsp;

**SnowLogger** is an IDE plugin for [GameMaker LTS](https://releases.gamemaker.io/release-notes/2026/0). It brings rich, structured logging directly into the GameMaker IDE.

You can download the plugin and `.yymps` package from the [Releases](https://github.com/sohomsahaun/SnowLogger/releases) page.

This repository contains the SnowLogger client and demo project.

## Features

- Rich, structured logging
- Case-sensitive, whole-word, and regular-expression search
- Filtering by severity level
- Follow and pause controls for live logs
- Copy individual logs as JSON

## Quick example

<p align="center">
  <img alt="SnowLogger demo" src="https://github.com/user-attachments/assets/b6d36add-ca22-4c4d-a6c4-ceea24d4c280">
</p>

```gml
player_logger = LOGGER.create_named("Player");
player_stats_logger = player_logger.create_named("Stats");

player_stats_logger.info("Player level increased", {
    level: 11,
    unspent_points: 2,
});
```

## Documentation

To learn more about SnowLogger, visit the [documentation](#).
