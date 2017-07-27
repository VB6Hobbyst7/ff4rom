function FF4Rom.ActorHandedness(actor_index as UByte) as String

 dim result as String
 
 if characters(actors(actor_index).level_link).right_handed and characters(actors(actor_index).level_link).left_handed then
  result = "Both"
 elseif characters(actors(actor_index).level_link).right_handed then
  result = "Right"
 elseif characters(actors(actor_index).level_link).left_handed then
  result = "Left"
 else
  result = "D"
 end if
 
 return result

end function
