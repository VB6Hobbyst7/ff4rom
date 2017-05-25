'This gives the specified actor the specified item in its starting equipment.
' It will do its best to figure out what slot to put it in.

' If the item isn't an equipment or the actor doesn't have the corresponding
'  equip skill, it will fail to add the item.

' If it is a weapon or shield, it will put it in the corresponding hand based
'  on the actor's handedness.

' If the actor is ambidextrous and the item is a weapon, it will check if the
'  actor has an item in each hand. If it has only one empty hand, the weapon
'  will go in the empty hand; otherwise, if both hands are full or both hands
'  are empty, it will put it in the right hand. You can specify a hand as an
'  optional second parameter to force the item into that hand (but you still
'  need the skill).

' The point of this routine is to make sure to only equip things the game
'  would normally allow; if you wish to do something strange like put a
'  rat's tail on someone's head, you can set the variables directly instead.

sub GiveActorItem(actor_index as UByte, item_index as UByte, right as Boolean = true)

 if weapons_range.InRange(item_index) then
  'It's a weapon
 elseif armors_range.InRange(item_index) then
  if head_range.InRange(item_index) then
   'Put it on the head
  elseif body_range.InRange(item_index) then
   'Put it on the body
  elseif arms_range.InRange(item_index) then
   'Put it on the arms
  else
   'It must be a shield
  end if
 end if

end sub