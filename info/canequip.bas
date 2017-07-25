function FF4Rom.CanEquip(actor_index as UByte, item_index as UByte) as Boolean

 dim result as Boolean
 dim job_index as UByte

 if item_index <> 0 and item_index <> no_armor_item then

  result = false
  job_index = JobOfActor(actor_index)
  
  if weapons_range.InRange(item_index) or armors_range.InRange(item_index) then
   if equipcharts(items(item_index).equip_code).flags(job_index) then
    result = true
   end if
  end if

 end if
 
 return result
 
end function
