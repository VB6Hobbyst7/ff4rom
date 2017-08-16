function FF4Rom.ItemsUsableByActor(actor_index as UByte) as List

 dim result as List
 
 for i as Integer = 0 to total_items
  if CanEquip(actor_index, i) then result.AddItem(chr(i))
 next
 
 return result

end function
