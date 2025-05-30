scoreboard objectives add big_add dummy

scoreboard players set 10^8 big_add 100000000

$scoreboard players set A big_add $(a)
$scoreboard players set B big_add $(b)

#Separating Blocks
scoreboard players operation ah big_add = A big_add
scoreboard players operation ah big_add /= 10^8 big_add

scoreboard players operation al big_add = A big_add
scoreboard players operation al big_add %= 10^8 big_add

scoreboard players operation bh big_add = B big_add
scoreboard players operation bh big_add /= 10^8 big_add

scoreboard players operation bl big_add = B big_add
scoreboard players operation bl big_add %= 10^8 big_add

#Adding
scoreboard players operation rh big_add = ah big_add
scoreboard players operation rh big_add += bh big_add

scoreboard players operation rl big_add = al big_add
scoreboard players operation rl big_add += bl big_add

#Carry Overs
scoreboard players operation rtemp big_add = rl big_add
scoreboard players operation rtemp big_add /= 10^8 big_add
scoreboard players operation rh big_add += rtemp big_add

scoreboard players operation rl big_add %= 10^8 big_add

#Return Results
execute store result storage timer:timesub BigAdd.rh int 1 run scoreboard players get rh big_add
execute store result storage timer:timesub BigAdd.rl int 1 run scoreboard players get rl big_add
#tellraw @a [{score:{name:"A", objective:"big_add"}, color:"white"}," + ", {score:{name:"B", objective:"big_add"}}, " = ", {storage:"timer:timesub", nbt:"BigAdd.rh"}, "* 10^8 + ", {storage:"timer:timesub", nbt:"BigAdd.rl"}]

#Reset Everthing
scoreboard objectives remove big_add
