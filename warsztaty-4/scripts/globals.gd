extends Node

enum CharacterType {
	Player,
	Enemy,
	NPC,
	Other
}

var player: PlayerBody2D
var ground_tile_map: TileMapLayer

func get_speed_modifier(pos: Vector2, tile_map: TileMapLayer) -> float:
	var local_pos := tile_map.to_local(pos)
	var coords := tile_map.local_to_map(local_pos)
	var data := tile_map.get_cell_tile_data(coords)
	
	if data and data.has_custom_data("SpeedMult"):
		return data.get_custom_data("SpeedMult")
	else:
		return 1.0
