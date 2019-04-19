module limb(outer_radius, diameter, length, inner){
	cylinder(r = outer_radius, h = length, center = false);
    if(inner) translate([diameter/2,0,length/2]) cube(size = [outer_radius/2+0.5, outer_radius, length], center=true);
}

module three_way_connector(diameter, thickness, length, x_y_angle)
{
	outer_radius = (diameter + (thickness * 2)) / 2;
	inner_radius = outer_radius - thickness;

	union() {
		difference() {
			union() {
			    // Outer cylinders
			    translate(0,0,length-diameter/2) cylinder(r = outer_radius, h = length , center = false);

				rotate([0, 90, 0]){
				    cylinder(r = outer_radius, h = length, center = false);
                        limb(outer_radius, diameter, length, inner=true);
				    rotate([x_y_angle,0,0]){
                        limb(outer_radius, diameter, length, inner=true);
				    }
				}
			    // Make the bottom a bit thicker so it has better bed adhesion and less of an angle to go

				//This is just to cover the gap in the corner in a tidy way
				hull(){
				     translate(0,0,length-diameter/2) cylinder(r = outer_radius, h = outer_radius , center = false);
				     rotate([0, 90, 0]){
                             limb(outer_radius, diameter, diameter, inner=true);
				         rotate([x_y_angle,0,0]){
                             limb(outer_radius, diameter, diameter, inner=true);
				         }
				     }
				}
			}

            // Inner cylinders - to hollow out the outer ones
			translate(0,0,length-diameter/2-1) cylinder(r = inner_radius, h = (length * 2 + 3), center = false);
				rotate([0, 90, 0]){
                    limb(inner_radius, diameter, length+1, inner=false);
				    rotate([x_y_angle,0,0]){
                        limb(inner_radius, diameter, length+1, inner=false);
				    }
				}


		}
	}
}

three_way_connector(17, 3, 40, 45);
