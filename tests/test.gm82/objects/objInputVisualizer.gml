#define Create_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Init

sysinput_init();
sysinput_add_key("LEFT", vk_left);
sysinput_add_key("LEFT", ord("A"));
sysinput_add_axes("LEFT", 0, true);

sysinput_add_key("RIGHT", vk_right);
sysinput_add_key("RIGHT", ord("D"));
sysinput_add_axes("RIGHT", 0, false);

sysinput_add_key("UP", vk_up);
sysinput_add_key("UP", ord("W"));
sysinput_add_axes("UP", 1, true);

sysinput_add_key("DOWN", vk_down);
sysinput_add_key("DOWN", ord("S"));
sysinput_add_axes("DOWN", 1, false);

sysinput_add_key("RUN", vk_shift);
sysinput_add_button("RUN", 0);
sysinput_add_button("RUN", gp_shoulderr);

// GamePad only
sysinput_add_axes("MOVE_CAM_LEFT", 2, true);

sysinput_add_axes("MOVE_CAM_RIGHT", 2, false);

sysinput_add_axes("MOVE_CAM_UP", 3, true);

sysinput_add_axes("MOVE_CAM_DOWN", 3, false);
#define Draw_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Draw input

var i;
var key;
key = ds_map_find_first(global._sysinputAction);
for (i = 0; i < ds_map_size(global._sysinputAction); i += 1) {
    draw_text(x, y + i * 16, key + ":" + string(sysinput_get(key)));
    key = ds_map_find_next(global._sysinputAction, key);
}
