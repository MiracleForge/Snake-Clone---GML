if (grid_item != -1) 
{
    if (place_meeting(x, y, obj_head_snake)) {
        image_blend = c_red;
		grid_item = -1;

    }
}

if (grid_item == -1)
{
    // Verifique se grid_item já foi definido como 1 em alguma instância
    var grid_item_already_set = false;

    for (var j = 0; j < instance_number(obj_grid_cell); j++) {
        var inst = instance_find(obj_grid_cell, j);

        if (inst != noone && inst.grid_item == 1) {
            grid_item_already_set = true;
            break;
        }
    }

    // Se grid_item ainda não estiver definido como 1 em nenhuma instância, defina-o aleatoriamente
    if (!grid_item_already_set) {
        var i = irandom(instance_number(obj_grid_cell) - 1); // Escolhe um valor de i aleatoriamente

        for (var j = 0; j < instance_number(obj_grid_cell); j++) {
            var inst = instance_find(obj_grid_cell, j);

            if (inst != noone) {
                if (j == i) {
					instance_activate_object(inst);
                    inst.grid_item = 1; // Modifica a variável apenas para a instância com o valor de j igual a i
                }
            }
        }
    }
}















