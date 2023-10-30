/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();

if (grid_item != -1)
{
	draw_sprite(spr_apple, 0, x + HALF_GRID_WIDTH, y + HALF_GRID_HEIGHT);	
}

// No evento "Draw" das células do grid (obj_grid_cell)
if (global.body_party > 0) {
    var new_body_part_x = ds_list_find_value(global.snake_body_parts, ds_list_size(global.snake_body_parts) - 1)[0];
    var new_body_part_y = ds_list_find_value(global.snake_body_parts, ds_list_size(global.snake_body_parts) - 1)[1];
    var body_direction = ds_list_find_value(global.snake_body_parts, ds_list_size(global.snake_body_parts) - 1)[3];
    
    var opposite_cell_x, opposite_cell_y;

    // Determine a célula oposta com base na direção da cabeça
    switch (obj_head_snake.current_direction) {
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
  
        draw_sprite_ext(spr_body_snake, 0, new_body_part_x, new_body_part_y, 1, 1, body_direction, c_white, 1);
    
}


















