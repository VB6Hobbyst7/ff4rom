type Stance
 pose(3) as UByte
end type

const total_stances = 15

enum PoseNames
 normal = 0
 parry
 walk
 crouch
 raise_right
 arm_out
 raise_left
 impact
 cheer
 lie
 chant1
 chant2
 special = &h24
end enum

enum StanceNames
 resting = 1
 parrying
 walking
 crouching
 attacking_right
 attacking_left
 wincing
 cheering
 lying
 chanting
 charging
 casting
 raising_left
 special1
 special2
end enum
