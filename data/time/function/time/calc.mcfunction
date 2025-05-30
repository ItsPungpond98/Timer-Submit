#Constants
scoreboard players set #3600 timer 3600
scoreboard players set #1000 timer 1000
scoreboard players set #600 timer 600
scoreboard players set #100 timer 100
scoreboard players set #60 timer 60
scoreboard players set #10 timer 10

#Scoreboard can be used for big timers / set timer
#Data objects can be used for tellraw

#Calculations
scoreboard players operation secs timer = time timer
scoreboard players operation secs timer /= #1000 timer

scoreboard players operation h timer = secs timer
scoreboard players operation h timer /= #3600 timer

scoreboard players operation tm timer = secs timer
scoreboard players operation tm timer %= #3600 timer
scoreboard players operation tm timer /= #600 timer

scoreboard players operation m timer = secs timer
scoreboard players operation m timer %= #600 timer
scoreboard players operation m timer /= #60 timer

scoreboard players operation ts timer = secs timer
scoreboard players operation ts timer %= #60 timer
scoreboard players operation ts timer /= #10 timer

scoreboard players operation s timer = secs timer
scoreboard players operation s timer %= #10 timer

scoreboard players operation tenth timer = time timer
scoreboard players operation tenth timer %= #1000 timer
scoreboard players operation tenth timer /= #100 timer

scoreboard players operation ms timer = time timer
scoreboard players operation ms timer %= #1000 timer

execute store result storage timer:timervalue h int 1 run scoreboard players get h timer
execute store result storage timer:timervalue tm int 1 run scoreboard players get tm timer
execute store result storage timer:timervalue m int 1 run scoreboard players get m timer
execute store result storage timer:timervalue ts int 1 run scoreboard players get ts timer
execute store result storage timer:timervalue s int 1 run scoreboard players get s timer
execute store result storage timer:timervalue tenth int 1 run scoreboard players get tenth timer
execute store result storage timer:timervalue ms int 1 run scoreboard players get ms timer

#Test Display
execute if score ms timer matches 000..009 run title @a actionbar [{storage:"timer:timervalue",nbt:"h"},":",{storage:"timer:timervalue",nbt:"tm"},{storage:"timer:timervalue",nbt:"m"},":",{storage:"timer:timervalue",nbt:"ts"},{storage:"timer:timervalue",nbt:"s"},".00",{storage:"timer:timervalue",nbt:"ms"}]
execute if score ms timer matches 010..099 run title @a actionbar [{storage:"timer:timervalue",nbt:"h"},":",{storage:"timer:timervalue",nbt:"tm"},{storage:"timer:timervalue",nbt:"m"},":",{storage:"timer:timervalue",nbt:"ts"},{storage:"timer:timervalue",nbt:"s"},".0",{storage:"timer:timervalue",nbt:"ms"}]
execute if score ms timer matches 100..999 run title @a actionbar [{storage:"timer:timervalue",nbt:"h"},":",{storage:"timer:timervalue",nbt:"tm"},{storage:"timer:timervalue",nbt:"m"},":",{storage:"timer:timervalue",nbt:"ts"},{storage:"timer:timervalue",nbt:"s"},".",{storage:"timer:timervalue",nbt:"ms"}]

