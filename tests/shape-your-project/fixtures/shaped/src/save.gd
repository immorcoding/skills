extends Node

const SAVE_VERSION := 1

func load_save(data: Dictionary) -> Dictionary:
	if data.get("version", 0) < SAVE_VERSION:
		data = _migrate(data)
	return data

func _migrate(data: Dictionary) -> Dictionary:
	data["version"] = SAVE_VERSION
	return data
