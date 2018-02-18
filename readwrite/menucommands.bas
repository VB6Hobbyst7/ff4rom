sub FF4Rom.ReadMenuCommands()

 dim start as Integer
 dim total as Integer
 dim temp as UByte
 
 for i as Integer = 0 to total_menu_commands
 
  for j as Integer = 0 to 4
   menu_commands(i)->name += chr(ByteAt(&h7A9C6 + i * 5 + j))
  next
  
  menu_commands(i)->target = ByteAt(&h9FFC3 + i)
  menu_commands(i)->delay = ByteAt(&hA0089 + i)
  menu_commands(i)->disabling_statuses.SetFlagsFromBytes(0, ByteAt(&h9FF19 + i * 2), ByteAt(&h9FF19 + i * 2 + 1))
  menu_commands(i)->charging_stance = ByteAt(&hB7E60 + i)
  menu_commands(i)->action_stance = &hFF
  menu_commands(i)->action_stance2 = &hFF
  menu_commands(i)->action_stance3 = &hFF

 next 
 
 'Action Stances
 menu_commands(item_command)->action_stance = ByteAt(&h149B3)
 menu_commands(white_command)->action_stance = ByteAt(&h148D4)
 menu_commands(black_command)->action_stance = ByteAt(&h148E1)
 menu_commands(call_command)->action_stance = ByteAt(&h1491A)
 menu_commands(darkwave_command)->action_stance = ByteAt(&h14A5F)
 menu_commands(jump_command)->action_stance = ByteAt(&h14828)
 menu_commands(jump_command)->action_stance2 = ByteAt(&h14833)
 menu_commands(jump_command)->action_stance3 = ByteAt(&h146CD)
 menu_commands(recall_command)->action_stance = ByteAt(&h148E1)
 menu_commands(sing_command)->action_stance = ByteAt(&h148C7)
 menu_commands(hide_command)->action_stance = ByteAt(&h147CB)
 menu_commands(salve_command)->action_stance = ByteAt(&h149B3)
 menu_commands(pray_command)->action_stance = ByteAt(&h149F3)
 menu_commands(aim_command)->action_stance = ByteAt(&h14A8A)
 menu_commands(kick_command)->action_stance = ByteAt(&h1451D)
 menu_commands(boast_command)->action_stance = ByteAt(&h149AB)
 menu_commands(cry_command)->action_stance = ByteAt(&h149AB)
 menu_commands(cover_command)->action_stance = ByteAt(&h149F3)
 menu_commands(scan_command)->action_stance = ByteAt(&h149AB)
 menu_commands(throw_command)->action_stance = ByteAt(&h1434C)
 menu_commands(steal_command)->action_stance = ByteAt(&h149F3)
 menu_commands(ninja_command)->action_stance = ByteAt(&h148E1)
 menu_commands(regen_command)->action_stance = ByteAt(&h149AB)
  
 'Fight parameters
 menu_commands(fight_command)->values.AddValue(ByteAt(&h1C864)) 'Elemental multiplier - extra weak
 menu_commands(fight_command)->values.AddValue(ByteAt(&h1C873)) 'Elemental multiplier - weak
 menu_commands(fight_command)->values.AddValue(ByteAt(&h1C882)) 'Elemental multiplier - immune
 menu_commands(fight_command)->values.AddValue(ByteAt(&h1C891)) 'Elemental multiplier - resist
 menu_commands(fight_command)->values.AddValue(ByteAt(&h1C8A6)) 'Racial multiplier - weak
 menu_commands(fight_command)->values.AddValue(ByteAt(&h1C8B9)) 'Racial multiplier - resist
 menu_commands(fight_command)->values.AddValue(ByteAt(&h1CA43)) 'Caster bonus stat for determining status infliction chance
 menu_commands(fight_command)->values.AddValue(ByteAt(&h1CA46)) 'Target penalty stat for determining status infliction chance
 
 'Recall parameters
 for i as Integer = 0 to 7
  temp = ByteAt(&h1EC22 + i * 8) - total 
  menu_commands(recall_command)->values.AddValue(temp) 'Chance of spell
  total += temp
  menu_commands(recall_command)->spells.AddPointer(spells(ByteAt(&h1EC26 + i * 8))) 'Spell
 next
 menu_commands(recall_command)->messages.AddPointer(alert_messages(ByteAt(&h1EC62)))
 
 'Sing parameters
 menu_commands(sing_command)->messages.AddPointer(alert_messages(ByteAt(&h1EB18)))
 menu_commands(sing_command)->messages.AddPointer(alert_messages(ByteAt(&h1EB25)))
 menu_commands(sing_command)->messages.AddPointer(alert_messages(ByteAt(&h1EB32)))
 menu_commands(sing_command)->messages.AddPointer(alert_messages(ByteAt(&h1EB3B)))
 menu_commands(sing_command)->messages.AddPointer(alert_messages(ByteAt(&h1EB08)))
 menu_commands(sing_command)->spells.AddPointer(spells(ByteAt(&h1EB1D))) 'Spell 1
 menu_commands(sing_command)->spells.AddPointer(spells(ByteAt(&h1EB2A))) 'Spell 2
 menu_commands(sing_command)->spells.AddPointer(spells(ByteAt(&h1EB37))) 'Spell 3
 menu_commands(sing_command)->spells.AddPointer(spells(ByteAt(&h1EB40))) 'Spell 4
 menu_commands(sing_command)->spells.AddPointer(spells(ByteAt(&h1EB0D))) 'Spell 5 (Frog song)
 menu_commands(sing_command)->values.AddValue(ByteAt(&h1EB01)) 'Frog song condition stat
 menu_commands(sing_command)->values.AddValue(ByteAt(&h1EB04)) 'Frog song condition value
 
 'Hide parameters
 menu_commands(hide_command)->actors.AddPointer(actors(ByteAt(&h1AD57))) 'Auto-hide actor

 'Salve parameters
 menu_commands(salve_command)->items.AddPointer(items(ByteAt(&h1E4E8))) 'Item consumed
 menu_commands(salve_command)->items.AddPointer(items(ByteAt(&h1E532))) 'Item effect
 menu_commands(salve_command)->items.AddPointer(items(ByteAt(&h1E53D))) 'Item visual
 menu_commands(salve_command)->messages.AddPointer(alert_messages(ByteAt(&h1E4F9))) 'Out of potions
 
 'Pray parameters
 menu_commands(pray_command)->values.AddValue(ByteAt(&h1EA56)) 'Chance of success
 menu_commands(pray_command)->spells.AddPointer(spells(ByteAt(&h1EA64))) 'Spell
 menu_commands(pray_command)->messages.AddPointer(alert_messages(ByteAt(&h1EA5D)))
 
 'Charge parameters
 menu_commands(charge_command)->messages.AddPointer(alert_messages(ByteAt(&h1EA1E)))

 'Gird parameters
 menu_commands(gird_command)->spells.AddPointer(spells(ByteAt(&h1E897)))
 menu_commands(gird_command)->messages.AddPointer(alert_messages(ByteAt(&h1E8A5)))
 
 'Twin parameters
 menu_commands(twin_command)->spells.AddPointer(spells(ByteAt(&h1E793))) 'Spell 1 (Flare)
 menu_commands(twin_command)->spells.AddPointer(spells(ByteAt(&h1E797))) 'Spell 2 (Comet)
 menu_commands(twin_command)->spells.AddPointer(spells(ByteAt(&h1E77C))) 'Special Spell (Double Meteor)
 menu_commands(twin_command)->values.AddValue(ByteAt(&h1E783)) 'Chance it will fail outright (x or higher)
 menu_commands(twin_command)->values.AddValue(ByteAt(&h1E78F)) 'Chance it will be spell 2 (less than x)
 menu_commands(twin_command)->actors.AddPointer(actors(ByteAt(&h1E774) - 1)) 'Special actor 1 (FuSoYa)
 menu_commands(twin_command)->actors.AddPointer(actors(ByteAt(&h1E778) - 1)) 'Special actor 2 (Golbez)
 menu_commands(twin_command)->messages.AddPointer(alert_messages(ByteAt(&h1E6DC))) 'Cancel message
 menu_commands(twin_command)->messages.AddPointer(alert_messages(ByteAt(&h1E787))) 'Failure message
 
 'Boast parameters
 menu_commands(boast_command)->values.AddValue(ByteAt(&h1ECD1)) 'Stat
 menu_commands(boast_command)->values.AddValue(ByteAt(&h1ECD4)) 'Amount
 menu_commands(boast_command)->messages.AddPointer(alert_messages(ByteAt(&h1ECDF)))
 
 'Cry parameters
 menu_commands(cry_command)->values.AddValue(ByteAt(&h1ECF3)) 'Stat used for amount calculation
 menu_commands(cry_command)->values.AddValue(ByteAt(&h1ED0C)) 'Stat to reduce on target(s)
 menu_commands(cry_command)->messages.AddPointer(alert_messages(ByteAt(&h1ED22)))
 
 'Cover parameters
 menu_commands(cover_command)->actors.AddPointer(actors(ByteAt(&h18F62))) 'Disable if this actor is in the party
 menu_commands(cover_command)->actors.AddPointer(actors(ByteAt(&h18F66))) 'Actor that covers

 'Steal parameters
 menu_commands(steal_command)->values.AddValue(ByteAt(&h1E3F1)) 'Base
 menu_commands(steal_command)->values.AddValue(ByteAt(&h1E3F3)) 'Bonus stat
 menu_commands(steal_command)->values.AddValue(ByteAt(&h1E3F7)) 'Penalty stat
 menu_commands(steal_command)->values.AddValue(ByteAt(&h1E457)) 'Slot
 menu_commands(steal_command)->messages.AddPointer(alert_messages(ByteAt(&h1E433))) 'Damaged by enemy
 menu_commands(steal_command)->messages.AddPointer(alert_messages(ByteAt(&h1E43A))) 'Couldn't steal
 menu_commands(steal_command)->messages.AddPointer(alert_messages(ByteAt(&h1E4CA))) 'Stole item

 'Regen parameters
 menu_commands(regen_command)->values.AddValue(ByteAt(&h1E5FE)) 'Regen amount
 menu_commands(regen_command)->freeze = iif(ByteAt(&h1E616) = 1 and ByteAt(&h1E624) = 0, false, true) 'Freeze user
 menu_commands(regen_command)->messages.AddPointer(alert_messages(ByteAt(&h1E633)))
 
