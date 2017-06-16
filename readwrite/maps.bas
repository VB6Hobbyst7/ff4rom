sub FF4Rom.ReadTrigger(t as Trigger ptr, address as Integer)

 dim temp as UByte
 
 t->x = ByteAt(address)
 t->y = ByteAt(address + 1)
 temp = ByteAt(address + 2)
 select case temp
  case &hFF
   t->event_call = ByteAt(address + 3)
  case &hFE
   t->treasure = true
   t->formation = ByteAt(address + 3) mod 2^6
   t->trapped = iif(ByteAt(address + 3) and 2^6, true, false)
   t->gil = iif(ByteAt(address + 3) and 2^7, false, true)
   t->contents = ByteAt(address + 4)
  case else
   t->teleport = true
   t->destination_map = temp
   t->destination_x = ByteAt(address + 3) mod 2^6
   t->facing = ByteAt(address + 3) \ 2^6
   t->destination_y = ByteAt(address + 4)
 end select

end sub


sub FF4Rom.WriteTrigger(t as Trigger ptr, address as Integer)

 dim temp as UByte

 WriteByte(address, t->x)
 WriteByte(address + 1, t->y)
 if t->teleport then
  WriteByte(address + 2, t->destination_map)
  temp = t->destination_x + t->facing * 2^6
  WriteByte(address + 3, temp)
  WriteByte(address + 4, t->new_y)
 elseif t->treasure then
  WriteByte(address + 2, &hFE)
  temp = t->formation
  if t->trapped then temp += 2^6
  if not t->gil then temp += 2^7
  WriteByte(address + 3, temp)
  WriteByte(address + 4, t->contents)
 else
  WriteByte(address + 2, &hFF)
  WriteByte(address + 3, t->event_call)
  WriteByte(address + 4, 0)
 end if

end sub


