// Function to update the direction and angle based on the keys pressed
function updateDirectionAndAngle(keyMap) 
{
    var lastKeyPressed = -1; // Initially, no key has been pressed

    var keyOrder = [vk_up, vk_right, vk_down, vk_left]; // Define the key checking order

    for (var i = 0; i < array_length(keyOrder); i++) 
    {
        var key = keyOrder[i];
        if (keyboard_check(key) && transition_direction_time <= 0) 
        {
            // Check if the pressed key is opposite to the last key
            if (key == vk_up && current_direction == vk_down) continue;
            if (key == vk_down && current_direction == vk_up) continue;
            if (key == vk_left && current_direction == vk_right) continue;
            if (key == vk_right && current_direction == vk_left) continue;
            transition_direction_time = DIRECT_TIME;
            lastKeyPressed = key;
            break; // Stop checking as soon as a key is pressed
        }
    }

    // Set the direction and angle based on the last key pressed
    var values = ds_map_find_value(keyMap, lastKeyPressed);
    if (lastKeyPressed != -1) 
    {
        current_direction = lastKeyPressed;
        image_angle = values[0]; // Set image_angle to the value associated with the last key
    }
}


function update_position_body() {
    var new_part_x, new_part_y; // Declare as variáveis fora do switch

    switch (current_direction) {
        case vk_left:
            new_part_x = x + GRID_SIZE_WIDTH; // Move to the left
            new_part_y = y;
            break;
        case vk_right:
            new_part_x = x - GRID_SIZE_WIDTH; // Move to the right
            new_part_y = y;
            break;
        case vk_up:
            new_part_x = x;
            new_part_y = y + GRID_SIZE_HEIGHT; // Move upwards
            break;
        case vk_down:
            new_part_x = x;
            new_part_y = y - GRID_SIZE_HEIGHT; // Move downwards
            break;
        default:
            new_part_x = x - GRID_SIZE_WIDTH; // Move to the left
            new_part_y = y;
            break;
    }

    ds_list_add(global.snake_body_parts, [new_part_x, new_part_y, current_direction, image_angle]);
}

