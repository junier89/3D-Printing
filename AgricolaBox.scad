//200 by 160 by 35

height = 35;
totalLength = 195;
totalWidth = 159;
floorThickness = 2;
width = 159;
wall = 2;
compartmentWidth = (totalWidth - wall * 4) / 3;
compartmentHeight = height - floorThickness;
compartmentLength = totalLength - wall - wall;
smallDividedLength = (compartmentLength - (wall * 2))/4;
largeDividedLength = (compartmentLength - wall)/3;
widthDividers = 2;

magnetBaseOuterDiameter = 18;
magnetBaseInnerDiameter = 15.4;
magnetHeight = 4.0;

difference(){
	union(){
		difference(){
			cube([totalLength, totalWidth, height]);
			for(index=[0:widthDividers])
			translate([wall,(index * (compartmentWidth + wall)) + wall,(floorThickness)])
			rotate([0,90,0])
			translate([-compartmentHeight/2, compartmentWidth/2,0])
			linear_extrude(height = compartmentLength, center = false){
				union(){
					resize([compartmentHeight,compartmentWidth])circle(d=20);
					translate([-compartmentHeight/2,-compartmentWidth/2,0])
					square([compartmentHeight/2, compartmentWidth]);
				};
			};
		};
		translate([totalLength/2, totalWidth/3, 0])
		cylinder(height, d=magnetBaseOuterDiameter);
		for(index=[1:3])
		translate([(smallDividedLength + wall) * index, wall, 0])
		cube([wall, compartmentWidth, compartmentHeight]);
		for(index=[1:2])
		translate([(largeDividedLength + wall) * index, wall + compartmentWidth + wall, 0])
		cube([wall, compartmentWidth, compartmentHeight]);
		for(index=[1:2])
		translate([(largeDividedLength + wall) * index, (wall + compartmentWidth) * 2 + wall, 0])
		cube([wall, compartmentWidth, compartmentHeight]);
	};
	translate([totalLength/2, totalWidth/3, height - magnetHeight])
    cylinder(magnetHeight, d=magnetBaseInnerDiameter);
};