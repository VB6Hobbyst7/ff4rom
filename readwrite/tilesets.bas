sub FF4Rom.ReadTileSets()
 dim start as Long
 dim p as TileSet ptr
 dim t as Tile ptr
 for index as Integer = 0 to total_tile_sets
  p = tile_sets[index]
  start = &hA1000 + index * &h100
  for i as Integer = 0 to tiles_per_set
   t = p->tiles[i]
   t->layer1 = bit(ByteAt(start + i * 2), 0)
   t->layer2 = bit(ByteAt(start + i * 2), 1)
   t->bridge = bit(ByteAt(start + i * 2), 2)
   t->save_point = bit(ByteAt(start + i * 2), 3)
   t->closed_door = bit(ByteAt(start + i * 2), 4)
   t->mystery_bit_1 = bit(ByteAt(start + i * 2), 5)
   t->mystery_bit_2 = bit(ByteAt(start + i * 2), 6)
   t->mystery_bit_3 = bit(ByteAt(start + i * 2), 7)
   t->damage = bit(ByteAt(start + i * 2 + 1), 0)
   t->mystery_bit_4 = bit(ByteAt(start + i * 2 + 1), 1)
   t->walk_behind = bit(ByteAt(start + i * 2 + 1), 2)
   t->bottom_half = bit(ByteAt(start + i * 2 + 1), 3)
   t->warp = bit(ByteAt(start + i * 2 + 1), 4)
   t->talkover = bit(ByteAt(start + i * 2 + 1), 5)
   t->encounters = bit(ByteAt(start + i * 2 + 1), 6)
   t->triggerable = bit(ByteAt(start + i * 2 + 1), 7)
  next
 next
end sub
