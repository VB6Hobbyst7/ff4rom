sub FF4Rom.SaveToFile(filename as String)

 dim temp as String

 open filename for binary access write as #1
  open filename for binary access write as #1
   temp = romdata
   if unheadered then temp = mid(romdata, &h200 + 1)
   put #1, , temp
  close
 close

end sub
