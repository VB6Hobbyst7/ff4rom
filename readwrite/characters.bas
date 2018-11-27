sub FF4Rom.ReadCharacters()
 dim start as Long
 dim level_ptr as Long
 dim p as Character ptr
 for index as Integer = 0 to total_characters
  p = characters[index]
  start = &h7AB00 + index * &h20
  p->initial_actor = actors[ByteAt(start) mod 2^5 - 1]
  p->left_handed = bit(ByteAt(start), 6)
  p->right_handed = bit(ByteAt(start), 7)
  p->job_link = jobs[ByteAt(start + 1) mod 2^4]
  p->level = ByteAt(start + 2)
  p->max_hp = ByteAt(start + 9) + ByteAt(start + 10) * &h100
  p->max_mp = ByteAt(start + 13) + ByteAt(start + 14) * &h100
  for i as Integer = 0 to 4
   p->stats(i) = ByteAt(start + 15 + i)
  next
  p->xp = ByteAt(start + &h17) + ByteAt(start + &h18) * &h100 + ByteAt(start + &h19) * &h10000
  p->tnl = ByteAt(start + &h1D) + ByteAt(start + &h1E) * &h100 + ByteAt(start + &h1F) * &h10000
  start = &h7B700 + (ByteAt(start) mod 2^5 - 1)  * 2
  level_ptr = &h70200 + ByteAt(start) + ByteAt(start + 1) * &h100 + (p->level - 1) * 5
  for i as Integer = p->level to 69
   p->levelups(i).stat_bonus.FromByte(ByteAt(level_ptr))
   p->levelups(i).hp_bonus = ByteAt(level_ptr + 1)
   p->levelups(i).mp_bonus = ByteAt(level_ptr + 2) mod 2^5
   p->levelups(i).tnl = ByteAt(level_ptr + 3) + ByteAt(level_ptr + 4) * &h100 + (ByteAt(level_ptr + 2) \ 2^5) * &h10000
   level_ptr += 5
  next
  for i as Integer = 0 to 7
   p->after70(i).FromByte(ByteAt(level_ptr + i))
  next
 next
end sub

sub FF4Rom.WriteCharacters()
 dim start as Long
 dim temp as UByte
 dim p as Character ptr
 dim level_ptr(total_characters) as Long
 for index as Integer = 0 to total_characters
  p = characters[index]
  start = &h7AB00 + index * &h20
  temp = actors.IndexOf(p->initial_actor) + 1
  if p->left_handed then temp = bitset(temp, 6)
  if p->right_handed then temp = bitset(temp, 7)
  WriteByte(start, temp)
  WriteByte(start + 1, jobs.IndexOf(p->job_link))
  WriteByte(start + 2, p->level)
  WriteByte(start + 7, p->max_hp mod &h100)
  WriteByte(start + 8, p->max_hp \ &h100)
  WriteByte(start + 9, p->max_hp mod &h100)
  WriteByte(start + 10, p->max_hp \ &h100)
  WriteByte(start + 11, p->max_mp mod &h100)
  WriteByte(start + 12, p->max_mp \ &h100)
  WriteByte(start + 13, p->max_mp mod &h100)
  WriteByte(start + 14, p->max_mp \ &h100)
  for i as Integer = 0 to 4
   WriteByte(start + 15 + i, p->stats(i))
  next
  WriteByte(start + &h17, p->xp mod &h100)
  WriteByte(start + &h18, (p->xp \ &h100) mod &h100)
  WriteByte(start + &h19, p->xp \ &h10000)
  WriteByte(start + &h1D, p->tnl mod &h100)
  WriteByte(start + &h1E, (p->tnl \ &h100) mod &h100)
  WriteByte(start + &h1F, p->tnl \ &h10000)
 next
 start = &h7B728
 for index as Integer = 0 to total_characters
  p = characters[index]
  level_ptr(index) = start - &h70200 - (p->level - 1) * 5
  for i as Integer = p->level to 69
   WriteByte(start, p->levelups(i).stat_bonus.ToByte())
   WriteByte(start + 1, p->levelups(i).hp_bonus)
   temp = p->levelups(i).mp_bonus
   temp += (p->levelups(i).tnl \ &h10000) * 2^5
   WriteByte(start + 2, temp)
   WriteByte(start + 3, p->levelups(i).tnl mod &h100)
   WriteByte(start + 4, p->levelups(i).tnl \ &h100)
   start += 5
  next
  for i as Integer = 0 to 7
   WriteByte(start + i, p->after70(i).ToByte())
  next
 next
 for index as Integer = 0 to total_actors
  start = &h7B700 + index * 2
  WriteByte(start, level_ptr(characters.IndexOf(actors[index]->character_link) mod &h100))
  WriteByte(start + 1, level_ptr(characters.IndexOf(actors[index]->character_link) \ &h100))
 next
end sub
