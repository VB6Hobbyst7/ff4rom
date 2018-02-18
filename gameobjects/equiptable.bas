'This is a table that represents which jobs can, for example, equip an item.

'Instead of each item having its own individual flags telling you who can
'equip it, it references the index of an entry in a list of job
'combinations.

type EquipTable

 jobs as Set
 
end type

const total_equip_tables = 31

