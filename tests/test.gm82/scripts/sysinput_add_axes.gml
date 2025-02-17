/// sysinput_add_axes(action, axe, negative)

var _action, _axe, _negative;
_action = argument0;
_axe = argument1 + 288; // We are offseting the axis index to make it easier to distinguish it from a keyboard
_negative = argument2;

if (!_negative)
    sysinput_add_key(_action, _axe);
else
    sysinput_add_key(_action, _axe + 4);
