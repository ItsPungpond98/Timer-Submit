# Get time
execute store result score world_border_diameter timer run worldborder get

scoreboard players operation time_differential timer = world_border_diameter timer
scoreboard players operation time_differential timer -= previous_world_border_diameter timer

execute if score time_differential timer matches 0..999 run scoreboard players operation time timer += time_differential timer

scoreboard players operation previous_world_border_diameter timer = world_border_diameter timer