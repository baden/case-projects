$fn = 64;

// Плата
PCB_W = 24.5;
PCB_H = 42.0;
PCB_T = 1.0;

COMP_TOP_H = 2.5;
COMP_BOT_H = 2.5;


// Магнит

MAG_D = 10;
MAG_H = 10;

// Плата
color("DarkGreen") {
  translate([0, 0, 4])

  cube([PCB_W, PCB_H, PCB_T + COMP_TOP_H + COMP_BOT_H], center=true);
}


// Аккумулятор
color("lightblue") {
  translate([0, 0, -4])
  cube([24, 40, 6], center=true);
}

// Магниты

MAG_OFFSET = 23;

color("Silver") {
  translate([MAG_OFFSET, 0, -2]) {
    cylinder(d=MAG_D, h=MAG_H, center=true);
  }
  translate([-MAG_OFFSET, 0, -2]) {
    cylinder(d=MAG_D, h=MAG_H, center=true);
  }
}

// Корпус

module ellipse(width, height) {
  scale([1, height/width, 1]) circle(r=width/2);
}

color([1, 1, 1, 0.4]) {
/*color("Blue") {*/

/*cylinder(d=70, h=1.5, center=true);*/

wt = 1.0;

linear_extrude(14, center=true) {
  difference() {
    ellipse(68, 47);
    ellipse(68-wt, 47-wt);
  }
}

translate([0,0,-7])
linear_extrude(1, center=true) {
  ellipse(68, 47);
}

// Ниша под магнит
translate([MAG_OFFSET, 0, 0])
linear_extrude(12, center=true) {
  difference() {
    circle(r = MAG_D/2 + 1);
    circle(r = MAG_D/2);
  }
}

}
