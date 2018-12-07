sub FF4Rom.ReadFormations()
 dim start as Long
 dim finish as Long
 dim temp as Long
 dim p as Formation ptr
 dim e as AutoScriptEntry ptr
 for index as Integer = 0 to total_formations
  p = formations[index]
  start = &h70200 + index * 8
  p->mystery_flag(0) = bit(ByteAt(start), 0)
  p->mystery_flag(1) = bit(ByteAt(start), 1)
  p->mystery_flag(2) = bit(ByteAt(start), 2)
  p->back_attack = bit(ByteAt(start), 3)
  p->boss_death = bit(ByteAt(start), 4)
  p->egg(2) = bit(ByteAt(start), 5)
  p->egg(1) = bit(ByteAt(start), 6)
  p->egg(0) = bit(ByteAt(start), 7)
  p->monster_type(0) = monsters[ByteAt(start + 1)]
  p->monster_type(1) = monsters[ByteAt(start + 2)]
  p->monster_type(2) = monsters[ByteAt(start + 3)]
  p->summons = bit(ByteAt(start + 4), 0)
  p->transforms = bit(ByteAt(start + 4), 1)
  p->number_appearing(2) = (ByteAt(start + 4) \ 4) mod 4
  p->number_appearing(1) = (ByteAt(start + 4) \ &h10) mod 4
  p->number_appearing(0) = (ByteAt(start + 4) \ &h40) mod 4
  p->arrangement = ByteAt(start + 5)
  p->no_flee = bit(ByteAt(start + 6), 0)
  p->no_gameover = bit(ByteAt(start + 6), 1)
  p->battle_music = (ByteAt(start + 6) \ 4) mod 4
  p->character_battle = bit(ByteAt(start + 6), 4)
  p->auto_battle = bit(ByteAt(start + 6), 5)
  p->floating = bit(ByteAt(start + 6), 6)
  p->transparent = bit(ByteAt(start + 6), 7)
  p->cursor_style = ByteAt(start + 7)
 next
 for index as Integer = 0 to max_autobattles
  start = &hA000D
  p = formations[ByteAt(start + index * 2) + ByteAt(start + index * 2 + 1) * &h100]
  start = &hA001D
  temp = ByteAt(start + index * 2) + ByteAt(start + index * 2 + 1) * &h100 + &h90200
  finish = ByteAt(start + (index + 1) * 2) + ByteAt(start + (index + 1) * 2 + 1) * &h100 + &h90200
  do until temp >= finish or temp >= &hA0066
   if p->auto_battle_script.Size() > 0 then
    e = new AutoScriptEntry
    e->category = &hFF
    e->action = 0
    p->auto_battle_script.AddPointer(e)
   end if
   do until ByteAt(temp) = &hFF
    e = new AutoScriptEntry
    if ByteAt(temp) < &hC0 then
     e->category = ByteAt(temp)
     e->action = ByteAt(temp + 1)
    else
     e->category = AutoScriptCategories.menu_command
     e->action = ByteAt(temp) - &hC0
    end if
    p->auto_battle_script.AddPointer(e)
    temp += 2
   loop
   temp += 1
  loop
 next
end sub
