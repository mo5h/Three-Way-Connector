use <three-way-connector.scad>;

module pin(length, pin_position, pin_length, pin_diameter){
    translate([length-pin_position-1,pin_length/2,0]) rotate([90, 0,0]) cylinder(r = pin_diameter, h = pin_length, center = false);
}
module threee_way_connector_with_pins(diameter, //diameter of the pipe this is going on
 thickness, //thickness of the sleve
 length, //length of the "prongs" of the sleve"
 x_y_angle, //angle between the x and y prongs
 pin_diameter, //diameter of the pin which will secure the hub to the pipe
 pin_position){ //offest out from the side of the sleeve for where the pin will go
    pin_length = (diameter+thickness)+5;

    difference(){
         three_way_connector(diameter, thickness, length, x_y_angle);

        union(){
            //top pin
           rotate([0, 0,90-x_y_angle/2]) translate([0,pin_length/2,length-pin_position-1]) rotate([90, 0,0]) cylinder(r = pin_diameter, h = pin_length, center = false);


           pin(length, pin_position, pin_length, pin_diameter);
           color("red") mirror([sin(x_y_angle/2),cos(x_y_angle/2), 0])            pin(length, pin_position, pin_length, pin_diameter);


            //z pin


            //translate(0,0,length-diameter/2-1) cylinder(r = inner_radius, h = (length * 2 + 3), center = false);
            //rotate([x_y_angle, 0, 0]) cylinder(r = inner_radius, h = (length + 1), center = false);
            //rotate([0, 90, 0]) cylinder(r = inner_radius, h = (length + 1), center = false);

        }
    }
}
//outer diameter = 26.6
threee_way_connector_with_pins(26.5, 3, 60, 45, 3, 10);
