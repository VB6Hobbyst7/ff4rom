sub FF4Rom.ReadPlacementSets()
 dim start as Long
 dim p as PlacementSet ptr
 dim e as Placement ptr
 for index as Integer = 0 to total_placement_sets
  p = placement_sets[index]
  start = ByteAt(&h98200 + index * 2) + ByteAt(&h98200 + index * 2 + 1) * &h100 + &h98500
  for i as Integer = 0 to 11
   if ByteAt(start) = 0 then
    exit for
   else
    e = new Placement
    p->placements.AddPointer(e)
    e->npc_link = npcs[ByteAt(start)] 
    e->x = ByteAt(start + 1) mod 2^5
    e->mystery_bit1 = bit(ByteAt(start + 1), 5)
    e->mystery_bit2 = bit(ByteAt(start + 1), 6)
    e->walks = bit(ByteAt(start + 1), 7)
    e->y = ByteAt(start + 2) mod 2^5
    e->mystery_bit3 = bit(ByteAt(start + 2), 5)
    e->mystery_bit4 = bit(ByteAt(start + 2), 6)
    e->intangible = bit(ByteAt(start + 2), 7)
    e->facing = ByteAt(start + 3) mod 4
    e->palette_index = (ByteAt(start + 3) \ 4) mod 4
    e->turns = bit(ByteAt(start + 3), 4)
    e->marches = bit(ByteAt(start + 3), 5)
    e->speed = ByteAt(start + 3) \ 2^6
    start += 4
   end if
  next
 next
end sub
