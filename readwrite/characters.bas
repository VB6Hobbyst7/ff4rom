sub FF4Rom.ReadCharacters()

 dim start as Integer
 dim level_ptr as Integer
 dim actor_index as UByte
 
 for i as Integer = 0 to total_characters
 
  start = &h7AB00 + i * &h20
  actor_index = ByteAt(start) mod 2^5 - 1
  characters(i)->initial_actor = actors(actor_index) 'Bit 5 appears to be unused
  characters(i)->left_handed = bit(ByteAt(start), 6)
  characters(i)->right_handed = bit(ByteAt(start), 7)
  characters(i)->job_link = jobs(ByteAt(start + 1) mod 2^4) 'The other bits appear to be unused
  characters(i)->level = ByteAt(start + 2)
  characters(i)->max_hp = ByteAt(start + 9) + ByteAt(start + 10) * &h100
  characters(i)->max_mp = ByteAt(start + 13) + ByteAt(start + 14) * &h100
  for j as Integer = 0 to 4
   characters(i)->stats(j) = ByteAt(start + 15 + j)
  next
  characters(i)->xp = ByteAt(start + &h17) + ByteAt(start + &h18) * &h100 + ByteAt(start + &h19) * &h10000
  characters(i)->tnl = ByteAt(start + &h1D) + ByteAt(start + &h1E) * &h100 + ByteAt(start + &h1F) * &h10000
 
  start = &h7B700 + actor_index * 2
  
  level_ptr = &h70200 + ByteAt(start) + ByteAt(start + 1) * &h100 + (characters(i)->level - 1) * 5
  for j as Integer = characters(i)->level to 69
   characters(i)->levelups(j).stat_bonus.amount = ByteAt(level_ptr) mod 2^3
   for k as Integer = 0 to 4
    characters(i)->levelups(j).stat_bonus.stats(4 - k) = iif(ByteAt(level_ptr) and 2^(k + 3), true, false)
   next
   characters(i)->levelups(j).hp_bonus = ByteAt(level_ptr + 1)
   characters(i)->levelups(j).mp_bonus = ByteAt(level_ptr + 2) mod 2^5
   characters(i)->levelups(j).tnl = ByteAt(level_ptr + 3) + ByteAt(level_ptr + 4) * &h100 + (ByteAt(level_ptr + 2) \ 2^5) * &h10000
   level_ptr += 5
  next
  
  for j as Integer = 0 to 7
   characters(i)->after70(j).amount = ByteAt(level_ptr) mod 2^3
   for k as Integer = 0 to 4
    characters(i)->after70(j).stats(4 - k) = iif(ByteAt(level_ptr) and 2^(k + 3), true, false)
   next
   level_ptr += 1
  next
 
 next

end sub


sub FF4Rom.WriteCharacters()

 dim start as Integer
 dim temp as UByte
 dim level_ptr(total_characters) as Integer
 
 for i as Integer = 0 to total_characters
 
  start = &h7AB00 + i * &h20
  temp = IndexOfActor(characters(i)->initial_actor) + 1
  if characters(i)->left_handed then temp = bitset(temp, 6)
  if characters(i)->right_handed then temp = bitset(temp, 7)
  WriteByte(start, temp)
  WriteByte(start + 1, IndexOfJob(characters(i)->job_link))
  WriteByte(start + 2, characters(i)->level)
  WriteByte(start + 7, characters(i)->max_hp mod &h100) 'Starting HP should be
  WriteByte(start + 8, characters(i)->max_hp \ &h100)   ' equal to max HP
  WriteByte(start + 9, characters(i)->max_hp mod &h100)
  WriteByte(start + 10, characters(i)->max_hp \ &h100)
  WriteByte(start + 11, characters(i)->max_mp mod &h100) 'Starting MP should be
  WriteByte(start + 12, characters(i)->max_mp \ &h100)   ' equal to max MP
  WriteByte(start + 13, characters(i)->max_mp mod &h100)
  WriteByte(start + 14, characters(i)->max_mp \ &h100)
  for j as Integer = 0 to 4
   WriteByte(start + 15 + j, characters(i)->stats(j))
  next
  WriteByte(start + &h17, characters(i)->xp mod &h100)
  WriteByte(start + &h18, (characters(i)->xp \ &h100) mod &h100)
  WriteByte(start + &h19, characters(i)->xp \ &h10000)
  WriteByte(start + &h1D, characters(i)->tnl mod &h100)
  WriteByte(start + &h1E, (characters(i)->tnl \ &h100) mod &h100)
  WriteByte(start + &h1F, characters(i)->tnl \ &h10000)
 
 next
 
 start = &h7B728

 for i as Integer = 0 to total_characters
  level_ptr(i) = start - &h70200 - (characters(i)->level - 1) * 5
  for j as Integer = characters(i)->level to 69
   temp = characters(i)->levelups(j).stat_bonus.amount
   for k as Integer = 0 to 4
    if characters(i)->levelups(j).stat_bonus.stats(4 - k) then temp = bit(temp, 3 + k)
   next
   WriteByte(start, temp)
   WriteByte(start + 1, characters(i)->levelups(j).hp_bonus)
   temp = characters(i)->levelups(j).mp_bonus
   temp += (characters(i)->levelups(j).tnl \ &h10000) * 2^5
   WriteByte(start + 2, temp)
   WriteByte(start + 3, characters(i)->levelups(j).tnl mod &h100)
   WriteByte(start + 4, (characters(i)->levelups(j).tnl \ &h100) mod &h100)
   start += 5
  next
  for j as Integer = 0 to 7
   temp = characters(i)->after70(j).amount
   for k as Integer = 0 to 4
    if characters(i)->after70(j).stats(4 - k) then temp = bit(temp, 3 + k)
   next
   WriteByte(start, temp)
   start += 1
  next
 next
 
 'start = &h7B700
 'for i as Integer = 0 to total_actors
  'WriteByte(start + i * 2, level_ptr(actors(i).level_link) mod &h100)
  'WriteByte(start + i * 2 + 1, level_ptr(actors(i).level_link) \ &h100)
 'next

end sub

