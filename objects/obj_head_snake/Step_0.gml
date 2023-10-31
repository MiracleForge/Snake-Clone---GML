
var keyToAngleDirectionMap = ds_map_create();

// Add keys and their corresponding values to the map
keyToAngleDirectionMap[? vk_left] = [180];
keyToAngleDirectionMap[? vk_right] = [0];
keyToAngleDirectionMap[? vk_up] = [90];
keyToAngleDirectionMap[? vk_down] = [270];

// Continuously check the direction keys
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);

if (transition_direction_time > 0)
{
    transition_direction_time--; // Continuously decrease
}
else
{
    // Call the function to update direction and angle
    updateDirectionAndAngle(keyToAngleDirectionMap);
}

// Check if the snake is moving
if (current_direction != -1) // -1 = no movement
{
    if (cell_transition_time < 0)
    {
        switch (current_direction)
        {
            case vk_left:
                x -= GRID_SIZE_WIDTH; // Move to the left
                break;
            case vk_right:
                x += GRID_SIZE_WIDTH; // Move to the right
                break;
            case vk_up:
                y -= GRID_SIZE_HEIGHT; // Move upwards
                break;
            case vk_down:
                y += GRID_SIZE_HEIGHT; // Move downwards
                break;
            default:
                x -= GRID_SIZE_WIDTH; // Move to the left
                break;
        }
        cell_transition_time = NORMAL_SPEED;
    }
    
    cell_transition_time--;
	update_position_body();
    move_wrap(true, false, GRID_SIZE_HEIGHT);
}



