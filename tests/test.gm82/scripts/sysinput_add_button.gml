/// sysinput_add_button(action, button)

var _action, _button;
_action = argument0;
_button = argument1 + 256; // We are offseting the button index to make it easier to distinguish it from a keyboard

sysinput_add_key(_action, _button);
