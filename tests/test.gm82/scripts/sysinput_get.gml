/// sysinput_get(action)

var _action, _value;
_action = argument0;
_value = ds_map_find_value(global._sysinputAction, _action);

var _keyvalue, _keyState;
var i;
for (i = 0; i < ds_list_size(_value); i += 1) {
    _keyvalue = ds_list_find_value(_value, i);
    if (_keyvalue < 256)
        _keyState = keyboard_check(_keyvalue);
    else if (_keyvalue < 288) {
        switch (_keyvalue) {
            // gp_shoulderl
            case 256 + gp_shoulderl: _keyState = max(joystick_upos(0), 0); break;
            // gp_shoulderl
            case 256 + gp_shoulderr: _keyState = max(joystick_vpos(0), 0); break;

            default: _keyState = joystick_check_button(0, _keyvalue - 256);
        }
    } else {
        switch (_keyvalue) {
            // gp_axislh+
            case 288: _keyState = max(joystick_xpos(0), 0); break;
            // gp_axislv+
            case 289: _keyState = max(joystick_ypos(0), 0); break;
            // gp_axisrh+
            case 290: _keyState = max(joystick_zpos(0), 0); break;
            // gp_axisrv+
            case 291: _keyState = max(joystick_rpos(0), 0); break;

            // Negatives

            // gp_axislh-
            case 292: _keyState = min(joystick_xpos(0), 0); break;
            // gp_axislv-
            case 293: _keyState = min(joystick_ypos(0), 0); break;
            // gp_axisrh-
            case 294: _keyState = min(joystick_zpos(0), 0); break;
            // gp_axisrv-
            case 295: _keyState = min(joystick_rpos(0), 0); break;
            default: _keyState = 0;
        }
    }

    _keyState = abs(_keyState);
    // attempt again if its not being pressed
    if (_keyState == 0)
        continue;
    else
        return _keyState;
}
return 0;
