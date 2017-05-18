'This is a chart that represents which jobs can, for example, equip an item.

' Instead of each item having its own individual flags telling you who can
'  equip it, it references the index of an entry in a table of job
'  combinations.

type EquipChart

 flags(total_jobs) as Boolean

end type

'const total_equip_charts = 