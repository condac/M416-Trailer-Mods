// This will batch generate all stl files for the make all command. Rotate to print direction
banan = 1;
use <wheelmount.scad>

param1=0;   // must be initalised
len=param1; // param1 passed via -D on cmd-line
echo(len,param1);

$fs = 0.5;
$fa = 5.1;



//hub_8x12x3_m3();
module hub_8x12x3_m3() {

    hub();
}

//hub_8x12x3_m2();
module hub_8x12x3_m2() {

    hub();
}
//wheelhex_m3();
module wheelhex_m3() {
    wheelhex(Wheel_screw_type2 = "M3");
}
//wheelhex_m4();
module wheelhex_m4() {
    wheelhex(Wheel_screw_type2 = "M4");
}
//wheelhex_cap_m3();
module wheelhex_cap_m3() {
    wheelhex_cap(Wheel_screw_type2 = "M3");
}
//wheelhex_cap_m4();
module wheelhex_cap_m4() {
    wheelhex_cap(Wheel_screw_type2 = "M4");
}
//axle_155mm_m3();
module axle_155mm_m3() {
    rotate([90,0,0]) axle(Screw_type2 = "M3");
}
//axle_155mm_m2();
module axle_155mm_m2() {
    rotate([90,0,0]) axle(Screw_type2 = "M2");
}

module default() {
    cube(1);
}
module extra() {
    cube(1);
}