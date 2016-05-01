module four_way_connector(diameter, thickness, length)
{
	outer_radius = (diameter + (thickness * 2)) / 2;
	inner_radius = outer_radius - thickness;

	union() {
		difference() {
            // Outer cylinders
			union() {
				cylinder(r = outer_radius, h = length * 2, center = true);
				rotate([90, 0, 0]) cylinder(r = outer_radius, h = length, center = false);
				rotate([0, 90, 0]) cylinder(r = outer_radius, h = length, center = false);
			}

            // Inner cylinders - to hollow out the outer ones
			cylinder(r = inner_radius, h = (length * 2 + 1), center = true);
			rotate([90, 0, 0]) cylinder(r = inner_radius, h = (length + 1), center = false);
			rotate([0, 90, 0]) cylinder(r = inner_radius, h = (length + 1), center = false);
		}
	}
}

four_way_connector(17, 3, 40);
