'This takes a list of elements and status names and tries to find an entry in
' the ElementGrid table that corresponds to that combination. If it finds such
' an entry, it returns its index. If it doesn't, it tries to create it. If it
' succeeds in creating a new entry, it returns the index of that entry. If it
' fails, it returns 0.

function FF4Rom.FindOrCreateElementStatusTable(combination as List) as Integer

 'dim candidate as ElementGrid
 dim result as Integer = total_element_grids + 1
 dim found as Boolean
 dim next_unused as Integer

 'for i as Integer = 1 to combination.Length()
  'candidate.flags(FlagIndex(combination.ItemAt(i))) = true
 'next

 'for i as Integer = 1 to next_unused - 1
  'found = true
  'for j as Integer = 1 to 24
   'if candidate.flags(j) <> elementgrids(i)->flags(j) then
    'found = false
    'exit for
   'end if
  'next
  'if found then
   'result = i
   'exit for
  'end if
 'next

 'if not found then
  'next_unused = NextUnusedElementGrid()
  'if next_unused <= total_element_grids then
   'for i as Integer = 1 to 24
    'elementgrids(next_unused).flags(i) = candidate.flags(i)
   'next
   'result = next_unused
  'end if
 'end if
 
 return result
 
end function
