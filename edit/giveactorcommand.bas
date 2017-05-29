'This gives the specified actor the specified command.
' It will shift the "Item" command down to make room if it can. If it can't,
' it fails and doesn't add the command. It also fails if the actor already has
' the specified command. If the actor doesn't have an item command, it simply
' adds the specified command to the end of the menu if there is room.

sub FF4Rom.GiveActorCommand(actor_index as UByte, command_index as UByte)

 dim found as Boolean

 for i as Integer = 2 to 4
  if actors(actor_index).menu_command(i) = item_command then
   actors(actor_index).menu_command(i + 1) = item_command
   actors(actor_index).menu_command(i) = command_index
   found = true
   exit for
  elseif actors(actor_index).menu_command(i) = command_index then
   found = true
   exit for
  end if
 next

 if not found then
  for i as Integer = 1 to 5
   if actors(actor_index).menu_command(i) = &hFF then
    actors(actor_index).menu_command(i) = command_index
    exit for
   end if
  next
 end if

end sub
