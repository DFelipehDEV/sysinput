/// sysinput_add(action, key)

var _action, _key;
_action = argument0;
_key = argument1;

ds_map_add(global._sysinputActions, _action, _key);
