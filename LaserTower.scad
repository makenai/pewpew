// measurements

ball_diameter=40;
sled_width=73.5;
material_thickness=4.8;
board_height=18;
laser_tube_width=6.1;
laser_tube_length=8;

module laser() {
	difference() {
		cylinder(d=ball_diameter,h=10);
		translate([0,0,20.5])
			sphere(d=ball_diameter);
		translate([0,0,-2.5])
			cylinder(d=15,h=5);
	}
	hull() {
		translate([20,0,5])
			cube([3.5,laser_tube_width*1.5,10],center=true);
		translate([26,0,18])
			cube([8,laser_tube_width*1.5,1],center=true);
	}
	translate([22,0,21.9])
		tube();
	
}

module tube() {
	rotate([0,90])
	difference() {
		union() {
			cylinder(d=laser_tube_width+3,h=laser_tube_length);
			translate([2,0,laser_tube_length/2])
			cube([laser_tube_width/2,laser_tube_width*1.5,laser_tube_length],center=true);
		}
		translate([0,0,-1])
			cylinder(d=laser_tube_width,h=laser_tube_length+2);
	}
}

module base() {
	difference() {
		translate([0,0,1.3])
		cube([sled_width+5,15,12.5],center=true);
		cube([sled_width,20,10],center=true);
	}
	cube([sled_width-(material_thickness*2),15,10],center=true);
}


laser();
