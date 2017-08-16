sub FF4Rom.ReadPrices()

 dim start as Integer
 
 start = &h6C83
 for i as Integer = 0 to total_prices
  prices(i) = ByteAt(start + i * 2) + ByteAt(start + i * 2 + 1) * &h100
 next

end sub


sub FF4Rom.WritePrices()

 dim start as Integer
 
 start = &h6C83
 for i as Integer = 0 to total_prices
  WriteByte(start + i * 2, prices(i) mod &h100)
  WriteByte(start + i * 2 + 1, prices(i) \ &h100)
 next

end sub
