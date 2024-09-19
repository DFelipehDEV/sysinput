#define sysinput_init
/// sysinput_init()

global._sysinputAction = ds_map_create();

#define sysinput_add_key
/// sysinput_add_key(action, key)

var _action, _key, _input;
_action = argument0;
_key = argument1;

var __key;
__key = ds_map_find_first(global._sysinputAction);
for (i = 0; i < ds_map_size(global._sysinputAction); i += 1) {
    // already defined, add to ds_list
    if (__key == _action) {
        ds_list_add(ds_map_find_value(global._sysinputAction, __key), _key);
        return 0;
        break;
    }
    __key = ds_map_find_next(global._sysinputAction, __key);
}

_inputs = ds_list_create();
ds_list_add(_inputs, _key);
ds_map_add(global._sysinputAction, _action, _inputs);

#define sysinput_add_button
/// sysinput_add_button(action, button)

var _action, _button;
_action = argument0;
_button = argument1 + 190; // We are offseting the button index to make it easier to distinguish it from a keyboard

ds_map_add(global._sysinputAction, _action, _button);

#define sysinput_get
/// sysinput_get(action)

var _action, _value;
_action = argument0;
_value = ds_map_find_value(global._sysinputAction, _action);

var i;
for (i = 0; i < ds_list_size(_value); i += 1) {
    var _keyvalue, _keyState;
    _keyvalue = ds_list_find_value(_value, i);
    if (_keyvalue < 190)
        _keyState = keyboard_check(_keyvalue);
    else
        _keyState = joystick_check_button(0, _keyvalue - 105);
   
    // attempt again if its not being pressed
    if (_keyState == false)
        continue;
    else
        return _keyState;
}
return 0;

#define sysinput_get_pressed
/// sysinput_get_pressed(action)

var _action, _value;
_action = argument0;
_value = ds_map_find_value(global._sysinputAction, _action);

var i;
for (i = 0; i < ds_list_size(_value); i += 1) {
    var _keyvalue, _keyState;
    _keyvalue = ds_list_find_value(_value, i);
    if (_keyvalue < 190)
        _keyState = keyboard_check_pressed(_keyvalue);
    else
        _keyState = joystick_check_button_pressed(0, _keyvalue - 190);
   
    // attempt again if its not being pressed
    if (_keyState == false)
        continue;
    else
        return _keyState;
}
return 0;

#define sysinput_get_released
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

