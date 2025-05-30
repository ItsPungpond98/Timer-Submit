scoreboard objectives add big_multiply dummy

scoreboard players set 10^4 big_multiply 10000
scoreboard players set 10^8 big_multiply 100000000

$scoreboard players set A big_multiply $(a)
$scoreboard players set B big_multiply $(b)

#Separating Blocks
scoreboard players operation ah big_multiply = A big_multiply
scoreboard players operation ah big_multiply /= 10^4 big_multiply

scoreboard players operation al big_multiply = A big_multiply
scoreboard players operation al big_multiply %= 10^4 big_multiply

scoreboard players operation bh big_multiply = B big_multiply
scoreboard players operation bh big_multiply /= 10^4 big_multiply

scoreboard players operation bl big_multiply = B big_multiply
scoreboard players operation bl big_multiply %= 10^4 big_multiply

#Calculations
#AB = ah * bh * 10^8 + (ah * bl + al * bh) * 10^4 + al * bl 

# ah * bh
scoreboard players operation rh big_multiply = ah big_multiply
scoreboard players operation rh big_multiply *= bh big_multiply

# ah * bl + al * bh
scoreboard players operation rm big_multiply = ah big_multiply
scoreboard players operation rm big_multiply *= bl big_multiply

scoreboard players operation rtemp big_multiply = al big_multiply
scoreboard players operation rtemp big_multiply *= bh big_multiply

scoreboard players operation rm big_multiply += rtemp big_multiply

# al * bl 
scoreboard players operation rl big_multiply = al big_multiply
scoreboard players operation rl big_multiply *= bl big_multiply

#Carry Overs
scoreboard players operation rtemp big_multiply = rm big_multiply
scoreboard players operation rtemp big_multiply /= 10^4 big_multiply
scoreboard players operation rh big_multiply += rtemp big_multiply

scoreboard players operation rtemp big_multiply = rl big_multiply
scoreboard players operation rtemp big_multiply /= 10^8 big_multiply
scoreboard players operation rh big_multiply += rtemp big_multiply

scoreboard players operation rtemp big_multiply = rl big_multiply
scoreboard players operation rtemp big_multiply /= 10^4 big_multiply
scoreboard players operation rm big_multiply += rtemp big_multiply

#Keep only 4 Digits
scoreboard players operation rm big_multiply %= 10^4 big_multiply
scoreboard players operation rl big_multiply %= 10^4 big_multiply

#Results
scoreboard players operation rlow big_multiply = rm big_multiply
scoreboard players operation rlow big_multiply *= 10^4 big_multiply
scoreboard players operation rlow big_multiply += rl big_multiply

scoreboard players operation rhigh big_multiply = rh big_multiply

#Store Results
execute store result storage timer:timesub BigMultiply.rhigh int 1 run scoreboard players get rhigh big_multiply
execute store result storage timer:timesub BigMultiply.rlow int 1 run scoreboard players get rlow big_multiply
#tellraw @a [{score:{name:"A", objective:"big_multiply"}, color:"white"}," x ", {score:{name:"B", objective:"big_multiply"}}, " = ", {storage:"timer:timesub", nbt:"BigMultiply.rhigh"}, {storage:"timer:timesub", nbt:"BigMultiply.rlow"}]

#Reset Everthing
scoreboard objectives remove big_multiply
