if (cell_container!= -1) {
    if (place_meeting(x, y, obj_head_snake)) {
        image_blend = c_red;
        cell_container= -1;
        global.body_party++;
    }
}


if (cell_container== -1) {
    // Variável de controle para evitar repetições
    var grid_item_already_set = false;

    // Verifique se cell_containerjá foi definido como 1 em alguma instância
    if (instance_exists(obj_grid_cell)) {
        with (obj_grid_cell) {
            if (cell_container== APPLE) {
                grid_item_already_set = true;
                break;
            }
        }
    }

    // Se cell_containerainda não estiver definido como 1 em nenhuma instância, defina-o aleatoriamente
    if (!grid_item_already_set) {
        var i = irandom(instance_number(obj_grid_cell) - 1); // Escolhe um valor de i aleatoriamente
        var count = 0;

        // Apenas uma instância deve ser ativada
        if (count == i) {
            //instance_activate_object(self);
            cell_container= APPLE;
        }
        count += 1;
    }
}


