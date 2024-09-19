#define Step_0
/*"/*'/**//* YYD ACTION
lib_id=1
action_id=603
applies_to=self
*/
/// Walk

hspeed = 4 * (sysinput_get("RIGHT") - sysinput_get("LEFT"));
vspeed = 4 * (sysinput_get("DOWN") - sysinput_get("UP"));
