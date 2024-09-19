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
