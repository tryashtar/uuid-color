$data modify entity @s CustomName set value {text:"⬤#$(red)$(green)$(blue)","color":"#$(red)$(green)$(blue)"}
data modify entity @s CustomNameVisible set value 1b
attribute @s waypoint_transmit_range modifier add uuid-color:mob 10 add_value
waypoint modify @s fade 5 1 10 0
