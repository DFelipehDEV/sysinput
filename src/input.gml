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
_button = argument1 + 256; // We are offseting the button index to make it easier to distinguish it from a keyboard

sysinput_add_key(_action, _button);

#define sysinput_add_axes
/// sysinput_add_axes(action, axe, negative)

var _action, _axe, _negative;
_action = argument0;
_axe = argument1 + 288; // We are offseting the axis index to make it easier to distinguish it from a keyboard
_negative = argument2;

if (!_negative)
    sysinput_add_key(_action, _axe);
else
    sysinput_add_key(_action, _axe + 4);

#define sysinput_get
/// sysinput_get(action)

var _action, _value;
_action = argument0;
_value = ds_map_find_value(global._sysinputAction, _action);

var i;
for (i = 0; i < ds_list_size(_value); i += 1) {
    var _keyvalue, _keyState;
    _keyvalue = ds_list_find_value(_value, i);
    if (_keyvalue < 256)
        _keyState = keyboard_check(_keyvalue);
    else if (_keyvalue < 288) {
        _keyState = joystick_check_button(0, _keyvalue - 256);
    } else {
        switch (_keyvalue) {
            // gp_axislh+
            case 288:
                _keyState = joystick_xpos(0);
                if (_keyState < 0) {
                    _keyState = 0;
                }
                break;
            // gp_axislv+
            case 289:
                _keyState = joystick_ypos(0);
                if (_keyState < 0) {
                    _keyState = 0;
                }
                break;
            // gp_axisrh+
            case 290:
                _keyState = joystick_zpos(0);
                if (_keyState < 0) {
                    _keyState = 0;
                }
                break;
            // gp_axisrv+
            case 291:
                _keyState = joystick_rpos(0);
                if (_keyState < 0) {
                    _keyState = 0;
                }
                break;
                
            // Negatives
            
            // gp_axislh-
            case 292:
                _keyState = joystick_xpos(0);
                if (_keyState > 0) {
                    _keyState = 0;
                }
                _keyState = abs(_keyState);
                break;
            // gp_axislv-
            case 293:
                _keyState = joystick_ypos(0);
                if (_keyState > 0) {
                    _keyState = 0;
                }
                _keyState = abs(_keyState);
                break;
            // gp_axisrh-
            case 294:
                _keyState = joystick_zpos(0);
                if (_keyState > 0) {
                    _keyState = 0;
                }
                _keyState = abs(_keyState);
                break;
            // gp_axisrv-
            case 295:
                _keyState = joystick_rpos(0);
                if (_keyState > 0) {
                    _keyState = 0;
                }
                _keyState = abs(_keyState);
                break;
        }
    }

    // attempt again if its not being pressed
    if (_keyState == 0)
        continue;
    else
        return _keyState;
}
return 0;

#define sysinput_get_axis
/// sysinput_get(negative_action, positive_action)

return sysinput_get(argument1) - sysinput_get(argument0);

#define sysinput_get_pressed
/// sysinput_get_pressed(action)

var _action, _value;
_action = argument0;
_value = ds_map_find_value(global._sysinputAction, _action);

var i;
for (i = 0; i < ds_list_size(_value); i += 1) {
    var _keyvalue, _keyState;
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

#define sysinput_get_released
/// sysinput_get_released(action)

var _action, _value;
_action = argument0;
_value = ds_map_find_value(global._sysinputAction, _action);

var i;
for (i = 0; i < ds_list_size(_value); i += 1) {
    var _keyvalue, _keyState;
    _keyvalue = ds_list_find_value(_value, i);
    if (_keyvalue < 256)
        _keyState = keyboard_check_released(_keyvalue);
    else
        _keyState = joystick_check_button_released(0, _keyvalue - 256);

    // attempt again if its not being pressed
    if (!_keyState)
        continue;
    else
        return _keyState;
}
return 0;

