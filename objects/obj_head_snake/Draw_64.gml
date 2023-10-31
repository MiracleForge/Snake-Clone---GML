/// @description Inserir descrição aqui
// Você pode escrever seu código neste editor
var direction_text = "";

if (current_direction == 37) 
{
    direction_text = "Left";
} else if (current_direction == 38) 
{
    direction_text = "Up";
} else if (current_direction == 39) 
{
    direction_text = "Right";
} else if (current_direction == 40) 
{
    direction_text = "Down";
} else 
{
    direction_text = "Unknown Direction";
}

draw_rectangle_color(0, 0, 400, 140, c_black, c_blue, c_blue, c_blue,false);
draw_text(0, 0, "Current Direction is " + direction_text);
draw_text(0, 40, "Cell Transition Time: " + string(cell_transition_time));
draw_text(0, 80, "Transition Direction Time: " + string(transition_direction_time));
draw_text(0 , 120, "Number of parts: " + string(global.body_party));


















