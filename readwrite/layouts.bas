sub FF4Rom.ReadLayouts()
 dim start as Long
 dim finish as Long
 dim p as Layout ptr
 dim runlength as Integer
 dim tile_index as UByte
 for index as Integer = 0 to total_layouts
  p = layouts[index]
  start = ByteAt(&hB8200 + index * 2) + ByteAt(&hB8200 + index * 2 + 1) * &h100 + iif(index < &h100, &hB8200, &hC0200)
  finish = ByteAt(&hB8200 + index * 2 + 2) + ByteAt(&hB8200 + index * 2 + 3) * &h100 + iif(index < &h100, &hB8200, &hC0200)
  do while start < finish and p->tiles.Size() < &h400
   tile_index = ByteAt(start) mod &h80
   runlength = 1
   if bit(ByteAt(start), 7) then
    start += 1
    runlength += ByteAt(start)
   end if
   for i as Integer = 1 to runlength
    if p->tiles.Size() < &h400 then p->tiles.AddValue(tile_index)
   next
   start += 1
  loop
 next
end sub
