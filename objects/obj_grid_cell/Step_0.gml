if (grid_item != -1) {
    if (place_meeting(x, y, obj_head_snake)) {
        image_blend = c_red;
        grid_item = -1;
        global.body_party++;
    }
}


if (grid_item == -1) {
    // Variável de controle para evitar repetições
    var grid_item_already_set = false;

    // Verifique se grid_item já foi definido como 1 em alguma instância
    if (instance_exists(obj_grid_cell)) {
        with (obj_grid_cell) {
            if (grid_item == 1) {
                grid_item_already_set = true;
                break;
            }
        }
    }

    // Se grid_item ainda não estiver definido como 1 em nenhuma instância, defina-o aleatoriamente
    if (!grid_item_already_set) {
        var i = irandom(instance_number(obj_grid_cell) - 1); // Escolhe um valor de i aleatoriamente
        var count = 0;

        // Apenas uma instância deve ser ativada
        if (count == i) {
            //instance_activate_object(self);
            grid_item = 1;
        }
        count += 1;
    }
}


