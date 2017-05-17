'This writes all the various game object data back to the rom and then the rom
' data is written to the specified file.

sub FF4Rom.WriteToFile(filename as String)

 WriteElementGrids()
 WriteActors()

 dim temp as String

 open filename for binary access write as #1
  open filename for binary access write as #1
   temp = romdata
   if unheadered then temp = mid(romdata, &h200 + 1)
   put #1, , temp
  close
 close

end sub


