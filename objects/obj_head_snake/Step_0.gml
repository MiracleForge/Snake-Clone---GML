// Crie um mapa para mapear as teclas para os valores de ângulo e direção
var keyToAngleDirectionMap = ds_map_create();

// Adicione as teclas e seus valores correspondentes ao mapa
 keyToAngleDirectionMap[? vk_left] = [180];
 keyToAngleDirectionMap[? vk_right] = [0];
 keyToAngleDirectionMap[? vk_up] = [90];
 keyToAngleDirectionMap[? vk_down] = [270];

// Verifica as teclas de direção continuamente
left = keyboard_check(vk_left);
right = keyboard_check(vk_right);
up = keyboard_check(vk_up);
down = keyboard_check(vk_down);

// Chame a função para atualizar a direção e o ângulo
updateDirectionAndAngle(keyToAngleDirectionMap);

// Verifica se a cobra está se movendo
if (current_direction != -1)
{
	if (cell_transition_time < 0)
    {
	switch (current_direction)
	{
	    case vk_left:
	        x -= GRID_SIZE_WIDTH; // Mova para a esquerda
	        break;
		case vk_right:
	        x += GRID_SIZE_WIDTH; // Mova para a direita
	        break;
		case vk_up:
	        y -= GRID_SIZE_HEIGHT; // Mova para cima
	        break;
		case vk_down:
	        y += GRID_SIZE_HEIGHT; // Mova para baixo
	        break;
	    default:
	        x -= GRID_SIZE_WIDTH; // Mova para a esquerda
	        break;
	}
	cell_transition_time = NORMAL_SPEED;
	}
	
cell_transition_time--;
move_wrap(true, false, GRID_SIZE_HEIGHT );

}
