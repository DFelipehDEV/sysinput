/// sysinput_add_button(action, button)

var _action, _button;
_action = argument0;
_button = argument1 + 190; // We are offseting the button index to make it easier to distinguish it from a keyboard

ds_map_add(global._sysinputAction, _action, _button);
