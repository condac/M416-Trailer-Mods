//

// Parameters in Customizer

// Recomended is the 8x12x3.5 also known as MR128-2RS
Bearing_Diameter = 12;
Bearing_Inner_Diameter = 8;
Bearing_Height = 3.5;

// Wheel screw type
Wheel_screw_type = "M4"; //[M4,M3]

// Screw type
Screw_type = "M3"; //[M3,M2]

// Total width from bearing to bearing, Add 12mm to get Hex to Hex.
Width = 155;

// What part to generate. Select visual to see in assembled view. 
What_To_Print = "Visual"; // [All,Hub,Wheelhex,Wheelhex_cap,Axle,Visual]


// How much in height the wheel mount should move up+ or down-
Wheel_offset_height = -10;

// How much the middle part is moved up to avoid hitting stuff offroad. 
Ground_clear = 10; 

/* [Hidden] */

//a = Bearing_Diameter+Bearing_Inner_Diameter; // just a code to stop customizer from showing more variables
// ############# Settings ################

$fs = 0.5;
$fa = 5.1;

S_HEIGHT_OFFSET = Wheel_offset_height; // How much in height the wheel mount should move up+ or down-

S_GROUND_CLEAR = Ground_clear; // How much the middle part is moved up to avoid hitting stuff offroad. 

S_TOTAL_WIDTH = Width;

S_AXLE_X = 150;
S_AXLE_Y = 8;

S_WIDTH_EXTRA_HEX = 6;

S_AXLE_MOUNT_X = 93; // Distance between center holes for axle mount on leaf springs

S_SPRING_W = 8; // Width of the leaf springs
S_SPRING_SCREW_DIST = 11;
S_SPRING_SCREW_OFFSET = 1;
S_SPRING_MOUNT_THIN = 4;
// ############# Constants ################
C_M2_DIAMETER = 2.3; // size of a hole that a M3 screw will slide through
C_M2_DIAMETER_THREAD = 2; // size of a hole that a M3 screw will create own threads in

C_M2_NUT = 6;
C_M2_NUT_H = 2.5;

C_M3_DIAMETER = 3.3; // size of a hole that a M3 screw will slide through
C_M3_DIAMETER_THREAD = 2.8; // size of a hole that a M3 screw will create own threads in

C_M3_NUT = 7;
C_M3_NUT_H = 3;

C_M4_NUT = 8.4;
C_M4_NUT_H = 4;


C_M4_DIAMETER = 4.1; // size of a hole that a M4 screw will slide through
C_M4_DIAMETER_THREAD = 3.8; // size of a hole that a M4 screw will create own threads in

    b_12mm_tol = 0.3; // tolerance for bearing with 12mm diameter
C_12MM_BEARING_D = 12+b_12mm_tol; // Size of a hole that hold a 12mm bearing
C_12MM_BEARING_H = 3.5;

    b_tol = 0.6; // tolerance for bearing 

//MR128-2RS bearing
C_BEARING_D = Bearing_Diameter+b_tol; // Size of a hole that hold a bearing
C_BEARING_H = Bearing_Height;
C_BEARING_INSIDE = Bearing_Inner_Diameter; // Inside diameter of bearing

//C_SCREW = (Screw_type == "M3") ? C_M3_DIAMETER : C_M2_DIAMETER; // if not M3 its M2
//C_SCREW_THREAD = (Screw_type == "M3") ? C_M3_DIAMETER_THREAD : C_M2_DIAMETER_THREAD; // if not M3 its M2

//C_WHEEL_SCREW = (Wheel_screw_type == "M4") ? C_M4_DIAMETER : C_M3_DIAMETER; // if not M4 its M3
//C_WHEEL_SCREW_THREAD = (Wheel_screw_type == "M4") ? C_M4_DIAMETER_THREAD : C_M3_DIAMETER_THREAD; // if not M4 its M3

//C_WHEEL_SCREW_NUT = (Wheel_screw_type == "M4") ? C_M4_NUT : C_M3_NUT; // if not M4 its M3
//C_WHEEL_SCREW_NUT_H = (Wheel_screw_type == "M4") ? C_M4_NUT_H : C_M3_NUT_H; // if not M4 its M3

C_WHEEL_HEX = 13.9; // The hex that the rims mount to

C_WHEEL_AXLE = C_BEARING_INSIDE - 0.3; // Axle that goes through the 5mm hole in the bearings

// ############# Code ################

