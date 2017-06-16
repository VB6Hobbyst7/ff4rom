sub FF4Rom.ReadShops()

 for i as Integer = 0 to total_shops
  for j as Integer = 1 to 8
   shops(i).wares(j) = ByteAt(&h9A500 + i * 8 + j - 1)
  next
 next

end sub


sub FF4Rom.WriteShops()

 for i as Integer = 0 to total_shops
  for j as Integer = 1 to 8
   WriteByte(&h9A500 + i * 8 + j - 1, shops(i).wares(j))
  next
 next

end sub
