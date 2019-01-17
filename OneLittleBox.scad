height = 45;
length = 70;
width = 70;
innerWall = 2;
outerWall = 4;
lip = 4;
coverWall = 2;
coverThickness = 2;
coverGap = 3;
floorThickness = 3;
compartmentWidth = width - outerWall - outerWall;
compartmentHeight = height - coverGap - coverWall;
compartmentLength = length - outerWall - outerWall;

union(){
difference(){
difference(){
    cube([length, width, height]);
    translate([outerWall,outerWall,(floorThickness)])
union(){
//cube([compartmentLength, compartmentWidth,compartmentHeight]);
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
};

    union(){
        translate([innerWall, 0, height - coverGap - coverWall])
        cube([length - innerWall - innerWall, width - innerWall, coverGap]);
        translate([outerWall, 0, height - coverWall])
        cube([length - outerWall - outerWall, width - outerWall, coverWall]);
    }
};
translate([length + 10, 0,0])
cube([length - coverWall - coverWall - 1, width - coverWall, coverThickness]);
};