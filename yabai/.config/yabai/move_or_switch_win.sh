# move_or_switch.sh
#!/bin/bash

# Get the current window ID
current_window=$(yabai -m query --windows --window | jq -r '.id')
# Get the current space ID
current_space=$(yabai -m query --spaces --space | jq -r '.id')
# Get the number of spaces
space_count=$(yabai -m query --spaces | jq 'length')

# Check if the current window is at the rightmost space
if [ $(yabai -m query --windows --window $current_window | jq '.space') -eq $space_count ]; then
	# If it's at the rightmost space, move to the next desktop
	yabai -m space --focus next || yabai -m space --focus first
else
	# Otherwise, move the window to the right
	yabai -m window --warp east || yabai -m window --warp west
fi
