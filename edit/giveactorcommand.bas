'This gives the specified actor the specified command.
' It will shift the "Item" command down to make room if it can. If it can't,
' it fails and doesn't add the command. It also fails if the actor already has
' the specified command.

sub FF4Rom.GiveActorCommand(actorindex as UByte, commandindex as UByte)

 for i as Integer = 2 to 4
  if actors(actorindex).menu_command(i) = item_command - 1 then
   actors(actorindex).menu_command(i + 1) = item_command - 1
   actors(actorindex).menu_command(i) = commandindex - 1
   exit for
  elseif actors(actorindex).menu_command(i) = commandindex - 1 then
   exit for
  end if
 next

end sub
