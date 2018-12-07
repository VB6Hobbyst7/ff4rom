sub FF4Rom.ReadMonsters()
 dim start as Long
 dim p as Monster ptr
 dim address as Long
 for index as Integer = 0 to total_monsters
  p = monsters[index]
  start = &h71A00 + index * 8
  for i as Integer = 0 to 7
   p->name += chr(ByteAt(start + i))
  next
  start = &h72200 + index * 2
  p->gil = ByteAt(start) + ByteAt(start + 1) * &h100
  start = &h723C0 + index * 2
  p->xp = ByteAt(start) + ByteAt(start + 1) * &h100
  start = &h7CC00 + index * 4
  p->size = ByteAt(start)
  p->colors = ByteAt(start + 1)
  p->sprite1 = ByteAt(start + 2)
  p->sprite2 = ByteAt(start + 3)
  address = &h728A0 + index * 2
  start = ByteAt(address) + ByteAt(address + 1) * &h100 - &hA860 + &h72A60
  p->boss = bit(ByteAt(start), 7)
  p->level = ByteAt(start) mod &h80
  p->hp = ByteAt(start + 1) + ByteAt(start + 2) * &h100
  p->physical_attack = stat_tables[ByteAt(start + 3)]
  p->physical_defense = stat_tables[ByteAt(start + 4)]
  p->magic_defense = stat_tables[ByteAt(start + 5)]
  p->speed = speed_tables[ByteAt(start + 6)]
  p->drop_table = drop_tables[ByteAt(start + 7) mod &h40]
  p->drop_rate = ByteAt(start + 7) \ &h40
  p->main_ai = ais[ByteAt(start + 8)]
  p->has_attack_attributes = bit(ByteAt(start + 9), 7)
  p->has_resistances = bit(ByteAt(start + 9), 6)
  p->has_weaknesses = bit(ByteAt(start + 9), 5)
  p->has_spell_power = bit(ByteAt(start + 9), 4)
  p->has_race = bit(ByteAt(start + 9), 3)
  p->has_reaction = bit(ByteAt(start + 9), 2)
  start += 10
  if p->has_attack_attributes then
   p->attack_attributes.FromBytes(ByteAt(start), ByteAt(start + 1), ByteAt(start + 2))
   start += 3
  end if
  if p->has_resistances then
   p->resistances.FromBytes(ByteAt(start), ByteAt(start + 1), ByteAt(start + 2))
   start += 3
  end if
  if p->has_weaknesses then
   p->weaknesses.FromBytes(ByteAt(start), 0, 0)
   start += 1
  end if
  if p->has_spell_power then
   p->spell_power = ByteAt(start)
   start += 1
  end if
  if p->has_race then
   for i as Integer = 0 to 7
    p->races(i) = bit(ByteAt(start), i)
   next
   start += 1
  end if
  if p->has_reaction then
   p->reaction = ais[ByteAt(start)]
   start += 1
  end if
 next
end sub
