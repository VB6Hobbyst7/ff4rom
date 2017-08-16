'Returns a list of indexes of the items that the given job can equip.
' The list is stored as chr bytes (use asc to decode).

function FF4Rom.ItemsUsableByJob(job_index as UByte) as List

 dim result as List
 
 for i as Integer = 0 to total_items
  if weapons_range.InRange(i) or armors_range.InRange(i) then
   if equipcharts(items(i).equip_code).flags(job_index) then
    result.AddItem(chr(i))
   end if
  end if
 next
 
 return result

end function