sub FF4Rom.ReadMaps()

 dim start as Integer
 dim temp as UByte
 'dim next_pointer as Integer
 dim t as Trigger ptr
 dim address as UInteger
 dim finish as UInteger
 dim total_overworld_triggers as UInteger
 dim total_underground_triggers as UInteger
 dim total_moon_triggers as UInteger
 

 for i as Integer = 0 to total_maps 
 
  maps(i).encounter_rate = ByteAt(&h74542 + i)

  start = &hA9E84 + i * 13
  temp = ByteAt(start)
  maps(i).battle_background = temp mod &h10
  maps(i).warpable = iif(temp and &h10, true, false)
  maps(i).exitable = iif(temp and &h20, true, false)
  maps(i).mystery_bit = iif(temp and &h40, true, false)
  maps(i).magnetic = iif(temp and &h80, true, false)
  maps(i).grid_index = ByteAt(start + 1)
  maps(i).tileset_index = ByteAt(start + 2)
  maps(i).npc_placement_index = ByteAt(start + 3)
  maps(i).border_tile = ByteAt(start + 4) mod &h80
  maps(i).map_palette = ByteAt(start + 5)
  temp = ByteAt(start + 6)
  maps(i).npc_palette_12 = temp mod &h10
  maps(i).npc_palette_34 = temp \ &h10
  maps(i).music = ByteAt(start + 7)
  maps(i).background = ByteAt(start + 8)
  temp = ByteAt(start + 9)
  maps(i).bg_translucent = iif(temp and 1, true, false)
  maps(i).bg_scroll_vertical = iif(temp and 2, true, false)
  maps(i).bg_scroll_horizontal = iif(temp and 4, true, false)
  maps(i).mystery_bit2 = iif(temp and 8, true, false)
  maps(i).bg_move_direction = (temp \ &h10) mod 4
  maps(i).bg_move_speed = temp \ &h40
  maps(i).underground = iif(ByteAt(start + 10) and &h80, true, false)
  maps(i).name_index = ByteAt(start + 11)
  maps(i).treasure_index = ByteAt(start + 12)
  
 next

 start = &hA8200
 'total_triggers = 0
 
 for i as Integer = 0 to total_maps
  address = &hA8500 + ByteAt(start + i * 2) + ByteAt(start + i * 2 + 1) * &h100
  finish = &hA8500 + ByteAt(start + i * 2) + ByteAt(start + i * 2 + 1) * &h100
  if finish > address then
   for j as Integer = 0 to finish - address - 5 step 5
    t = callocate(SizeOf(Trigger))
    ReadTrigger(t, address + j)
    maps(i).triggers.Append(t)
    'total_triggers += 1
   next
  end if
 next
 
 total_overworld_triggers = (ByteAt(&hD0062) + ByteAt(&hD0063) * &h100) \ 5
 total_underground_triggers = ((ByteAt(&hD0064) + ByteAt(&hD0065) * &h100) - (ByteAt(&hD0062) + ByteAt(&hD0063) * &h100)) \ 5
 total_moon_triggers = (&h19A - (ByteAt(&hD0064) + ByteAt(&hD0065) * &h100)) \ 5
 
 start = &hD0066
 
 for i as Integer = 1 to total_overworld_triggers
  t = callocate(SizeOf(Trigger))
  ReadTrigger(t, start + i * 5)
  maps(overworld_map).triggers.Append(t)
 next
 start += total_overworld_triggers * 5
 
 for i as Integer = 1 to total_underground_triggers
  t = callocate(SizeOf(Trigger))
  ReadTrigger(t, start + i * 5)
  maps(underground_map).triggers.Append(t)
 next
 start += total_underground_triggers * 5
 
 for i as Integer = 1 to total_moon_triggers
  if ByteAt(start + (i - 1) * 5) = 0 and ByteAt(start + (i - 1) * 5 + 1) = 0 and ByteAt(start + (i - 1) * 5 + 2) = 0 and ByteAt(start + (i - 1) * 5 + 3) = 0 and ByteAt(start + (i - 1) * 5 + 4) = 0 then
   exit for
  else
   t = callocate(SizeOf(Trigger))
   ReadTrigger(t, start + i * 5)
   maps(moon_map).triggers.Append(t)
  end if
 next

end sub


sub FF4Rom.WriteMaps()

 dim start as UInteger
 dim temp as UByte
 dim next_pointer as UInteger

 for i as Integer = 0 to total_maps 
 
  WriteByte(&h74542 + i, maps(i).encounter_rate)

  start = &hA9E84 + i * 13
  temp = maps(i).battle_background
  if maps(i).warpable then temp += &h10
  if maps(i).exitable then temp += &h20
  if maps(i).mystery_bit then temp += &h40
  if maps(i).magnetic then temp += &h80
  WriteByte(start, temp)
  WriteByte(start + 1, maps(i).grid_index)
  WriteByte(start + 2, maps(i).tileset_index)
  WriteByte(start + 3, maps(i).npc_placement_index)
  WriteByte(start + 4, maps(i).border_tile)
  WriteByte(start + 5, maps(i).map_palette)
  temp = maps(i).npc_palette_12 + maps(i).npc_palette_34 * &h10
  WriteByte(start + 6, temp)
  WriteByte(start + 7, maps(i).music)
  WriteByte(start + 8, maps(i).background)
  temp = iif(maps(i).bg_translucent, 1, 0)
  if maps(i).bg_scroll_vertical then temp += 2
  if maps(i).bg_scroll_horizontal then temp += 4
  if maps(i).mystery_bit2 then temp += 8
  temp += maps(i).bg_move_direction * &h10
  temp += maps(i).bg_move_speed * &h40
  WriteByte(start + 9, temp)
  temp = ByteAt(start + 10) mod &h80
  if maps(i).underground then temp += &h80
  WriteByte(start + 10, temp)
  WriteByte(start + 11, maps(i).name_index)
  WriteByte(start + 12, maps(i).treasure_index)
  
 next
 
 

end sub
