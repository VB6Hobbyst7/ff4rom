sub FF4Rom.ReadMenuCommands()

 dim start as Integer
 dim total as Integer
 
 for i as Integer = 0 to total_menu_commands
  start = &h7A9C6 + i * 5
  for j as Integer = 0 to 4
   menu_commands(i).name += chr(ByteAt(start + j))
  next
  
  menu_commands(i).target = (ByteAt(&h9FFC3 + i) \ &h10) mod 8
  
  menu_commands(i).delay = ByteAt(&hA0089 + i)
  
  for j as Integer = 0 to 7
   menu_commands(i).disabling_statuses(9 + j) = iif(ByteAt(&h9FF19 + i * 2) and 2^j, true, false)
   menu_commands(i).disabling_statuses(17 + j) = iif(ByteAt(&h9FF19 + i * 2  + 1) and 2^j, true, false)
  next
  
  menu_commands(i).charging_stance = ByteAt(&hB7E60 + i)
  menu_commands(i).action_stance = &hFF
  menu_commands(i).action_stance2 = &hFF
  menu_commands(i).action_stance3 = &hFF

 next 
 
 'Action Stances
 menu_commands(item_command).action_stance = ByteAt(&h149B3)
 menu_commands(white_command).action_stance = ByteAt(&h148D4)
 menu_commands(black_command).action_stance = ByteAt(&h148E1)
 menu_commands(call_command).action_stance = ByteAt(&h1491A)
 menu_commands(darkwave_command).action_stance = ByteAt(&h14A5F)
 menu_commands(jump_command).action_stance = ByteAt(&h14828)
 menu_commands(jump_command).action_stance2 = ByteAt(&h14833)
 menu_commands(jump_command).action_stance3 = ByteAt(&h146CD)
 menu_commands(recall_command).action_stance = ByteAt(&h148E1)
 menu_commands(sing_command).action_stance = ByteAt(&h148C7)
 menu_commands(hide_command).action_stance = ByteAt(&h147CB)
 menu_commands(salve_command).action_stance = ByteAt(&h149B3)
 menu_commands(pray_command).action_stance = ByteAt(&h149F3)
 menu_commands(aim_command).action_stance = ByteAt(&h14A8A)
 menu_commands(kick_command).action_stance = ByteAt(&h1451D)
 menu_commands(boast_command).action_stance = ByteAt(&h149AB)
 menu_commands(cry_command).action_stance = ByteAt(&h149AB)
 menu_commands(cover_command).action_stance = ByteAt(&h149F3)
 menu_commands(scan_command).action_stance = ByteAt(&h149AB)
 menu_commands(throw_command).action_stance = ByteAt(&h1434C)
 menu_commands(steal_command).action_stance = ByteAt(&h149F3)
 menu_commands(ninja_command).action_stance = ByteAt(&h148E1)
 menu_commands(regen_command).action_stance = ByteAt(&h149AB)
  
 'Fight parameters
 menu_commands(fight_command).parameters(1) = ByteAt(&h1C864) 'Elemental multiplier - extra weak
 menu_commands(fight_command).parameters(2) = ByteAt(&h1C873) 'Elemental multiplier - weak
 menu_commands(fight_command).parameters(3) = ByteAt(&h1C882) 'Elemental multiplier - immune
 menu_commands(fight_command).parameters(4) = ByteAt(&h1C891) 'Elemental multiplier - resist
 menu_commands(fight_command).parameters(5) = ByteAt(&h1C8A6) 'Racial multiplier - weak
 menu_commands(fight_command).parameters(6) = ByteAt(&h1C8B9) 'Racial multiplier - resist
 menu_commands(fight_command).parameters(7) = ByteAt(&h1CA43) 'Caster bonus stat for determining status infliction chance
 menu_commands(fight_command).parameters(8) = ByteAt(&h1CA46) 'Target penalty stat for determining status infliction chance
 
 'Recall parameters
 for i as Integer = 0 to 7
  menu_commands(recall_command).parameters(i) = ByteAt(&h1EC22 + i * 8) - total 'Chance of spell
  total += menu_commands(recall_command).parameters(i)
  menu_commands(recall_command).parameters(i + 8) = ByteAt(&h1EC26 + i * 8) 'Spell
 next
 menu_commands(recall_command).message_index(1) = ByteAt(&h1EC62)
 
 'Sing parameters
 menu_commands(sing_command).message_index(1) = ByteAt(&h1EB18)
 menu_commands(sing_command).message_index(2) = ByteAt(&h1EB25)
 menu_commands(sing_command).message_index(3) = ByteAt(&h1EB32)
 menu_commands(sing_command).message_index(4) = ByteAt(&h1EB3B)
 menu_commands(sing_command).message_index(5) = ByteAt(&h1EB08)
 menu_commands(sing_command).parameters(1) = ByteAt(&h1EB1D) 'Spell 1
 menu_commands(sing_command).parameters(2) = ByteAt(&h1EB2A) 'Spell 2
 menu_commands(sing_command).parameters(3) = ByteAt(&h1EB37) 'Spell 3
 menu_commands(sing_command).parameters(4) = ByteAt(&h1EB40) 'Spell 4
 menu_commands(sing_command).parameters(5) = ByteAt(&h1EB0D) 'Spell 5
 menu_commands(sing_command).parameters(6) = ByteAt(&h1EB01) 'Frog song condition stat
 menu_commands(sing_command).parameters(7) = ByteAt(&h1EB04) 'Frog song condition value
 
 'Hide parameters
 menu_commands(hide_command).parameters(1) = ByteAt(&h1AD57) 'Auto-hide actor

 'Salve parameters
 menu_commands(salve_command).parameters(1) = ByteAt(&h1E4E8) 'Item consumed
 menu_commands(salve_command).parameters(2) = ByteAt(&h1E532) 'Item effect
 menu_commands(salve_command).parameters(3) = ByteAt(&h1E53D) 'Item visual
 menu_commands(salve_command).message_index(1) = ByteAt(&h1E4F9)
 
 'Pray parameters
 menu_commands(pray_command).parameters(1) = ByteAt(&h1EA56) 'Chance of success
 menu_commands(pray_command).parameters(2) = ByteAt(&h1EA64) 'Spell
 menu_commands(pray_command).message_index(1) = ByteAt(&h1EA5D)
 
 'Charge parameters
 menu_commands(charge_command).message_index(1) = ByteAt(&h1EA1E)

 'Gird parameters
 menu_commands(gird_command).parameters(1) = ByteAt(&h1E897)
 menu_commands(gird_command).message_index(1) = ByteAt(&h1E8A5)
 
 'Twin parameters
 menu_commands(twin_command).parameters(1) = ByteAt(&h1E793) 'Spell 1 (Flare)
 menu_commands(twin_command).parameters(2) = ByteAt(&h1E797) 'Spell 2 (Comet)
 menu_commands(twin_command).parameters(3) = ByteAt(&h1E77C) 'Special Spell (Double Meteor)
 menu_commands(twin_command).parameters(4) = ByteAt(&h1E783) 'Chance it will fail outright (x or higher)
 menu_commands(twin_command).parameters(5) = ByteAt(&h1E78F) 'Chance it will be spell 2 (less than x)
 menu_commands(twin_command).parameters(6) = ByteAt(&h1E774) 'Special actor 1 (FuSoYa)
 menu_commands(twin_command).parameters(7) = ByteAt(&h1E778) 'Special actor 2 (Golbez)
 menu_commands(twin_command).message_index(1) = ByteAt(&h1E6DC) 'Cancel message
 menu_commands(twin_command).message_index(2) = ByteAt(&h1E787) 'Failure message
 
 'Boast parameters
 menu_commands(boast_command).parameters(1) = ByteAt(&h1ECD1) 'Stat
 menu_commands(boast_command).parameters(2) = ByteAt(&h1ECD4) 'Amount
 menu_commands(boast_command).message_index(1) = ByteAt(&h1ECDF)
 
 'Cry parameters
 menu_commands(cry_command).parameters(1) = ByteAt(&h1ECF3) 'Stat used for amount calculation
 menu_commands(cry_command).parameters(2) = ByteAt(&h1ED0C) 'Stat to reduce
 menu_commands(cry_command).message_index(1) = ByteAt(&h1ED22)
 
 'Cover parameters
 menu_commands(cover_command).parameters(1) = ByteAt(&h18F62) 'Disable if this actor is in the party
 menu_commands(cover_command).parameters(2) = ByteAt(&h18F66) 'Actor that covers

 'Steal parameters
 menu_commands(steal_command).parameters(1) = ByteAt(&h1E3F1) 'Base
 menu_commands(steal_command).parameters(2) = ByteAt(&h1E3F3) 'Bonus stat
 menu_commands(steal_command).parameters(3) = ByteAt(&h1E3F7) 'Penalty stat
 menu_commands(steal_command).parameters(4) = ByteAt(&h1E457) 'Slot
 menu_commands(steal_command).message_index(1) = ByteAt(&h1E433) 'Damaged by enemy
 menu_commands(steal_command).message_index(2) = ByteAt(&h1E43A) 'Couldn't steal
 menu_commands(steal_command).message_index(3) = ByteAt(&h1E4CA) 'Stole item

 'Regen parameters
 menu_commands(regen_command).parameters(1) = ByteAt(&h1E5FE) 'Regen amount
 menu_commands(regen_command).parameters(2) = iif(ByteAt(&h1E616) = 1 and ByteAt(&h1E624) = 0, false, true)
 menu_commands(regen_command).message_index(1) = ByteAt(&h1E633)
 
end sub


sub FF4Rom.WriteMenuCommands()



end sub
