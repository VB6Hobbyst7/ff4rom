sub FF4Rom.ReadActors()

 dim start as Integer
 dim temp as UByte
 dim next_char as Integer
 dim level_ptr(total_characters) as Integer

 for i as Integer = 0 to total_actors
  
  actors(i)->name_index = ByteAt(&h8657 + i)

  temp = ByteAt(&h689A + i)
  actors(i)->load_initial = bit(temp, 7)
  actors(i)->load_slot = temp mod &h80
  
  temp = ByteAt(&h691D + i)
  actors(i)->store_shadow = not bit(temp, 7)
  if actors(i)->store_shadow then actors(i)->store_slot = temp
  
  for j as Integer = 1 to 5
   actors(i)->menu_command(j) = menu_commands(ByteAt(&h9FF55 + i * 5 + j - 1))
  next
  
  start = &h7AD00 + i * 7
  
  actors(i)->starting_gear(1) = items(ByteAt(start + 3))
  actors(i)->starting_gear(2) = items(ByteAt(start + 5))
  for j as Integer = 1 to 3
   actors(i)->starting_gear(j + 2) = items(ByteAt(start + j - 1))
  next
  actors(i)->right_ammo = ByteAt(start + 4)
  actors(i)->left_ammo = ByteAt(start + 6)

 next

 for i as Integer = 0 to total_names
  names(i) = ""
  for j as Integer = 0 to 5
   names(i) += chr(ByteAt(&h7A910 + i * 6 + j))
  next
 next

 for i as Integer = 0 to 4
  blackreplace_text += chr(ByteAt(&hB405 + i))
 next
 blackreplace_actor = actors(ByteAt(&hB1B3))
 jobchange_actor = actors(ByteAt(&h67B8) - 1)
 jobchange_job = jobs(ByteAt(&h67BC))
 
 start = &h7B700
 next_char = 0
 for i as Integer = 0 to total_actors
  temp = ByteAt(start + i * 2)
  temp += ByteAt(start + i * 2 + 1) * &h100
  for j as Integer = 0 to i
   if level_ptr(j) = temp then
    actors(i)->character_link = characters(j)
   end if
  next
  if actors(i)->character_link = 0 then
   level_ptr(next_char) = temp
   actors(i)->character_link = characters(next_char)
   next_char += 1
  end if
 next
 
end sub


sub FF4Rom.WriteActors()

 dim start as Integer
 dim temp as UByte

 for i as Integer = 0 to total_actors

  WriteByte(&h8657 + i, actors(i)->name_index)
  WriteByte(&hB7D3F + i, actors(i)->name_index)
  
  temp = actors(i)->load_slot
  if not actors(i)->load_initial then temp = bitset(temp, 7)
  WriteByte(&h0689A + i, temp)
  
  if actors(i)->store_shadow then
   temp = actors(i)->store_slot
  else
   temp = &h80
  end if
  WriteByte(&h0691D + i, temp)
  
  for j as Integer = 1 to 5
   WriteByte(&h9FF55 + i * 5 + j - 1, IndexOfMenuCommand(actors(i)->menu_command(j)))
  next
  
  start = &h7AD00 + i * 7
  WriteByte(start + 3, IndexOfItem(actors(i)->starting_gear(1)))
  WriteByte(start + 5, IndexOfItem(actors(i)->starting_gear(2)))
  for j as Integer = 1 to 3
   WriteByte(start + j - 1, IndexOfItem(actors(i)->starting_gear(j + 2)))
  next
  WriteByte(start + 4, actors(i)->right_ammo)
  WriteByte(start + 6, actors(i)->left_ammo)

 next

 for i as Integer = 0 to total_names
  for j as Integer = 0 to 5
   if len(names(i)) < j + 1 then names(i) += chr(&hFF)
   WriteByte(&h7A910 + i * 6 + j, asc(mid(names(i), j + 1, 1)))
  next
 next

 for i as Integer = 0 to 4
  WriteByte(&hB405 + i, asc(mid(blackreplace_text, i + 1, 1)))
 next
 WriteByte(&hB1B3, IndexOfActor(blackreplace_actor))
 WriteByte(&h67B8, IndexOfActor(jobchange_actor) + 1)
 WriteByte(&h67BC, IndexOfJob(jobchange_job))

end sub

