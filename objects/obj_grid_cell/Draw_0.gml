/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
draw_self();
draw_text(x,y, cell_container);
var body_info = draw_body();
switch (cell_container)
{
    case APPLE:
        draw_sprite(spr_apple, 0, x + HALF_GRID_WIDTH, y + HALF_GRID_HEIGHT);
        break;

    case BODY:
        if (body_info[0] != -1 && body_info[1] != -1) {
            var new_body_part_x = body_info[0];
            var new_body_part_y = body_info[1];
            var body_direction = body_info[2];
            draw_sprite_ext(spr_body_snake, 0, new_body_part_x, new_body_part_y, 1, 1, body_direction, c_white, 1);
        }
        break;
}