//Assembly();
PrintAll();
module wheelhex(Wheel_screw_type2 = Wheel_screw_type) {
    C_WHEEL_SCREW_NUT = (Wheel_screw_type2 == "M4") ? C_M4_NUT : C_M3_NUT; // if not M4 its M3
    C_WHEEL_SCREW_NUT_H = (Wheel_screw_type2 == "M4") ? C_M4_NUT_H : C_M3_NUT_H; // if not M4 its M3
    C_WHEEL_SCREW = (Wheel_screw_type2 == "M4") ? C_M4_DIAMETER : C_M3_DIAMETER; // if not M4 its M3
    C_WHEEL_SCREW_THREAD = (Wheel_screw_type2 == "M4") ? C_M4_DIAMETER_THREAD : C_M3_DIAMETER_THREAD; // if not M4 its M3
    difference() {
        union() {
            translate([0,0,-S_WIDTH_EXTRA_HEX]) cylinder($fn=6, d=C_WHEEL_HEX, h=S_WIDTH_EXTRA_HEX);
            cylinder(d=C_WHEEL_AXLE, h=hub_h+0.3);
        }
        wheelhex_screws(Wheel_screw_type2 = Wheel_screw_type2);
        translate([0,0,-S_WIDTH_EXTRA_HEX-0.8]) cylinder(d=C_WHEEL_SCREW_NUT, h=C_WHEEL_SCREW_NUT_H+1, $fn=6);
    }
    
}
module wheelhex_cap(Wheel_screw_type2 = Wheel_screw_type) {
    C_WHEEL_SCREW_NUT = (Wheel_screw_type2 == "M4") ? C_M4_NUT : C_M3_NUT; // if not M4 its M3
    C_WHEEL_SCREW_NUT_H = (Wheel_screw_type2 == "M4") ? C_M4_NUT_H : C_M3_NUT_H; // if not M4 its M3
    C_WHEEL_SCREW = (Wheel_screw_type2 == "M4") ? C_M4_DIAMETER : C_M3_DIAMETER; // if not M4 its M3
    C_WHEEL_SCREW_THREAD = (Wheel_screw_type2 == "M4") ? C_M4_DIAMETER_THREAD : C_M3_DIAMETER_THREAD; // if not M4 its M3
    difference() {
        translate([0,0,hub_h+0.3]) cylinder(d1=C_WHEEL_AXLE, d2=C_WHEEL_AXLE+3, h=3);
        //translate([0,0,hub_h+0.3]) cylinder(d=C_WHEEL_SCREW, h=20);
        wheelhex_screws(Wheel_screw_type2 = Wheel_screw_type2);
        %wheelhex_screws(Wheel_screw_type2 = Wheel_screw_type2);
    }
}
module wheelhex_screws(Wheel_screw_type2 = Wheel_screw_type) {
    C_WHEEL_SCREW = (Wheel_screw_type2 == "M4") ? C_M4_DIAMETER : C_M3_DIAMETER; // if not M4 its M3
    C_WHEEL_SCREW_THREAD = (Wheel_screw_type2 == "M4") ? C_M4_DIAMETER_THREAD : C_M3_DIAMETER_THREAD; // if not M4 its M3
    translate([0,0,hub_h+0.3+4]) rotate([0,180,0]) common_flat_screw_tap(l = 35, l2 = 10, dd1=C_WHEEL_SCREW_THREAD, dd2=C_WHEEL_SCREW);
    //translate([0,0,-S_WIDTH_EXTRA_HEX]) cylinder(d=C_WHEEL_SCREW_THREAD, h=20*10);
}

hub_middle_gap = 5;
hub_h = (C_BEARING_H*2+hub_middle_gap);
hub_mount_y = (C_BEARING_D>S_AXLE_Y) ? C_BEARING_D+0.2 : S_AXLE_Y+0.2;

