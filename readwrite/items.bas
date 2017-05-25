sub FF4Rom.ReadItems()

 dim start as Integer

 descriptions_range.SetRange(ByteAt(&hA9BB), ByteAt(&hA9BF))
 weapons_range.SetRange(0, &h5F)
 armors_range.SetRange(&h60, &hAF)
 medicines_range.SetRange(&hB0, &hDD)
 tools_range.SetRange(&hDE, &hFF)

 for i as Integer = 0 to total_items
 
  items(i).name = ""
  for j as Integer = 0 to 8
   items(i).name += chr(ByteAt(&h78200 + i * 9 + j))
  next
  
  if descriptions_range.InRange(i) then
   items(i).description = ByteAt(&h7B000 + i - descriptions_range.start)
  end if
  
  items(i).price_code = ByteAt(&h7A650 + i)
  
  if medicines_range.InRange(i) then
   start = &h79880 + i * 6
   items(i).delay = ByteAt(start) mod &h20
   items(i).target = ByteAt(start) \ &h20
   items(i).power = ByteAt(start + 1)
   items(i).boss = iif(ByteAt(start + 2) and &h80, false, true)
   items(i).success = ByteAt(start + 2) mod &h80
   items(i).impact = iif(ByteAt(start + 3) and &h80, true, false)
   items(i).effect = ByteAt(start + 3) mod &h80
   items(i).damage = iif(ByteAt(start + 4) and &h80, false, true)
   items(i).element_code = ByteAt(start + 4) mod &h80
   items(i).reflectable = iif(ByteAt(start + 5) and &h80, false, true)
   items(i).mp_cost = ByteAt(start + 5) mod &h80
   items(i).visual = ByteAt(&h7D790 + i)
   items(i).price_code = ByteAt(&h7A700 + i)
  end if
  
  
 
 next

end sub


sub FF4Rom.WriteItems()
end sub
