sub FF4Rom.ReadShops()
 dim p as Shop ptr
 for index as Integer = 0 to total_shops
  p = shops[index]
  for i as Integer = 0 to 7
   p->wares.AddPointer(items[ByteAt(&h9A500 + index * 8 + i)])
  next
 next
end sub
