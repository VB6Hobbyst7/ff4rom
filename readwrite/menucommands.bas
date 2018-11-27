sub FF4Rom.ReadMenuCommands()
 dim start as Long
 dim p as MenuCommand ptr
 dim total as Integer
 for index as Integer = 0 to total_menu_commands
  p = menu_commands[index]
  for i as Integer = 0 to 4
   p->name += chr(ByteAt(&h7A9C6 + index * 5 + i))
  next
  p->target = ByteAt(&h9FFC3 + index)
  p->delay = ByteAt(&hA0089 + index)
  p->disabling_statuses.FromBytes(0, ByteAt(&h9FF19 + index * 2), ByteAt(&h9FF19 + index * 2 + 1))
  p->charging_stance = stances[ByteAt(&hB7E60 + index)]
 next
 menu_commands[CommandNames.item]->action_stance = stances[ByteAt(&h149B3)]
 menu_commands[CommandNames.white]->action_stance = stances[ByteAt(&h148D4)]
 menu_commands[CommandNames.black]->action_stance = stances[ByteAt(&h148E1)]
 menu_commands[CommandNames.summon]->action_stance = stances[ByteAt(&h1491A)]
 menu_commands[CommandNames.dark_wave]->action_stance = stances[ByteAt(&h14A5F)]
 menu_commands[CommandNames.jump]->action_stance = stances[ByteAt(&h14828)]
 menu_commands[CommandNames.jump]->second_stance = stances[ByteAt(&h14833)]
 menu_commands[CommandNames.jump]->third_stance = stances[ByteAt(&h146CD)]
 menu_commands[CommandNames.recall]->action_stance = stances[ByteAt(&h148E1)]
 menu_commands[CommandNames.sing]->action_stance = stances[ByteAt(&h148C7)]
 menu_commands[CommandNames.hide]->action_stance = stances[ByteAt(&h147CB)]
 menu_commands[CommandNames.salve]->action_stance = stances[ByteAt(&h149B3)]
 menu_commands[CommandNames.pray]->action_stance = stances[ByteAt(&h149F3)]
 menu_commands[CommandNames.aim]->action_stance = stances[ByteAt(&h14A8A)]
 menu_commands[CommandNames.kick]->action_stance = stances[ByteAt(&h1451D)]
 menu_commands[CommandNames.boast]->action_stance = stances[ByteAt(&h149AB)]
 menu_commands[CommandNames.cry]->action_stance = stances[ByteAt(&h149AB)]
 menu_commands[CommandNames.cover]->action_stance = stances[ByteAt(&h149F3)]
 menu_commands[CommandNames.peep]->action_stance = stances[ByteAt(&h149AB)]
 menu_commands[CommandNames.dart]->action_stance = stances[ByteAt(&h1434C)]
 menu_commands[CommandNames.sneak]->action_stance = stances[ByteAt(&h149F3)]
 menu_commands[CommandNames.ninja]->action_stance = stances[ByteAt(&h148E1)]
 menu_commands[CommandNames.regen]->action_stance = stances[ByteAt(&h149AB)]
 menu_commands[CommandNames.fight]->values.AddValue(ByteAt(&h1C864))
 menu_commands[CommandNames.fight]->values.AddValue(ByteAt(&h1C873))
 menu_commands[CommandNames.fight]->values.AddValue(ByteAt(&h1C882))
 menu_commands[CommandNames.fight]->values.AddValue(ByteAt(&h1C891))
 menu_commands[CommandNames.fight]->values.AddValue(ByteAt(&h1C8A6))
 menu_commands[CommandNames.fight]->values.AddValue(ByteAt(&h1C8B9))
 menu_commands[CommandNames.fight]->values.AddValue(ByteAt(&h1CA43))
 menu_commands[CommandNames.fight]->values.AddValue(ByteAt(&h1CA46))
 for i as Integer = 0 to 7
  menu_commands[CommandNames.recall]->values.AddValue(ByteAt(&h1EC22 + i * 8) - total)
  total += menu_commands[CommandNames.recall]->values.ValueAt(i+ 1)
  menu_commands[CommandNames.recall]->spells.AddPointer(spells[ByteAt(&h1EC26 + i * 8)])
 next
 menu_commands[CommandNames.recall]->messages.AddPointer(alert_messages[ByteAt(&h1EC62)])
 menu_commands[CommandNames.sing]->messages.AddPointer(alert_messages[ByteAt(&h1EB18)])
 menu_commands[CommandNames.sing]->messages.AddPointer(alert_messages[ByteAt(&h1EB25)])
 menu_commands[CommandNames.sing]->messages.AddPointer(alert_messages[ByteAt(&h1EB32)])
 menu_commands[CommandNames.sing]->messages.AddPointer(alert_messages[ByteAt(&h1EB3B)])
 menu_commands[CommandNames.sing]->messages.AddPointer(alert_messages[ByteAt(&h1EB08)])
 menu_commands[CommandNames.sing]->spells.AddPointer(spells[ByteAt(&h1EB1D)])
 menu_commands[CommandNames.sing]->spells.AddPointer(spells[ByteAt(&h1EB2A)])
 menu_commands[CommandNames.sing]->spells.AddPointer(spells[ByteAt(&h1EB37)])
 menu_commands[CommandNames.sing]->spells.AddPointer(spells[ByteAt(&h1EB40)])
 menu_commands[CommandNames.sing]->spells.AddPointer(spells[ByteAt(&h1EB0D)])
 menu_commands[CommandNames.sing]->values.AddValue(ByteAt(&h1EB01))
 menu_commands[CommandNames.sing]->values.AddValue(ByteAt(&h1EB04))
 menu_commands[CommandNames.hide]->actors.AddPointer(actors[ByteAt(&h1AD57)])
 menu_commands[CommandNames.salve]->items.AddPointer(items[ByteAt(&h1E4E8)])
 menu_commands[CommandNames.salve]->items.AddPointer(items[ByteAt(&h1E532)])
 menu_commands[CommandNames.salve]->items.AddPointer(items[ByteAt(&h1E53D)])
 menu_commands[CommandNames.salve]->messages.AddPointer(alert_messages[ByteAt(&h1E4F9)])
 menu_commands[CommandNames.pray]->values.AddValue(ByteAt(&h1EA56))
 menu_commands[CommandNames.pray]->spells.AddPointer(spells[ByteAt(&h1EA64)])
 menu_commands[CommandNames.pray]->messages.AddPointer(alert_messages[ByteAt(&h1EA5D)])
 menu_commands[CommandNames.charge]->messages.AddPointer(alert_messages[ByteAt(&h1EA1E)])
 menu_commands[CommandNames.gird]->spells.AddPointer(spells[ByteAt(&h1E897)])
 menu_commands[CommandNames.gird]->messages.AddPointer(alert_messages[ByteAt(&h1E8A5)])
 menu_commands[CommandNames.twin]->spells.AddPointer(spells[ByteAt(&h1E793)])
 menu_commands[CommandNames.twin]->spells.AddPointer(spells[ByteAt(&h1E797)])
 menu_commands[CommandNames.twin]->spells.AddPointer(spells[ByteAt(&h1E77C)])
 menu_commands[CommandNames.twin]->values.AddValue(ByteAt(&h1E783))
 menu_commands[CommandNames.twin]->values.AddValue(ByteAt(&h1E78F))
 menu_commands[CommandNames.twin]->actors.AddPointer(actors[ByteAt(&h1E774)])
 menu_commands[CommandNames.twin]->actors.AddPointer(actors[ByteAt(&h1E778)])
 menu_commands[CommandNames.twin]->messages.AddPointer(alert_messages[ByteAt(&h1E6DC)])
 menu_commands[CommandNames.twin]->messages.AddPointer(alert_messages[ByteAt(&h1E787)])
 menu_commands[CommandNames.boast]->values.AddValue(ByteAt(&h1ECD1))
 menu_commands[CommandNames.boast]->values.AddValue(ByteAt(&h1ECD4))
 menu_commands[CommandNames.boast]->messages.AddPointer(alert_messages[ByteAt(&h1ECDF)])
 menu_commands[CommandNames.cry]->values.AddValue(ByteAt(&h1ECF3))
 menu_commands[CommandNames.cry]->values.AddValue(ByteAt(&h1ED0C))
 menu_commands[CommandNames.cry]->messages.AddPointer(alert_messages[ByteAt(&h1ED22)])
 menu_commands[CommandNames.cover]->actors.AddPointer(actors[ByteAt(&h18F62)])
 menu_commands[CommandNames.cover]->actors.AddPointer(actors[ByteAt(&h18F66)])
 menu_commands[CommandNames.sneak]->values.AddValue(ByteAt(&h1E3F1))
 menu_commands[CommandNames.sneak]->values.AddValue(ByteAt(&h1E3F3))
 menu_commands[CommandNames.sneak]->values.AddValue(ByteAt(&h1E3F7))
 menu_commands[CommandNames.sneak]->values.AddValue(ByteAt(&h1E457))
 menu_commands[CommandNames.sneak]->messages.AddPointer(alert_messages[ByteAt(&h1E433)])
 menu_commands[CommandNames.sneak]->messages.AddPointer(alert_messages[ByteAt(&h1E43A)])
 menu_commands[CommandNames.sneak]->messages.AddPointer(alert_messages[ByteAt(&h1E4CA)])
 menu_commands[CommandNames.regen]->values.AddValue(ByteAt(&h1E5FE))
 menu_commands[CommandNames.regen]->freeze = iif(ByteAt(&h1E616) = 1 and ByteAt(&h1E624) = 0, false, true)
 menu_commands[CommandNames.regen]->messages.AddPointer(alert_messages[ByteAt(&h1E633)])
end sub
