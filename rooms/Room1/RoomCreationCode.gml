// Macros Definition
#macro TOTAL_GRID_HEIGHT  8
#macro TOTAL_GRID_WIDTH  15
#macro GRID_SIZE_HEIGHT  128
#macro GRID_SIZE_WIDTH   128
#macro TOTAL_GRID_CELL TOTAL_GRID_HEIGHT * TOTAL_GRID_WIDTH
#macro HALF_GRID_WIDTH (GRID_SIZE_WIDTH / 2)
#macro HALF_GRID_HEIGHT (GRID_SIZE_HEIGHT / 2)

global.snake_body_parts = ds_list_create();

// Initialization of grid start position
var _grid_start_x = 0;
var _grid_start_y = 0;
var _iy = 0;

// Coordinates of the center of the map
var _center_map_x = floor((TOTAL_GRID_WIDTH / 2) - 1);
var _center_map_y = TOTAL_GRID_HEIGHT / 2;

var _random_item_x = irandom(TOTAL_GRID_WIDTH -1);
var _random_item_y = irandom(TOTAL_GRID_HEIGHT -1);

while (_iy < TOTAL_GRID_HEIGHT) // O(n); linear
{
    for (var _i = 0; _i < TOTAL_GRID_WIDTH; _i++)
    {
        // Create a grid cell
        var inst = instance_create_layer(_grid_start_x, _grid_start_y, "layer_grid", obj_grid_cell);
		//show_debug_message("Random X: " + string(_random_item_x) + " Random Y: " + string(_random_item_y));

		if (_i == _random_item_x && _iy == _random_item_y)
		{
		    inst.cell_container= 1;
		    //show_debug_message("Set cell_containerto 1 for cell at X: " + string(_i) + " Y: " + string(_iy));
		}

        _grid_start_x += GRID_SIZE_WIDTH;

        // Check if it's the center position of the map and create the snake's head
        if (_i == _center_map_x && _iy == _center_map_y)
        {
            var _x_center = _grid_start_x + HALF_GRID_WIDTH;
            var _y_center = _grid_start_y + HALF_GRID_HEIGHT;
            instance_create_layer(_x_center, _y_center, "layer_snake", obj_head_snake);
        }

		// add the new collun of cells
        if (_i == TOTAL_GRID_WIDTH - 1)
        {
            _grid_start_y += GRID_SIZE_HEIGHT;
            _grid_start_x = 0;
            _iy++;
        }
    }
}



