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
