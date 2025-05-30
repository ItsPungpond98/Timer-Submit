scoreboard objectives add hscalc dummy

scoreboard players set .9817 hscalc 9817
scoreboard players set .2487 hscalc 2487
$scoreboard players set .mapid hscalc $(map_id)

$scoreboard players set .h hscalc $(h)
$scoreboard players set .tm hscalc $(tm)
$scoreboard players set .m hscalc $(m)
$scoreboard players set .ts hscalc $(ts)
$scoreboard players set .s hscalc $(s)
$scoreboard players set .tenth hscalc $(tenth)

#Convert To Time Code
scoreboard players set .10 hscalc 10
scoreboard players set .100 hscalc 100
scoreboard players set .1000 hscalc 1000
scoreboard players set .10000 hscalc 10000
scoreboard players set .100000 hscalc 100000

scoreboard players set .timecode hscalc 0
scoreboard players set .temp hscalc 0

scoreboard players operation .temp hscalc = .h hscalc
scoreboard players operation .temp hscalc *= .100000 hscalc
scoreboard players operation .timecode hscalc += .temp hscalc

scoreboard players operation .temp hscalc = .tm hscalc
scoreboard players operation .temp hscalc *= .10000 hscalc
scoreboard players operation .timecode hscalc += .temp hscalc

scoreboard players operation .temp hscalc = .m hscalc
scoreboard players operation .temp hscalc *= .1000 hscalc
scoreboard players operation .timecode hscalc += .temp hscalc

scoreboard players operation .temp hscalc = .ts hscalc
scoreboard players operation .temp hscalc *= .100 hscalc
scoreboard players operation .timecode hscalc += .temp hscalc

scoreboard players operation .temp hscalc = .s hscalc
scoreboard players operation .temp hscalc *= .10 hscalc
scoreboard players operation .timecode hscalc += .temp hscalc

scoreboard players operation .temp hscalc = .tenth hscalc
scoreboard players operation .timecode hscalc += .temp hscalc

#Add special code
scoreboard players operation .temp hscalc = .mapid hscalc
scoreboard players operation .temp hscalc *= .2487 hscalc

scoreboard players operation .mapid hscalc *= .9817 hscalc

scoreboard players operation .timecode hscalc += .temp hscalc

#Set data
data modify storage timer:timesub calctemp set value {"cmap": 0, "ctime": 0}
execute store result storage timer:timesub calctemp.ctime int 1 run scoreboard players get .timecode hscalc
execute store result storage timer:timesub calctemp.cmap int 1 run scoreboard players get .mapid hscalc

function time:timesub/v1/displaylink with storage timer:timesub calctemp