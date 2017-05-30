'This removes the item the specified actor has equipped (if any) in the
' specified slot from the specified actor. If no slot is specified, it removes
' all starting equipment.

sub FF4Rom.Unequip(actor_index as UByte, slot_index as Integer = -1)

 if slot_index < right_hand_slot or slot_index > arms_slot then
  actors(actor_index).right_ammo = 0
  actors(actor_index).left_ammo = 0
  for i as Integer = 1 to 5
   actors(actor_index).starting_gear(i) = 0
  next
 else
  actors(actor_index).starting_gear(slot_index) = 0
  if slot_index = right_hand_slot then actors(actor_index).right_ammo = 0
  if slot_index = left_hand_slot then actors(actor_index).left_ammo = 0
 end if

end sub
