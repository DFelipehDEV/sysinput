#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Walk

var _speed;
_speed = 4;
if (sysinput_get("RUN")) {
    _speed = 8;
}
hspeed = _speed * (sysinput_get("RIGHT")  - sysinput_get("LEFT"));
vspeed = _speed * (sysinput_get("DOWN") - sysinput_get("UP"));

if sysinput_get("MOVE_CAM_LEFT") {
    view_xview[0] -= 4;
}

if sysinput_get("MOVE_CAM_RIGHT") {
    view_xview[0] += 4;
}

if sysinput_get("MOVE_CAM_UP") {
    view_yview[0] -= 4;
}

if sysinput_get("MOVE_CAM_DOWN") {
    view_yview[0] += 4;
}
