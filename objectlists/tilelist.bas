type TileList extends List
 declare constructor(initial_size as Integer = 0)
 declare operator [](index as Long) as Tile ptr
 declare function IndexOf(p as Any ptr) as Integer
end type

constructor TileList(initial_size as Integer = 0)
 dim p as Tile ptr
 if initial_size > 0 then
  for i as Integer = 0 to initial_size
   p = new Tile
   AddPointer(p)
  next
 end if
end constructor

operator TileList.[](index as Long) as Tile ptr
 return cptr(Tile ptr, PointerAt(index + 1))
end operator

function TileList.IndexOf(p as Any ptr) as Integer
 return IndexOfPointer(p) - 1
end function
