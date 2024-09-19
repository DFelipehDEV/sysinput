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
hspeed = _speed * (sysinput_get("RIGHT") - sysinput_get("LEFT"));
vspeed = _speed * (sysinput_get("DOWN") - sysinput_get("UP"));
