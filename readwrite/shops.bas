sub FF4Rom.ReadShops()

 dim temp as UByte
 
 for i as Integer = 0 to total_shops
  for j as Integer = 1 to 8
   temp = ByteAt(&h9A500 + i * 8 + j - 1)
   if temp <> &hFF then shops(i)->wares.AddPointer(items(temp))
  next
 next

end sub


sub FF4Rom.WriteShops()

 dim temp as UByte
 
 for i as Integer = 0 to total_shops
  for j as Integer = 1 to 8
   temp = iif(shops(i)->wares.Length() > j, &hFF, IndexOfItem(shops(i)->wares.PointerAt(j)))
   WriteByte(&h9A500 + i * 8 + j - 1, temp)
  next
 next

end sub