hub_mount_d = 8; // diameter of mounting pin
hub_mount_h = 10; // distance to first mounting hole from bearings back
hub_mount_dist = 10; // distance between mounting holes
hub_mount_w = 4; // thickness of mount
module hub() {

    
    translate([0,0,0]) difference() {
        union() {
            translate([0,0,0]) cylinder(d=C_BEARING_D+4, h=C_BEARING_H*2+hub_middle_gap);
            //cylinder(d=C_WHEEL_AXLE, h=20);
            
            // Mountings
            hull() {
                translate([0,hub_mount_y/2,(C_BEARING_H*2+hub_middle_gap)-hub_mount_d/2]) rotate([-90,0,0]) cylinder(d=hub_mount_d, h= hub_mount_w);
                translate([+hub_mount_dist/2,hub_mount_y/2,(C_BEARING_H*2+hub_middle_gap)+hub_mount_h]) rotate([-90,0,0]) cylinder(d=hub_mount_d, h= hub_mount_w);
                translate([-hub_mount_dist/2,hub_mount_y/2,(C_BEARING_H*2+hub_middle_gap)+hub_mount_h]) rotate([-90,0,0]) cylinder(d=hub_mount_d, h= hub_mount_w);
            }
            hull() {
                translate([0,-hub_mount_y/2 - hub_mount_w,(C_BEARING_H*2+hub_middle_gap)-hub_mount_d/2]) rotate([-90,0,0]) cylinder(d=hub_mount_d, h= hub_mount_w);
                translate([+hub_mount_dist/2,-hub_mount_y/2 - hub_mount_w,(C_BEARING_H*2+hub_middle_gap)+hub_mount_h]) rotate([-90,0,0]) cylinder(d=hub_mount_d, h= hub_mount_w);
                translate([-hub_mount_dist/2,-hub_mount_y/2 - hub_mount_w,(C_BEARING_H*2+hub_middle_gap)+hub_mount_h]) rotate([-90,0,0]) cylinder(d=hub_mount_d, h= hub_mount_w);
            }
        }
        
        // Bearing holes
        translate([0,0,-1]) cylinder(d=C_BEARING_D, h=C_BEARING_H+1);
        translate([0,0,C_BEARING_H + hub_middle_gap]) cylinder(d=C_BEARING_D, h=C_BEARING_H+1);
        translate([0,0,0]) cylinder(d=C_BEARING_D-1, h=C_BEARING_H*2+hub_middle_gap+1);
        //Elephant foot
        translate([0,0,0]) cylinder(d1=C_BEARING_D+1,d2=C_BEARING_D, h=C_BEARING_H/3);
        
        // Holes for mounting
        hub_screws();
        %hub_screws();
    }
}
module hub_screws(Screw_type2 = Screw_type) {
    C_SCREW = (Screw_type2 == "M3") ? C_M3_DIAMETER : C_M2_DIAMETER; // if not M3 its M2
    C_SCREW_THREAD = (Screw_type2 == "M3") ? C_M3_DIAMETER_THREAD : C_M2_DIAMETER_THREAD; // if not M3 its M2
    translate([+hub_mount_dist/2,hub_mount_y/2+hub_mount_w,(C_BEARING_H*2+hub_middle_gap)+hub_mount_h]) rotate([90,0,0]) common_button_screw_tap(l = 25, l2 = 1+hub_mount_w, dd1=C_SCREW_THREAD, dd2=C_SCREW);
    translate([-hub_mount_dist/2,hub_mount_y/2+hub_mount_w,(C_BEARING_H*2+hub_middle_gap)+hub_mount_h]) rotate([90,0,0]) common_button_screw_tap(l = 25, l2 = 1+hub_mount_w, dd1=C_SCREW_THREAD, dd2=C_SCREW);
    //translate([0,-hub_mount_y/2 - hub_mount_w,hub_mount_h+hub_mount_dist]) rotate([-90,0,0]) cylinder(d=hub_mount_d, h= hub_mount_w);
}
module axle(Screw_type2 = Screw_type) {
    union() {
        axle_mirror(Screw_type2 = Screw_type2);
        mirror([1,0,0]) axle_mirror(Screw_type2 = Screw_type2);
    }
}
module axle_mirror(Screw_type2 = Screw_type) {
    
    C_SCREW = (Screw_type2 == "M3") ? C_M3_DIAMETER : C_M2_DIAMETER; // if not M3 its M2
    C_SCREW_THREAD = (Screw_type2 == "M3") ? C_M3_DIAMETER_THREAD : C_M2_DIAMETER_THREAD; // if not M3 its M2
    
