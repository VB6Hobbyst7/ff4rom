sub FF4Rom.ReadScripts()
 dim start as Long
 dim p as ScriptEntry ptr
 dim s as Script ptr
 start = &h76B00
 for index as Integer = 0 to total_scripts
  s = scripts[index]
  do until ByteAt(start) = &hFF
   p = new ScriptEntry
   s->entries.AddPointer(p)
   p->action = ByteAt(start)
   start += 1
   if ScriptParameter(p->action) then
    p->parameter = ByteAt(start)
    start += 1
   end if
  loop
  start += 1
 next
end sub
