type WeaponList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Weapon ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor WeaponList(initial_size as Integer = 0)
 dim p as Weapon ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Weapon
   AddPointer(p)
  next
 end if
end constructor

operator WeaponList.[](index as Long) as Weapon ptr
 return cptr(Weapon ptr, PointerAt(index + 1))
end operator

function WeaponList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function
