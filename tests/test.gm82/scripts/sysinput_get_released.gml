/// sysinput_get_released(action)

var _action, _value;
_action = argument0;
_value = ds_map_find_value(global._sysinputAction, _action);

var i;
for (i = 0; i < ds_list_size(_value); i += 1) {
    var _keyvalue, _keyState;
    _keyvalue = ds_list_find_value(_value, i);
    if (_keyvalue < 190)
        _keyState = keyboard_check_released(_keyvalue);
    else
        _keyState = joystick_check_button_released(0, _keyvalue - 190);

    // attempt again if its not being pressed
    if (_keyState == false)
        continue;
    else
        return _keyState;
}
return 0;