end sub


sub FF4Rom.WriteMenuCommands()

 dim start as Integer
 dim total as Integer
 dim temp as UByte
 dim bytes as List
 
 for i as Integer = 0 to total_menu_commands
 
  for j as Integer = 0 to 4
   WriteByte(&h7A9C6 + i * 5 + j, iif(len(menu_commands(i)->name) <= j, &hFF, asc(mid(menu_commands(i)->name, j + 1, 1))))
  next
  
  WriteByte(&h9FFC3 + i, menu_commands(i)->target)
  WriteByte(&hA0089 + i, menu_commands(i)->delay)
  
  bytes = menu_commands(i)->disabling_statuses.BytesFromFlags()
  WriteByte(&h9FF19 + i * 2, bytes.ValueAt(2))
  WriteByte(&h9FF19 + i * 2 + 1, bytes.ValueAt(3))
  WriteByte(&hB7E60 + i, menu_commands(i)->charging_stance)

 next 
 
 'Action Stances 
 ' (Some of these addresses appear to be duplicates; not sure why)
 WriteByte(&h149B3, menu_commands(item_command)->action_stance) 'Shared with Salve
 WriteByte(&h148D4, menu_commands(white_command)->action_stance)
 WriteByte(&h148E1, menu_commands(black_command)->action_stance) 'Shared with Recall, Ninja
 WriteByte(&h1491A, menu_commands(call_command)->action_stance)
 WriteByte(&h14A5F, menu_commands(darkwave_command)->action_stance)
 WriteByte(&h14828, menu_commands(jump_command)->action_stance)
 WriteByte(&h14833, menu_commands(jump_command)->action_stance2)
 WriteByte(&h146CD, menu_commands(jump_command)->action_stance3)
 'WriteByte(&h148E1, menu_commands(recall_command)->action_stance)
 WriteByte(&h148C7, menu_commands(sing_command)->action_stance)
 WriteByte(&h147CB, menu_commands(hide_command)->action_stance)
 'WriteByte(&h149B3, menu_commands(salve_command)->action_stance)
 WriteByte(&h149F3, menu_commands(pray_command)->action_stance) 'Shared with Cover, Steal
 WriteByte(&h14A8A, menu_commands(aim_command)->action_stance)
 WriteByte(&h1451D, menu_commands(kick_command)->action_stance)
 WriteByte(&h149AB, menu_commands(boast_command)->action_stance) 'Shared with Cry, Scan, Regen
 'WriteByte(&h149AB, menu_commands(cry_command)->action_stance)
 'WriteByte(&h149F3, menu_commands(cover_command)->action_stance)
 'WriteByte(&h149AB, menu_commands(scan_command)->action_stance)
 WriteByte(&h1434C, menu_commands(throw_command)->action_stance)
 'WriteByte(&h149F3, menu_commands(steal_command)->action_stance)
 'WriteByte(&h148E1, menu_commands(ninja_command)->action_stance)
 'WriteByte(&h149AB, menu_commands(regen_command)->action_stance)
  
 'Fight parameters
 WriteByte(&h1C864, menu_commands(fight_command)->values.ValueAt(1)) 'Elemental multiplier - extra weak
 WriteByte(&h1C873, menu_commands(fight_command)->values.ValueAt(2)) 'Elemental multiplier - weak
 WriteByte(&h1C882, menu_commands(fight_command)->values.ValueAt(3)) 'Elemental multiplier - immune
 WriteByte(&h1C891, menu_commands(fight_command)->values.ValueAt(4)) 'Elemental multiplier - resist
 WriteByte(&h1C8A6, menu_commands(fight_command)->values.ValueAt(5)) 'Racial multiplier - weak
 WriteByte(&h1C8B9, menu_commands(fight_command)->values.ValueAt(6)) 'Racial multiplier - resist
 WriteByte(&h1CA43, menu_commands(fight_command)->values.ValueAt(7)) 'Caster bonus stat for determining status infliction chance
 WriteByte(&h1CA46, menu_commands(fight_command)->values.ValueAt(8)) 'Target penalty stat for determining status infliction chance
 
 'Recall parameters
 for i as Integer = 0 to 7
  total += menu_commands(recall_command)->values.ValueAt(i + 1) 'Chance of spell
  WriteByte(&h1EC22 + i * 8, total)
  WriteByte(&h1EC26 + i * 8, IndexOfSpell(menu_commands(recall_command)->spells.PointerAt(i + 1))) 'Spell
 next
 WriteByte(&h1EC62, IndexOfAlertMessage(menu_commands(recall_command)->messages.PointerAt(1)))
 
 'Sing parameters
 WriteByte(&h1EB18, IndexOfAlertMessage(menu_commands(sing_command)->messages.PointerAt(1)))
 WriteByte(&h1EB25, IndexOfAlertMessage(menu_commands(sing_command)->messages.PointerAt(2)))
 WriteByte(&h1EB32, IndexOfAlertMessage(menu_commands(sing_command)->messages.PointerAt(3)))
 WriteByte(&h1EB3B, IndexOfAlertMessage(menu_commands(sing_command)->messages.PointerAt(4)))
 WriteByte(&h1EB08, IndexOfAlertMessage(menu_commands(sing_command)->messages.PointerAt(5)))
 WriteByte(&h1EB1D, IndexOfSpell(menu_commands(sing_command)->spells.PointerAt(1))) 'Spell 1
 WriteByte(&h1EB2A, IndexOfSpell(menu_commands(sing_command)->spells.PointerAt(2))) 'Spell 2
 WriteByte(&h1EB37, IndexOfSpell(menu_commands(sing_command)->spells.PointerAt(3))) 'Spell 3
 WriteByte(&h1EB40, IndexOfSpell(menu_commands(sing_command)->spells.PointerAt(4))) 'Spell 4
 WriteByte(&h1EB0D, IndexOfSpell(menu_commands(sing_command)->spells.PointerAt(5))) 'Spell 5 (Frog song)
 WriteByte(&h1EB01, menu_commands(sing_command)->values.ValueAt(1)) 'Frog song condition stat
 WriteByte(&h1EB04, menu_commands(sing_command)->values.ValueAt(2)) 'Frog song condition value
 
 'Hide parameters
 WriteByte(&h1AD57, IndexOfActor(menu_commands(hide_command)->actors.PointerAt(1))) 'Auto-hide actor
 WriteByte(&h1A608, IndexOfActor(menu_commands(hide_command)->actors.PointerAt(1)))

 'Salve parameters
 WriteByte(&h1E4E8, IndexOfItem(menu_commands(salve_command)->items.PointerAt(1))) 'Item consumed
 WriteByte(&h1E532, IndexOfItem(menu_commands(salve_command)->items.PointerAt(2))) 'Item effect
 WriteByte(&h1E53D, IndexOfItem(menu_commands(salve_command)->items.PointerAt(3))) 'Item visual
 WriteByte(&h1E4F9, IndexOfAlertMessage(menu_commands(salve_command)->messages.PointerAt(1)))
 
 'Pray parameters
 WriteByte(&h1EA56, menu_commands(pray_command)->values.ValueAt(1)) 'Chance of success
 WriteByte(&h1EA64, IndexOfSpell(menu_commands(pray_command)->spells.PointerAt(1))) 'Spell
 WriteByte(&h1EA5D, IndexOfAlertMessage(menu_commands(pray_command)->messages.PointerAt(1)))
 
 'Charge parameters
 WriteByte(&h1EA1E, IndexOfAlertMessage(menu_commands(charge_command)->messages.PointerAt(1)))

 'Gird parameters
 WriteByte(&h1E897, IndexOfSpell(menu_commands(gird_command)->spells.PointerAt(1))) 'Spell
 WriteByte(&h1E8A5, IndexOfAlertMessage(menu_commands(gird_command)->messages.PointerAt(1)))
 
 'Twin parameters
 WriteByte(&h1E793, IndexOfSpell(menu_commands(twin_command)->spells.PointerAt(1))) 'Spell 1 (Flare)
 WriteByte(&h1E797, IndexOfSpell(menu_commands(twin_command)->spells.PointerAt(2))) 'Spell 2 (Comet)
 WriteByte(&h1E77C, IndexOfSpell(menu_commands(twin_command)->spells.PointerAt(3))) 'Special Spell (Double Meteor)
 WriteByte(&h1E783, menu_commands(twin_command)->values.ValueAt(1)) 'Chance it will fail outright (x or higher)
 WriteByte(&h1E78F, menu_commands(twin_command)->values.ValueAt(2)) 'Chance it will be spell 2 (less than x)
 WriteByte(&h1E774, IndexOfActor(menu_commands(twin_command)->actors.PointerAt(1)) + 1) 'Special actor 1 (FuSoYa)
 WriteByte(&h1E778, IndexOfActor(menu_commands(twin_command)->actors.PointerAt(2)) + 1) 'Special actor 2 (Golbez)
 WriteByte(&h1E6DC, IndexOfAlertMessage(menu_commands(twin_command)->messages.PointerAt(1))) 'Cancel message
 WriteByte(&h1E787, IndexOfAlertMessage(menu_commands(twin_command)->messages.PointerAt(2))) 'Failure message
 
 'Boast parameters
 WriteByte(&h1ECD1, menu_commands(boast_command)->values.ValueAt(1)) 'Stat
 WriteByte(&h1ECD4, menu_commands(boast_command)->values.ValueAt(2)) 'Amount
 WriteByte(&h1ECDF, IndexOfAlertMessage(menu_commands(boast_command)->messages.PointerAt(1)))
 
 'Cry parameters
 WriteByte(&h1ECF3, menu_commands(cry_command)->values.ValueAt(1)) 'Stat used for amount calculation
 WriteByte(&h1ED0C, menu_commands(cry_command)->values.ValueAt(2)) 'Stat to reduce
 WriteByte(&h1ED22, IndexOfAlertMessage(menu_commands(cry_command)->messages.PointerAt(1)))
 
 'Cover parameters
 WriteByte(&h18F62, IndexOfActor(menu_commands(cover_command)->actors.PointerAt(1))) 'Disable if this actor is in the party
 WriteByte(&h18F66, IndexOfActor(menu_commands(cover_command)->actors.PointerAt(2))) 'Actor that covers

 'Steal parameters
 WriteByte(&h1E3F1, menu_commands(steal_command)->values.ValueAt(1)) 'Base
 WriteByte(&h1E3F3, menu_commands(steal_command)->values.ValueAt(2)) 'Bonus stat
 WriteByte(&h1E3F7, menu_commands(steal_command)->values.ValueAt(3)) 'Penalty stat
 WriteByte(&h1E457, menu_commands(steal_command)->values.ValueAt(4)) 'Slot
 WriteByte(&h1E433, IndexOfAlertMessage(menu_commands(steal_command)->messages.PointerAt(1))) 'Damaged by enemy
 WriteByte(&h1E43A, IndexOfAlertMessage(menu_commands(steal_command)->messages.PointerAt(2))) 'Couldn't steal
 WriteByte(&h1E4CA, IndexOfAlertMessage(menu_commands(steal_command)->messages.PointerAt(3))) 'Stole item

 'Regen parameters
 WriteByte(&h1E5FE, menu_commands(regen_command)->values.ValueAt(1)) 'Regen amount
 WriteByte(&h1E616, iif(menu_commands(regen_command)->freeze, &h0C, 1))
 WriteByte(&h1E624, iif(menu_commands(regen_command)->freeze, &h08, 0))
 WriteByte(&h1E633, IndexOfAlertMessage(menu_commands(regen_command)->messages.PointerAt(1)))

end sub
