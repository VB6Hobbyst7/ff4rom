function FF4Rom.CanEquip(actor_index as UByte, item_index as UByte) as Boolean

 dim result as Boolean
 dim job_index as UByte
 
 result = false
 job_index = actors(actor_index).level_link
 if actor_index = jobchange_actor then job_index = jobchange_job
 
 if weapons_range.InRange(item_index) or armors_range.InRange(item_index) then
  if equipcharts(items(item_index).equip_code).flags(job_index) then
   result = true
  end if
 end if
 
 return result

end function
