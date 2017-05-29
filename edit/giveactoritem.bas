'This gives the specified actor the specified item in its starting equipment.
' It will do its best to figure out what slot to put it in.

' If the item isn't an equipment or the actor doesn't have the corresponding
'  equip skill, it will fail to add the item.

' If it is a weapon or shield, it will put it in the corresponding hand based
'  on the actor's handedness.

' If the item is an arrow, it will default to giving 50; if you wish to give
'  it a different amount of ammo, you can specify it as a parameter.

' If the actor is ambidextrous and the item is a weapon, it will check if the
'  actor has an item in each hand. If it has only one empty hand, the weapon
'  will go in the empty hand; otherwise, if both hands are full or both hands
'  are empty, it will put it in the right hand. You can specify a hand as an
'  optional second parameter to force the item into that hand (but you still
'  need the skill).

' The point of this routine is to make sure to only equip things the game
'  would normally allow; if you wish to do something strange like put a
'  rat's tail on someone's head, you can set the variables directly instead.

sub FF4Rom.GiveActorItem(actor_index as UByte, item_index as UByte, arrow_ammo as UByte = 50, force_right as Boolean = false)

 dim character_index as UByte
 dim ambi as Boolean
 dim use_right as Boolean
 
 character_index = actors(actor_index).level_link
 if characters(character_index).right_handed and characters(character_index).left_handed then ambi = true
  
 if CanEquip(actor_index, item_index) then
  if weapons_range.InRange(item_index) then
   'It's a weapon; figure out which hand to use
   if ambi then
    if force_right then
     use_right = true
    else
     if actors(actor_index).starting_gear(right_hand_slot) > 0 and actors(actor_index).starting_gear(left_hand_slot) = 0 then
      use_right = false
     elseif actors(actor_index).starting_gear(right_hand_slot) = 0 and actors(actor_index).starting_gear(left_hand_slot) > 0 then
      use_right = true
     end if
    end if
   else
    if characters(character_index).right_handed then
     use_right = true
    else
     use_right = false
    end if
   end if
   if use_right then
    actors(actor_index).starting_gear(right_hand_slot) = item_index
    actors(actor_index).right_ammo = iif(arrow_range.InRange(item_index), arrow_ammo, 1)
   else
    actors(actor_index).starting_gear(left_hand_slot) = item_index
    actors(actor_index).left_ammo = iif(arrow_range.InRange(item_index), arrow_ammo, 1)
   end if
  elseif armors_range.InRange(item_index) then
   'It's an armor; figure out which slot
   if head_range.InRange(item_index) then
    'Put it on the head
    actors(actor_index).starting_gear(head_slot) = item_index
   elseif body_range.InRange(item_index) then
    'Put it on the body
    actors(actor_index).starting_gear(body_slot) = item_index
   elseif arms_range.InRange(item_index) then
    'Put it on the arms
    actors(actor_index).starting_gear(arms_slot) = item_index
   else
    'It must be a shield
    if not ambi then
     'Ambidextrous people can't use shields
     if characters(character_index).right_handed then
      actors(actor_index).starting_gear(left_hand_slot) = item_index
      actors(actor_index).left_ammo = 1
     else
      actors(actor_index).starting_gear(right_hand_slot) = item_index
      actors(actor_index).right_ammo = 1
     end if
    end if
   end if
  end if
 end if

end sub
