type Map
 triggers as TriggerList
 messages as List
 battle_background as UByte
 warpable as Boolean
 exitable as Boolean
 alternate_battle_background as UByte
 magnetic as Boolean
 tile_layout as Layout ptr
 tile_set as TileSet ptr
 placement_set as PlacementSet ptr
 border_tile as Tile ptr
 solid_border as Boolean
 map_palette as UByte
 npc_palette1 as UByte
 npc_palette2 as UByte
 music as UByte
 background as Layout ptr
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
 encounter_set as Encounter ptr
 declare function TileAt(x as UByte, y as UByte) as Tile ptr
end type

const total_maps = 383

function Map.TileAt(x as UByte, y as UByte) as Tile ptr
 return tile_set->tiles[tile_layout->tiles.ValueAt(y * 32 + x)]
end function
