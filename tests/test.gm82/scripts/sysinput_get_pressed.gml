/// sysinput_get_pressed(action)

var _action, _value;
_action = argument0;
_value = ds_map_find_value(global._sysinputAction, _action);

var _keyvalue, _keyState;
var i;
for (i = 0; i < ds_list_size(_value); i += 1) {
    _keyvalue = ds_list_find_value(_value, i);
    if (_keyvalue < 256)
        _keyState = keyboard_check_pressed(_keyvalue);
    else
        _keyState = joystick_check_button_pressed(0, _keyvalue - 256);

    // attempt again if its not being pressed
    if (!_keyState)
        continue;
    else
        return _keyState;
}
return 0;
