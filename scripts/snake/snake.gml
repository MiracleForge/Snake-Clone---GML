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

    ds_list_add(global.snake_body_parts, [new_part_x, new_part_y, image_angle]);
}

function draw_body() 
{
    var body_info = [-1, -1, -1]; // Valores padrão, caso não haja partes do corpo
    if (global.body_party > 0) 
    {
        var num_body_parts = ds_list_size(global.snake_body_parts);
        if (num_body_parts > 0) 
        {
            var new_body_part_x = ds_list_find_value(global.snake_body_parts, num_body_parts - 1)[0];
            var new_body_part_y = ds_list_find_value(global.snake_body_parts, num_body_parts - 1)[1];
            var body_direction = ds_list_find_value(global.snake_body_parts, num_body_parts - 1)[2];
            body_info = [new_body_part_x, new_body_part_y, body_direction];
            var opposite_cell_x, opposite_cell_y;

            // Determine a célula oposta com base na direção da cabeça
            switch (obj_head_snake.current_direction) 
            {
                case vk_up:
                    opposite_cell_x = new_body_part_x;
                    opposite_cell_y = new_body_part_y + GRID_SIZE_HEIGHT;
                    break;
                case vk_down:
                    opposite_cell_x = new_body_part_x;
                    opposite_cell_y = new_body_part_y - GRID_SIZE_HEIGHT;
                    break;
                case vk_left:
                    opposite_cell_x = new_body_part_x + GRID_SIZE_WIDTH;
                    opposite_cell_y = new_body_part_y;
                    break;
                case vk_right:
                    opposite_cell_x = new_body_part_x - GRID_SIZE_WIDTH;
                    opposite_cell_y = new_body_part_y;
                    break;
                // Outras direções e tratamentos caso necessário
            }
            draw_text(0, 180, opposite_cell_x);
            draw_text(0, 220, opposite_cell_y);
        
            if (x == new_body_part_x - HALF_GRID_WIDTH && y == new_body_part_y - HALF_GRID_HEIGHT) 
            {
                cell_container = BODY;
            }
            if (cell_container != -1 && cell_container == BODY && x != new_body_part_x - HALF_GRID_WIDTH && y != new_body_part_y - HALF_GRID_HEIGHT)
            {
                cell_container = -1;	
            }
        }
    }
    
    return body_info;
}