    //translate([-S_AXLE_X/2,-S_AXLE_Y/2,-S_AXLE_Y/2]) cube([S_AXLE_X, S_AXLE_Y,S_AXLE_Y]);
    difference() {
        union() {
            hull() {
                translate([0,-S_AXLE_Y/2,0 + S_GROUND_CLEAR]) rotate([-90,0,0]) cylinder(d=S_AXLE_Y, h=S_AXLE_Y);
                translate([S_AXLE_MOUNT_X/2-S_SPRING_W/2-S_AXLE_Y/2,  -S_AXLE_Y/2,  0 + S_GROUND_CLEAR]) rotate([-90,0,0]) cylinder(d=S_AXLE_Y, h=S_AXLE_Y);
            }
            hull() {
                translate([S_AXLE_MOUNT_X/2-S_AXLE_Y/2-S_SPRING_W/2,  -S_AXLE_Y/2,  0 + S_GROUND_CLEAR]) rotate([-90,0,0]) cylinder(d=S_AXLE_Y, h=S_AXLE_Y);
                translate([S_AXLE_MOUNT_X/2-S_AXLE_Y/2-S_SPRING_W/2,  -S_AXLE_Y/2,  0+S_SPRING_MOUNT_THIN/2]) rotate([-90,0,0]) cylinder(d=S_AXLE_Y, h=S_AXLE_Y);
            }
            
            hull() { // Spring mount part
                translate([S_AXLE_MOUNT_X/2-S_AXLE_Y-S_SPRING_W/2++S_AXLE_Y/2 , -S_AXLE_Y/2,  0])  rotate([-90,0,0]) cylinder(d=S_AXLE_Y-S_SPRING_MOUNT_THIN, h=S_AXLE_Y);
                translate([S_AXLE_MOUNT_X/2-S_AXLE_Y-S_SPRING_W/2 +S_SPRING_W+S_AXLE_Y+S_AXLE_Y/2 ,  -S_AXLE_Y/2,  0])  rotate([-90,0,0]) cylinder(d=S_AXLE_Y-S_SPRING_MOUNT_THIN, h=S_AXLE_Y);
                // Screw mounts
                translate([S_AXLE_MOUNT_X/2, -S_SPRING_SCREW_OFFSET, -S_AXLE_Y/2+S_SPRING_MOUNT_THIN/2]) rotate([0,0,0])cylinder(d=C_SCREW_THREAD+2, h=S_AXLE_Y-S_SPRING_MOUNT_THIN);
                translate([S_AXLE_MOUNT_X/2, -S_SPRING_SCREW_OFFSET+S_SPRING_SCREW_DIST, -S_AXLE_Y/2+S_SPRING_MOUNT_THIN/2]) rotate([0,0,0]) cylinder(d=C_SCREW_THREAD+4, h=S_AXLE_Y-S_SPRING_MOUNT_THIN);
            }
            //translate([S_AXLE_MOUNT_X/2-S_AXLE_Y-S_SPRING_W/2 ,-S_AXLE_Y/2,-S_AXLE_Y/2]) cube([S_SPRING_W+S_AXLE_Y+S_AXLE_Y, S_AXLE_Y,S_AXLE_Y]);
            
            hull() { // hub mount part
                //translate([S_AXLE_MOUNT_X/2+S_SPRING_W/2,-S_AXLE_Y/2,-S_AXLE_Y/2 + S_HEIGHT_OFFSET]) cube([S_AXLE_Y, S_AXLE_Y, S_AXLE_Y]);
                translate([S_AXLE_MOUNT_X/2-S_AXLE_Y-S_SPRING_W/2 +S_SPRING_W+S_AXLE_Y+S_AXLE_Y/2 ,  -S_AXLE_Y/2,  -S_SPRING_MOUNT_THIN/2])  rotate([-90,0,0]) cylinder(d=S_AXLE_Y, h=S_AXLE_Y);
                translate([S_TOTAL_WIDTH/2-(C_BEARING_H*2+hub_middle_gap)-hub_mount_h, -S_AXLE_Y/2, +hub_mount_dist/2+ S_HEIGHT_OFFSET]) rotate([-90,0,0]) cylinder(d=S_AXLE_Y, h=hub_mount_y-0.6);
                translate([S_TOTAL_WIDTH/2-(C_BEARING_H*2+hub_middle_gap)-hub_mount_h, -S_AXLE_Y/2, -hub_mount_dist/2+ S_HEIGHT_OFFSET]) rotate([-90,0,0]) cylinder(d=S_AXLE_Y, h=hub_mount_y-0.6);
            }
            //translate([S_AXLE_MOUNT_X/2+S_SPRING_W/2,-S_AXLE_Y/2,-S_AXLE_Y/2 + S_HEIGHT_OFFSET]) cube([S_AXLE_MOUNT_X/2-S_SPRING_W/2,S_AXLE_Y, S_AXLE_Y]);
            
        }
        
        axle_screws(Screw_type2 = Screw_type2);
        %axle_screws(Screw_type2 = Screw_type2);
        translate([S_TOTAL_WIDTH/2,0,+ S_HEIGHT_OFFSET]) rotate([0,-90,0]) hub_screws(Screw_type2 = Screw_type2);
        //translate([S_TOTAL_WIDTH/2,0,0]) rotate([0,-90,0]) %hub_screws();
    }
}
module axle_screws(Screw_type2 = Screw_type) {
    C_SCREW = (Screw_type2 == "M3") ? C_M3_DIAMETER : C_M2_DIAMETER; // if not M3 its M2
    C_SCREW_THREAD = (Screw_type2 == "M3") ? C_M3_DIAMETER_THREAD : C_M2_DIAMETER_THREAD; // if not M3 its M2
    translate([S_AXLE_MOUNT_X/2, -S_SPRING_SCREW_OFFSET, -S_AXLE_Y/2]) rotate([0,0,0]) common_button_screw_tap(l = 25, l2 = 0, dd1=C_SCREW_THREAD, dd2=C_SCREW);
    translate([S_AXLE_MOUNT_X/2, -S_SPRING_SCREW_OFFSET+S_SPRING_SCREW_DIST, -S_AXLE_Y/2]) rotate([0,0,0]) common_button_screw_tap(l = 25, l2 = 0, dd1=C_SCREW_THREAD, dd2=C_SCREW);
}

