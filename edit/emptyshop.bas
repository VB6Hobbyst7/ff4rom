sub FF4Rom.EmptyShop(shop_index as UByte)

 for i as Integer = 1 to 8
  shops(shop_index).wares(i) = &hFF
 next

end sub
