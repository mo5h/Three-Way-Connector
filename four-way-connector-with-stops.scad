use <four-way-connector.scad>;

module four_way_connector_with_stops(diameter, thickness, length)
{
    outer_shell_diameter = diameter + (thickness * 2);
    stop_diameter = (diameter / 2);
    stop_thickness = (outer_shell_diameter - stop_diameter) / 2;
    
    union() {
        // Inner stops
        four_way_connector(stop_diameter, stop_thickness, length / 3);
        // Connector hull
        four_way_connector(diameter, thickness, length);
    }
}

four_way_connector_with_stops(17, 3, 40);
