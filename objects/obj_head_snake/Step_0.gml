// Verifica as teclas de direção continuamente
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);

// Define a direção e a imagem com base nas teclas pressionadas
if (left)
{
    current_direction = 180;
    image_angle = 180;
}
else if (right)
{
    current_direction = 0;
    image_angle = 0;
}
else if (up)
{
    current_direction = 90;
    image_angle = 90;
}
else if (down)
{
    current_direction = 270;
    image_angle = 270;
}

// Verifica se a cobra está se movendo
if (current_direction != -1)
{
    if (cell_transition_time < 0)
    {
        if (current_direction == 180)
        {
            x -= GRID_SIZE_WIDTH; // Mova para a esquerda
        }
        else if (current_direction == 0)
        {
            x += GRID_SIZE_WIDTH; // Mova para a direita
        }
        else if (current_direction == 90)
        {
            y -= GRID_SIZE_HEIGHT; // Mova para cima
        }
        else if (current_direction == 270)
        {
            y += GRID_SIZE_HEIGHT; // Mova para baixo
        }

        cell_transition_time = NORMAL_SPEED;
    }
    cell_transition_time--;
}





