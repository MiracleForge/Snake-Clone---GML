// Função para atualizar a direção e o ângulo com base nas teclas pressionadas
function updateDirectionAndAngle(keyMap) {
    var lastKeyPressed = -1; // Inicialmente, nenhuma tecla foi pressionada

    var keyOrder = [vk_up, vk_right, vk_down, vk_left]; // Defina a ordem de verificação das teclas

    for (var i = 0; i < array_length(keyOrder); i++) {
        var key = keyOrder[i];
        if (keyboard_check(key) && transition_direction_time <= 0) {
            // Verifica se a tecla pressionada é oposta à última tecla
            if (key == vk_up && current_direction == vk_down) continue;
            if (key == vk_down && current_direction == vk_up) continue;
            if (key == vk_left && current_direction == vk_right) continue;
            if (key == vk_right && current_direction == vk_left) continue;
			transition_direction_time = DIRECT_TIME;
            lastKeyPressed = key;
            break; // Pare a verificação assim que uma tecla for pressionada
        }
    }

    // Define a direção e o ângulo com base na última tecla pressionada
    var values = ds_map_find_value(keyMap, lastKeyPressed);
    if (lastKeyPressed != -1) {
        current_direction = lastKeyPressed;
        image_angle = values[0]; // Defina image_angle com o valor associado à última tecla
    }
}
