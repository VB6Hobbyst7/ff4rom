'This completely wipes out all the wares of the specified shop. If no shop
' index was given, it clears out all the wares of all shops. Leaving a shop
' empty can cause glitches in the game, or so I'm told.

sub FF4Rom.EmptyShop(shop_index as UByte = &hFF)

 if shop_index = &hFF then
  for i as Integer = 0 to total_shops
   EmptyShop(i)
  next
 else
  for i as Integer = 1 to 8
   shops(shop_index).wares(i) = &hFF
  next
 end if

end sub
