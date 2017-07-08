'This entirely erases an actor's command menu and gives them just Fight and
' Item. If no actor index is specified, it will wipe out every actor's command
' menu.

sub FF4Rom.ClearActorCommands(actor_index as UByte = &hFF)

 if actor_index = &hFF then
  for i as Integer = 0 to total_actors
   ClearActorCommands(i)
  next
 else
  actors(actor_index).menu_command(1) = fight_command
  actors(actor_index).menu_command(2) = item_command
  for i as Integer = 3 to 5
   actors(actor_index).menu_command(i) = &hFF
  next
 end if

end sub
