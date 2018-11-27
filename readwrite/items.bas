sub FF4Rom.ReadItems()
 dim start as Long
 dim index as Integer
 dim supply_ptr as Supply ptr
 dim armor_ptr as Armor ptr
 dim weapon_ptr as Weapon ptr
 dim tool_ptr as Tool ptr
 dim item_ptr as Item ptr
 descriptions_range.SetRange(ByteAt(&hA9BB), ByteAt(&hA9BF))
 weapons_range.SetRange(0, &h5F)
 armors_range.SetRange(&h60, &hAF)
 supplies_range.SetRange(&hB0, &hDD)
 tools_range.SetRange(&hDE, &hFF)
 two_handed_range.SetRange(ByteAt(&hC22B), ByteAt(&hC1BE) - 1)
 bow_range.SetRange(ByteAt(&hC1BE), ByteAt(&hC286) - 1)
 arrow_range.SetRange(ByteAt(&hC286), ByteAt(&hC287))
 hand_range.SetRange(armors_range.start + 1, ByteAt(&hC1DC) - 1)
 head_range.SetRange(ByteAt(&hC1DC), ByteAt(&hC1D2) - 1)
 body_range.SetRange(ByteAt(&hC1D2), ByteAt(&hC1D7) - 1)
 arms_range.SetRange(ByteAt(&hC1D7), ByteAt(&hC1D8))
 key_item_range.SetRange(ByteAt(&hCB30), total_items)
 for i as Integer = 0 to total_items
  if supplies_range.InRange(i) then
   supply_ptr = new Supply
   supplies.AddPointer(supply_ptr)
   item_ptr = supply_ptr
   index = i - supplies_range.start
   start = &h79880 + index * 6
   supply_ptr->delay = ByteAt(start) mod &h20
   supply_ptr->target = ByteAt(start) \ &h20
   supply_ptr->power = ByteAt(start + 1)
   supply_ptr->boss = not bit(ByteAt(start + 2), 7)
   supply_ptr->hit = ByteAt(start + 2) mod &h80
   supply_ptr->impact = bit(ByteAt(start + 3), 7)
   supply_ptr->effect = ByteAt(start + 3) mod &h80
   supply_ptr->damage = not bit(ByteAt(start + 4), 7)
   supply_ptr->attributes = attribute_tables[ByteAt(start + 4) mod &h80]
   supply_ptr->reflectable = not bit(ByteAt(start + 5), 7)
   supply_ptr->mp_cost = ByteAt(start + 5) mod &h80
   supply_ptr->visual = ByteAt(&h7D790 + index)
  elseif armors_range.InRange(i) then
   armor_ptr = new Armor
   armors.AddPointer(armor_ptr)
   item_ptr = armor_ptr
   index = i - armors_range.start
   start = &h79600 + index * 8
   armor_ptr->magnetic = bit(ByteAt(start), 7)
   armor_ptr->magic_evade = ByteAt(start) mod &h80
   armor_ptr->defense = ByteAt(start + 1)
   armor_ptr->evade = ByteAt(start + 2)
   armor_ptr->magic_defense = ByteAt(start + 3)
   armor_ptr->attributes = attribute_tables[ByteAt(start + 4) mod &h40]
   for j as Integer = 0 to 7
    armor_ptr->races(j) = bit(ByteAt(start + 5), j)
   next
   armor_ptr->equip = equip_tables[ByteAt(start + 6) mod &h20]
   armor_ptr->stat_bonus.amount = ByteAt(start + 7) mod 8
   for j as Integer = 0 to 4
    armor_ptr->stat_bonus.stats(4 - j) = bit(ByteAt(start + 7), j + 3)
   next
  elseif weapons_range.InRange(i) then
   weapon_ptr = new Weapon
   weapons.AddPointer(weapon_ptr)
   item_ptr = weapon_ptr
   start = &h79300 + i * 8
   for j as Integer = 0 to 7
    weapon_ptr->properties(j) = bit(ByteAt(start), j)
   next
   weapon_ptr->attack = ByteAt(start + 1)
   weapon_ptr->hit = ByteAt(start + 2) mod &h80
   weapon_ptr->casts = spells[ByteAt(start + 3)]
   weapon_ptr->attributes = attribute_tables[ByteAt(start + 4)]
   for j as Integer = 0 to 7
    weapon_ptr->races(j) = bit(ByteAt(start + 5), j)
   next
   weapon_ptr->equip = equip_tables[ByteAt(start + 6) mod &h20]
   weapon_ptr->ranged = bit(ByteAt(start + 6), 6)
   weapon_ptr->throwable = bit(ByteAt(start + 6), 7)
   weapon_ptr->stat_bonus.amount = ByteAt(start + 7) mod 8
   for j as Integer = 0 to 4
    weapon_ptr->stat_bonus.stats(4 - j) = bit(ByteAt(start + 7), j + 3)
   next
   start = &h7A010 + i * 4
   weapon_ptr->colors = ByteAt(start)
   weapon_ptr->sprite = ByteAt(start + 1)
   weapon_ptr->slash = ByteAt(start + 2)
   weapon_ptr->swing = ByteAt(start + 3)
   weapon_ptr->spell_power = ByteAt(&h79270 + i)
   weapon_ptr->spell_visual = spells[ByteAt(&h7D6E0 + i)]
  else
   tool_ptr = new Tool
   tools.AddPointer(tool_ptr)
   item_ptr = tool_ptr
  end if
  items.AddPointer(item_ptr)
  if descriptions_range.InRange(i) then
   item_ptr->description = descriptions[ByteAt(&h7B000 + i - descriptions_range.start)]
  end if
  for j as Integer = 0 to 8
   item_ptr->name += chr(ByteAt(&h78200 + i * 9 + j))
  next
  item_ptr->price = ByteAt(&h7A650 + i)
 next
end sub
