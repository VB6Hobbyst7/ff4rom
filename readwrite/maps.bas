sub FF4Rom.ReadMaps()
 dim start as Long
 dim p as Map ptr
 dim temp as String ptr
 start = &hA9820
 for i as Integer = 0 to total_map_names
  temp = new String
  do until ByteAt(start) = 0
   *temp += chr(ByteAt(start))
   start += 1
  loop
  map_names.AddPointer(temp)
  start += 1
 next
 for index as Integer = 0 to total_maps
  p = maps[index]
  start = &hA9E84 + index * 13
  p->battle_background = ByteAt(start) mod &h10
  p->warpable = bit(ByteAt(start), 4)
  p->exitable = bit(ByteAt(start), 5)
  p->alternate_battle_background = bit(ByteAt(start), 6)
  p->magnetic = bit(ByteAt(start), 7)
  p->tile_layout = layouts[ByteAt(start + 1)]
  p->tile_set = tile_sets[ByteAt(start + 2)]
  p->placement_set = placement_sets[ByteAt(start + 3)]
  p->border_tile = p->tile_set->tiles[ByteAt(start + 4) mod &h80]
  p->solid_border = bit(ByteAt(start + 4), 7)
  p->map_palette = ByteAt(start + 5)
  p->npc_palette1 = ByteAt(start + 6) mod &h10
  p->npc_palette2 = ByteAt(start + 6) \ &h10
  p->music = ByteAt(start + 7)
  p->background = layouts[ByteAt(start + 8)]
  p->translucent = bit(ByteAt(start + 9), 0)
  p->scroll_vertical = bit(ByteAt(start + 9), 1)
  p->scroll_horizontal = bit(ByteAt(start + 9), 2)
  p->mystery_bit = bit(ByteAt(start + 9), 3)
  p->move_direction = (ByteAt(start + 9) \ &h10) mod 4
  p->move_speed = ByteAt(start + 9) \ &h40
  p->ending = bit(ByteAt(start + 10), 7)
  p->name = iif(ByteAt(start + 11) < map_names.Size(), map_names.PointerAt(ByteAt(start + 11) + 1), 0)
  p->treasure_index = ByteAt(start + 12)
  p->encounter_rate = ByteAt(&h74542 + index)
 next
end sub
