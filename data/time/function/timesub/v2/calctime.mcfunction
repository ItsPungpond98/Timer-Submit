#Create Scoreboard
scoreboard objectives add hscalc dummy

#Constants
scoreboard players set 10 hscalc 10
scoreboard players set 10^2 hscalc 100
scoreboard players set 10^3 hscalc 1000
scoreboard players set 10^4 hscalc 10000
scoreboard players set 10^5 hscalc 100000

#Get Data
$scoreboard players set mapid hscalc $(map_id)

$scoreboard players set h hscalc $(h)
$scoreboard players set tm hscalc $(tm)
$scoreboard players set m hscalc $(m)
$scoreboard players set ts hscalc $(ts)
$scoreboard players set s hscalc $(s)
$scoreboard players set tenth hscalc $(tenth)

#Calculate Time Code (hmmsss format)
scoreboard players operation temp hscalc = h hscalc
scoreboard players operation temp hscalc *= 10^5 hscalc
scoreboard players operation timecode hscalc += temp hscalc

scoreboard players operation temp hscalc = tm hscalc
scoreboard players operation temp hscalc *= 10^4 hscalc
scoreboard players operation timecode hscalc += temp hscalc

scoreboard players operation temp hscalc = m hscalc
scoreboard players operation temp hscalc *= 10^3 hscalc
scoreboard players operation timecode hscalc += temp hscalc

scoreboard players operation temp hscalc = ts hscalc
scoreboard players operation temp hscalc *= 10^2 hscalc
scoreboard players operation timecode hscalc += temp hscalc

scoreboard players operation temp hscalc = s hscalc
scoreboard players operation temp hscalc *= 10 hscalc
scoreboard players operation timecode hscalc += temp hscalc

scoreboard players operation temp hscalc = tenth hscalc
scoreboard players operation timecode hscalc += temp hscalc

#Do Multiplication
execute store result storage timer:timesub BigMultiply.a int 1 run scoreboard players get timecode hscalc
execute store result storage timer:timesub BigMultiply.b int 113 run scoreboard players get mapid hscalc

function time:math/bigmultiply with storage timer:timesub BigMultiply

#Add Noise Value
data modify storage timer:timesub BigAdd.a set from storage timer:timesub BigMultiply.rlow
execute store result storage timer:timesub BigAdd.b int 2487 run scoreboard players get mapid hscalc

function time:math/bigadd with storage timer:timesub BigAdd

#Finishing Touches
execute store result score timecodeh hscalc run data get storage timer:timesub BigMultiply.rhigh 1
execute store result score timecodel hscalc run data get storage timer:timesub BigAdd.rl 1

execute store result score addtemp hscalc run data get storage timer:timesub BigAdd.rh 1
scoreboard players operation timecodeh hscalc += addtemp hscalc
scoreboard players operation timecodeh hscalc += 10^3 hscalc
scoreboard players operation timecodeh hscalc += 10^3 hscalc

#Display Links
execute store result storage timer:timesub calctemp.mapcode int 9817 run scoreboard players get mapid hscalc
execute store result storage timer:timesub calctemp.timecodeh int 1 run scoreboard players get timecodeh hscalc
execute store result storage timer:timesub calctemp.timecodel int 1 run scoreboard players get timecodel hscalc

function time:timesub/v2/displaylink with storage timer:timesub calctemp

#Reset Everything!
scoreboard objectives remove hscalc
data remove storage timer:timesub calctemp