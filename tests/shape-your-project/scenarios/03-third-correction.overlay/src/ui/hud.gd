extends CanvasLayer

signal update_oil(value: float)

func set_oil(value: float) -> void:
	$OilBar.value = value
	update_oil.emit(value)
