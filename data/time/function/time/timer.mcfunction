# World Border Timer

#Get Current Border
execute store result score world_border_diameter timer run worldborder get
#Reset Shrink Rate
execute if score world_border_reset_timer timer matches 0 run function time:time/wbreset

#Get delta World Border
scoreboard players operation time_differential timer = world_border_diameter timer
scoreboard players operation time_differential timer -= previous_world_border_diameter timer

##Make Sure the second is constant
# Reset if worldborder is not in range
execute unless score world_border_diameter timer matches 59900000..59990000 run function time:time/wbreset

#If Time diff is too much, reset (bc of lag)
execute if score time_differential timer matches 1000.. run function time:time/wbreset

#If time diff is in [0, 999] and world border isn't too big (control range), add the diff to time (in ms)
execute if score time_differential timer matches 0..999 unless score world_border_diameter timer matches 59990000.. run scoreboard players operation time timer += time_differential timer

#Set prev value
execute if score world_border_reset_timer timer matches 000 run scoreboard players set previous_world_border_diameter timer 59900000
execute if score world_border_reset_timer timer matches 1.. run scoreboard players operation previous_world_border_diameter timer = world_border_diameter timer

#Reset World Borer Rate every 100 iterations (for stability)
scoreboard players add world_border_reset_timer timer 1
execute if score world_border_reset_timer timer matches 100.. run scoreboard players set world_border_reset_timer timer 0

#Calculate Data into a readable time
function time:time/calc