module Assembly() {
    // For visual assembly only
    y_diff = -(S_AXLE_Y - hub_mount_y)/2;
    axle();
    translate([S_TOTAL_WIDTH/2, y_diff ,+ S_HEIGHT_OFFSET-15]) rotate([0,-90,0]) wheelhex();
    translate([S_TOTAL_WIDTH/2, y_diff ,+ S_HEIGHT_OFFSET-15]) rotate([0,-90,0]) wheelhex_cap();
    translate([S_TOTAL_WIDTH/2, y_diff ,+ S_HEIGHT_OFFSET]) rotate([0,-90,0]) hub();
    
    rotate([0,0,180]) translate([S_TOTAL_WIDTH/2,-y_diff,+ S_HEIGHT_OFFSET-15]) rotate([0,-90,0]) wheelhex();
    rotate([0,0,180]) translate([S_TOTAL_WIDTH/2,-y_diff,+ S_HEIGHT_OFFSET-15]) rotate([0,-90,0]) wheelhex_cap();
    rotate([0,0,180]) translate([S_TOTAL_WIDTH/2,-y_diff,+ S_HEIGHT_OFFSET]) rotate([0,-90,0]) hub();
}

module PrintAll() {
    //What_To_Print = "All"; // [All,Hub,Wheelhex,Wheelhex_cap,Axle,Visual]
    if (What_To_Print == "All") {
        translate([0,0,S_AXLE_Y/2]) rotate([90,0,180]) axle();
        translate([-8,-20,S_WIDTH_EXTRA_HEX]) wheelhex();
        translate([8,-20,S_WIDTH_EXTRA_HEX]) wheelhex();
        translate([-25,-20,-hub_h-0.3]) wheelhex_cap();
        translate([25,-20,-hub_h-0.3]) wheelhex_cap();
        translate([10,-38,0])hub();
        translate([-10,-38,0])hub();
    }
    if (What_To_Print == "Hub") {
        hub();
    }
    if (What_To_Print == "Wheelhex") {
        wheelhex();
    }
    if (What_To_Print == "Wheelhex_cap") {
        wheelhex_cap();
    }
    if (What_To_Print == "Axle") {
        rotate([90,0,0]) axle();
    }    
    if (What_To_Print == "Visual") {
        Assembly();
    }
}

module common_flat_screw_tap(l = 10, l2 = 0, dd1=1, dd2=1) {
    
    // l2 is amount of the screw that are bigger for sliding through the hole
    tap_z = 1.9;
    union() {
        echo(dd1);
        cylinder(d = dd1, h= l);
        cylinder(d = dd2, h= l2);
        translate([0,0,-0.1+0.1]) cylinder(d1 = dd2 + 3.5, d2= dd1, h= tap_z);
        translate([0,0,-0.1]) cylinder(d = dd2 + 3.5, h= 0.3);
    }
}


module common_button_screw_tap(l = 10, l2 = 0, dd1=1, dd2=1) {
   
    union() {
        cylinder(d = dd1, h= l);
        cylinder(d = dd2, h= l2);
        translate([0,0,-4]) cylinder(d = dd1+3, h=4);
    }
}