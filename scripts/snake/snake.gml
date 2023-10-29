// Função para atualizar a direção e o ângulo com base nas teclas pressionadas
function updateDirectionAndAngle(keyMap) {
    var lastKeyPressed = -1; // Inicialmente, nenhuma tecla foi pressionada

    var keyOrder = [vk_up, vk_right, vk_down, vk_left]; // Defina a ordem de verificação das teclas

    for (var i = 0; i < array_length(keyOrder); i++) {
        var key = keyOrder[i];
        if (keyboard_check(key)) {
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

