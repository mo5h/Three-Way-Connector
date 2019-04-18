module three_way_connector(diameter, thickness, length, x_y_angle)
{
	outer_radius = (diameter + (thickness * 2)) / 2;
	inner_radius = outer_radius - thickness;

	union() {
		difference() {
			union() {
			    // Outer cylinders
			    translate(0,0,length-diameter/2) cylinder(r = outer_radius, h = length , center = false);
				rotate([x_y_angle, 0, 0]) cylinder(r = outer_radius, h = length, center = false);
				rotate([0, 90, 0]) cylinder(r = outer_radius, h = length, center = false);

				//This is just to cover the gap in the corner in a tidy way
				hull(){
				     translate(0,0,length-diameter/2) cylinder(r = outer_radius, h = outer_radius , center = false);
                     rotate([x_y_angle, 0, 0]) cylinder(r = outer_radius, h = outer_radius, center = false);
                     rotate([0, 90, 0]) cylinder(r = outer_radius, h = outer_radius, center = false);
				}
			}

            // Inner cylinders - to hollow out the outer ones
			translate(0,0,length-diameter/2-1) cylinder(r = inner_radius, h = (length * 2 + 3), center = false);
			rotate([x_y_angle, 0, 0]) cylinder(r = inner_radius, h = (length + 1), center = false);
			rotate([0, 90, 0]) cylinder(r = inner_radius, h = (length + 1), center = false);
		}
	}
}

three_way_connector(17, 3, 40, 90);
