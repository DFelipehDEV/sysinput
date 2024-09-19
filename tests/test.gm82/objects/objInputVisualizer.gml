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

sysinput_add_key("RIGHT", vk_right);
sysinput_add_key("RIGHT", ord("D"));

sysinput_add_key("UP", vk_up);
sysinput_add_key("UP", ord("W"));

sysinput_add_key("DOWN", vk_down);
sysinput_add_key("DOWN", ord("S"));

sysinput_add_key("RUN", vk_shift);
sysinput_add_button("RUN", 0);
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
