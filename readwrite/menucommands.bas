sub FF4Rom.ReadMenuCommands()

 dim start as Integer
 dim total as Integer
 
 for i as Integer = 0 to total_menu_commands
 
  for j as Integer = 0 to 4
   menu_commands(i).name += chr(ByteAt(&h7A9C6 + i * 5 + j))
  next
  
  menu_commands(i).target = ByteAt(&h9FFC3 + i)
  menu_commands(i).delay = ByteAt(&hA0089 + i)
  
  for j as Integer = 0 to 7
   menu_commands(i).disabling_statuses(8 + j) = iif(ByteAt(&h9FF19 + i * 2) and 2^j, true, false)
   menu_commands(i).disabling_statuses(16 + j) = iif(ByteAt(&h9FF19 + i * 2  + 1) and 2^j, true, false)
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
 menu_commands(sing_command).parameters(5) = ByteAt(&h1EB0D) 'Spell 5 (Frog song)
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

 dim start as Integer
 dim total as Integer
 dim temp as UByte
 
 for i as Integer = 0 to total_menu_commands
 
  for j as Integer = 0 to 4
   WriteByte(&h7A9C6 + i * 5 + j, asc(mid(menu_commands(i).name, j, 1)))
  next
  
  WriteByte(&h9FFC3 + i, menu_commands(i).target)
  WriteByte(&hA0089 + i, menu_commands(i).delay)
  
  temp = 0
  for j as Integer = 0 to 7
   temp += iif(menu_commands(i).disabling_statuses(8 + j), 2^j, 0)
  next
  WriteByte(&h9FF19 + i * 2, temp)
  temp = 0
  for j as Integer = 0 to 7
   temp += iif(menu_commands(i).disabling_statuses(16 + j), 2^j, 0)
  next
  WriteByte(&h9FF19 + i * 2 + 1, temp)
  
  WriteByte(&hB7E60 + i, menu_commands(i).charging_stance)

 next 
 
 'Action Stances 
 ' (Some of these addresses appear to be duplicates; not sure why)
 WriteByte(&h149B3, menu_commands(item_command).action_stance)
 WriteByte(&h148D4, menu_commands(white_command).action_stance)
 WriteByte(&h148E1, menu_commands(black_command).action_stance)
 WriteByte(&h1491A, menu_commands(call_command).action_stance)
 WriteByte(&h14A5F, menu_commands(darkwave_command).action_stance)
 WriteByte(&h14828, menu_commands(jump_command).action_stance)
 WriteByte(&h14833, menu_commands(jump_command).action_stance2)
 WriteByte(&h146CD, menu_commands(jump_command).action_stance3)
 'WriteByte(&h148E1, menu_commands(recall_command).action_stance)
 WriteByte(&h148C7, menu_commands(sing_command).action_stance)
 WriteByte(&h147CB, menu_commands(hide_command).action_stance)
 'WriteByte(&h149B3, menu_commands(salve_command).action_stance)
 WriteByte(&h149F3, menu_commands(pray_command).action_stance)
 WriteByte(&h14A8A, menu_commands(aim_command).action_stance)
 WriteByte(&h1451D, menu_commands(kick_command).action_stance)
 WriteByte(&h149AB, menu_commands(boast_command).action_stance)
 'WriteByte(&h149AB, menu_commands(cry_command).action_stance)
 'WriteByte(&h149F3, menu_commands(cover_command).action_stance)
 'WriteByte(&h149AB, menu_commands(scan_command).action_stance)
 WriteByte(&h1434C, menu_commands(throw_command).action_stance)
 'WriteByte(&h149F3, menu_commands(steal_command).action_stance)
 'WriteByte(&h148E1, menu_commands(ninja_command).action_stance)
 'WriteByte(&h149AB, menu_commands(regen_command).action_stance)
  
 'Fight parameters
 WriteByte(&h1C864, menu_commands(fight_command).parameters(1)) 'Elemental multiplier - extra weak
 WriteByte(&h1C873, menu_commands(fight_command).parameters(2)) 'Elemental multiplier - weak
 WriteByte(&h1C882, menu_commands(fight_command).parameters(3)) 'Elemental multiplier - immune
 WriteByte(&h1C891, menu_commands(fight_command).parameters(4)) 'Elemental multiplier - resist
 WriteByte(&h1C8A6, menu_commands(fight_command).parameters(5)) 'Racial multiplier - weak
 WriteByte(&h1C8B9, menu_commands(fight_command).parameters(6)) 'Racial multiplier - resist
 WriteByte(&h1CA43, menu_commands(fight_command).parameters(7)) 'Caster bonus stat for determining status infliction chance
 WriteByte(&h1CA46, menu_commands(fight_command).parameters(8)) 'Target penalty stat for determining status infliction chance
 
 'Recall parameters
 for i as Integer = 0 to 7
  WriteByte(&h1EC22 + i * 8, total + menu_commands(recall_command).parameters(i)) 'Chance of spell
  total += menu_commands(recall_command).parameters(i)
  WriteByte(&h1EC26 + i * 8, menu_commands(recall_command).parameters(i + 8)) 'Spell
 next
 WriteByte(&h1EC62, menu_commands(recall_command).message_index(1))
 
 'Sing parameters
 WriteByte(&h1EB18, menu_commands(sing_command).message_index(1))
 WriteByte(&h1EB25, menu_commands(sing_command).message_index(2))
 WriteByte(&h1EB32, menu_commands(sing_command).message_index(3))
 WriteByte(&h1EB3B, menu_commands(sing_command).message_index(4))
 WriteByte(&h1EB08, menu_commands(sing_command).message_index(5))
 WriteByte(&h1EB1D, menu_commands(sing_command).parameters(1)) 'Spell 1
 WriteByte(&h1EB2A, menu_commands(sing_command).parameters(2)) 'Spell 2
 WriteByte(&h1EB37, menu_commands(sing_command).parameters(3)) 'Spell 3
 WriteByte(&h1EB40, menu_commands(sing_command).parameters(4)) 'Spell 4
 WriteByte(&h1EB0D, menu_commands(sing_command).parameters(5)) 'Spell 5 (Frog song)
 WriteByte(&h1EB01, menu_commands(sing_command).parameters(6)) 'Frog song condition stat
 WriteByte(&h1EB04, menu_commands(sing_command).parameters(7)) 'Frog song condition value
 
 'Hide parameters
 WriteByte(&h1AD57, menu_commands(hide_command).parameters(1)) 'Auto-hide actor

 'Salve parameters
 WriteByte(&h1E4E8, menu_commands(salve_command).parameters(1)) 'Item consumed
 WriteByte(&h1E532, menu_commands(salve_command).parameters(2)) 'Item effect
 WriteByte(&h1E53D, menu_commands(salve_command).parameters(3)) 'Item visual
 WriteByte(&h1E4F9, menu_commands(salve_command).message_index(1))
 
 'Pray parameters
 WriteByte(&h1EA56, menu_commands(pray_command).parameters(1)) 'Chance of success
 WriteByte(&h1EA64, menu_commands(pray_command).parameters(2)) 'Spell
 WriteByte(&h1EA5D, menu_commands(pray_command).message_index(1))
 
 'Charge parameters
 WriteByte(&h1EA1E, menu_commands(charge_command).message_index(1))

 'Gird parameters
 WriteByte(&h1E897, menu_commands(gird_command).parameters(1))
 WriteByte(&h1E8A5, menu_commands(gird_command).message_index(1))
 
 'Twin parameters
 WriteByte(&h1E793, menu_commands(twin_command).parameters(1)) 'Spell 1 (Flare)
 WriteByte(&h1E797, menu_commands(twin_command).parameters(2)) 'Spell 2 (Comet)
 WriteByte(&h1E77C, menu_commands(twin_command).parameters(3)) 'Special Spell (Double Meteor)
 WriteByte(&h1E783, menu_commands(twin_command).parameters(4)) 'Chance it will fail outright (x or higher)
 WriteByte(&h1E78F, menu_commands(twin_command).parameters(5)) 'Chance it will be spell 2 (less than x)
 WriteByte(&h1E774, menu_commands(twin_command).parameters(6)) 'Special actor 1 (FuSoYa)
 WriteByte(&h1E778, menu_commands(twin_command).parameters(7)) 'Special actor 2 (Golbez)
 WriteByte(&h1E6DC, menu_commands(twin_command).message_index(1)) 'Cancel message
 WriteByte(&h1E787, menu_commands(twin_command).message_index(2)) 'Failure message
 
 ''Boast parameters
 WriteByte(&h1ECD1, menu_commands(boast_command).parameters(1)) 'Stat
 WriteByte(&h1ECD4, menu_commands(boast_command).parameters(2)) 'Amount
 WriteByte(&h1ECDF, menu_commands(boast_command).message_index(1))
 
 'Cry parameters
 WriteByte(&h1ECF3, menu_commands(cry_command).parameters(1)) 'Stat used for amount calculation
 WriteByte(&h1ED0C, menu_commands(cry_command).parameters(2)) 'Stat to reduce
 WriteByte(&h1ED22, menu_commands(cry_command).message_index(1))
 
 'Cover parameters
 WriteByte(&h18F62, menu_commands(cover_command).parameters(1)) 'Disable if this actor is in the party
 WriteByte(&h18F66, menu_commands(cover_command).parameters(2)) 'Actor that covers

 'Steal parameters
 WriteByte(&h1E3F1, menu_commands(steal_command).parameters(1)) 'Base
 WriteByte(&h1E3F3, menu_commands(steal_command).parameters(2)) 'Bonus stat
 WriteByte(&h1E3F7, menu_commands(steal_command).parameters(3)) 'Penalty stat
 WriteByte(&h1E457, menu_commands(steal_command).parameters(4)) 'Slot
 WriteByte(&h1E433, menu_commands(steal_command).message_index(1)) 'Damaged by enemy
 WriteByte(&h1E43A, menu_commands(steal_command).message_index(2)) 'Couldn't steal
 WriteByte(&h1E4CA, menu_commands(steal_command).message_index(3)) 'Stole item

 'Regen parameters
 WriteByte(&h1E5FE, menu_commands(regen_command).parameters(1)) 'Regen amount
 WriteByte(&h1E616, iif(menu_commands(regen_command).parameters(2), &h0C, 1))
 WriteByte(&h1E624, iif(menu_commands(regen_command).parameters(2), &h08, 0))
 WriteByte(&h1E633, menu_commands(regen_command).message_index(1))

end sub
