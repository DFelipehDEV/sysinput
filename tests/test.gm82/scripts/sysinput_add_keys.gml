/// sysinput_add_key(action, keys)

var _action, _keys;
_action = argument0;
_keys = argument1;

ds_map_add(global._sysinputAction, _action, _keys);
