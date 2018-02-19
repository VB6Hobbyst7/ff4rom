type Map
 triggers as List
 messages as List
 battle_background as UByte
 warpable as Boolean
 exitable as Boolean
 alternate_battle_background as UByte
 magnetic as Boolean
 grid as TileGrid ptr
 tile_set as TileSet ptr
 placement_set as PlacementSet ptr
 border_tile as Tile ptr
 solid_border as Boolean
 map_palette as UByte
 npc_palette1 as UByte
 npc_palette2 as UByte
 music as UByte
 background as TileGrid ptr
 translucent as Boolean
 scroll_vertical as Boolean
 scroll_horizontal as Boolean
 mystery_bit as Boolean
 move_direction as UByte
 move_speed as UByte
 ending as Boolean
 name_index as UByte
 encounter_rate as UByte
 treasure_index as UByte
end type

const total_maps = 383
