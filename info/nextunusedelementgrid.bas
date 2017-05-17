'This returns the index of the first unused table entry in the ElementGrid
' table.

function FF4Rom.NextUnusedElementGrid() as Integer

 dim result as Integer

 for i as Integer = 1 to total_element_grids
  for j as Integer = 1 to 24
   if elementgrids(i).flags(j) then
    result = i + 1
    exit for
   end if
  next
 next

 return result
 
end function

