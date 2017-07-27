'This is one floor of an "inner" map, i.e., a town, dungeon, castle, or really
' any location that's not an overworld (such as the Upper World, Underground,
' or Moon).

' The tile data (the layout) of the map is simply stored as an index to an
'  entry in the list of map grids. The map grids contain the layouts, but you
'  may have different maps that refer to the same tile layouts (some shops or
'  airships for example, or certain "ending" versions of some maps).

' Similarly, the layout of NPCs for a given map is stored as an index of an
'  entry in a list of NPC layouts/arrangements.

' In addition, each map is associated with a list of messages. These come from
'  Message Bank 2 and can be referenced in NPC speech data and/or other events
'  launched from that map (that way the same event can be launched by several
'  different maps to result in different dialogue being displayed; this is
'  how NPC speech generally works).

' Each map also has associated with it a list of triggers that can be activated
'  from that map (teleports, treasures, and events).
'  **IMPORTANT NOTE: There is a value called the "treasure index" that is
'  associated with each map that tracks how many treasures in a given world
'  (upper world or underground/moon) have been assigned to maps up to this
'  point. I'm not sure the details of how exactly it works in-game, but I do
'  know that if it is not tracked correctly, it will give you some strange
'  behaviours such as getting treasure from doors and the like. The built-in
'  functions will ensure it is handled correctly, but if you decide to change
'  it manually, just make sure you know what you're doing.


type Map

 triggers as List
 messages as List
 battle_background as UByte
 warpable as Boolean
 exitable as Boolean
 mystery_bit as Boolean
 magnetic as Boolean
 grid_index as UByte 'This references which layout of tiles the map uses
 tileset_index as UByte
 npc_placement_index as UByte
 border_tile as UByte 'What tile the "outside" of the map is filled with
 solid_border as Boolean
 map_palette as UByte
 npc_palette_12 as UByte 'NPC palettes 1 and 2
 npc_palette_34 as UByte 'NPC palettes 3 and 4
 music as UByte
 background as UByte 'What map grid index appears behind the tranparent areas
 bg_translucent as Boolean
 bg_scroll_vertical as Boolean
 bg_scroll_horizontal as Boolean
 mystery_bit2 as Boolean
 bg_move_direction as UByte 'Whether the background map moves on its own, such
 bg_move_speed as UByte     ' as the water background used in town maps.
 underground as Boolean 'I don't think this actually means an underground map
 name_index as UByte 'This references a table of map names (B1, F2, Inn, etc)
 encounter_rate as UByte
 treasure_index as UByte 'THIS IS IMPORTANT. See note in preamble.

end type

const total_maps = 383

const overworld_map = 251
const underground_map = 252
const moon_map = 253
