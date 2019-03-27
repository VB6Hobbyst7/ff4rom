sub FF4Rom.ReadActors()
 dim start as Long
 dim p as Actor ptr
 dim temp as String ptr
 dim level_list as List
 dim current_ptr as Long
 for i as Integer = 0 to total_actor_names
  temp = new String
  for j as Integer = 0 to 5
   *temp += chr(ByteAt(&h7A910 + i * 6 + j))
  next
  actor_names.AddPointer(temp)
 next
 for index as Integer = 0 to total_actors - 1
  p = actors[index + 1]
  p->name = actor_names.PointerAt(ByteAt(&h8657 + index) + 1)
  p->load_initial = not bit(ByteAt(&h689A + index), 7)
  p->load_slot = ByteAt(&h689A + index) mod &h80
  p->store_shadow = not bit(ByteAt(&h691D + index), 7)
  p->store_slot = ByteAt(&h691D) mod &h80
  for i as Integer = 0 to 4
   p->menu_command(i) = menu_commands[ByteAt(&h9FF55 + index * 5 + i)]
  next
  start = &h7AD00 + index * 7
  p->starting_gear(EquipSlots.right_hand) = items[ByteAt(start + 3)]
  p->starting_gear(EquipSlots.left_hand) = items[ByteAt(start + 5)]
  for i as Integer = 0 to 2
   p->starting_gear(i + 2) = items[ByteAt(start + i)]
  next
  p->right_ammo = ByteAt(start + 4)
  p->left_ammo = ByteAt(start + 6)
 next
 for i as Integer = 0 to 4
  black_replace_text += chr(ByteAt(&hB405 + i))
 next
 black_replace_actor = actors[ByteAt(&hB1B3)]
 job_change_actor = actors[ByteAt(&h67B8)]
 job_change_job = jobs[ByteAt(&h67BC)]
 start = &h7B700
 for i as Integer = 0 to total_actors - 1
  p = actors[i + 1]
  current_ptr = ByteAt(start + i * 2) + ByteAt(start + i * 2 + 1) * &h100
  if level_list.ContainsValue(current_ptr) then
   p->character_link = characters[level_list.IndexOfValue(current_ptr) - 1]
  else
   p->character_link = characters[level_list.Size()]
   level_list.AddValue(current_ptr)
  end if
 next
end sub
