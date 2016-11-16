$fn=64;

// Примечание:
// Идея реализации зарядки через магниты.

/*linear_extrude(height=10, scale=[1,0.1], slices=20, twist=0)
polygon(points=[[0,0],[20,10],[20,-10]]);*/

// Нижняя точка (плоскость магнитов)
Bot = -1.6/2 - 2.5 - 6 - 1.0;

// Смещение зарядной станции
offset = 9;

module cyl_hat(d, h, r) {
  union(){
    cylinder(d=d, h=h-2*r, center=true);
    cylinder(d=d-2*r, h=h, center=true);

    translate([0, 0, h/2-r]) {
      rotate_extrude(){
        translate([d/2 - r, 0]) circle(r=r, center=true);
      }
    }
    translate([0, 0, -h/2+r]) {
      rotate_extrude(){
        translate([d/2 - r, 0]) circle(r=r, center=true);
      }
    }
  }
}

// Толщина стенок корпуса
Wp = 1.0;

module ear() {
  difference() {
    translate([ 40/2 + 10/2 + 1.0, 0, 0]) {
      difference() {
        cylinder(d=12, h=10, center=true);
        cylinder(d=10, h=11, center=true);
      }

      translate([0, 0, 10/2]) {
        rotate_extrude(){
          translate([11/2 - 0.5, 0]) circle(r=1.0, center=true);
        }
      }
      translate([0, 0, 10/2+0.5]) cylinder(d=10, h=1.0, center=true);

      difference() {
        translate([-3.9, 6, 0]) cylinder(d=4, h=8.0, center=true);
        translate([-3.9, 6, 0]) cylinder(d=1.5, h=11.0, center=true);
      }
      difference() {
        translate([-3.9,-6, 0]) cylinder(d=4, h=8.0, center=true);
        translate([-3.9,-6, 0]) cylinder(d=1.5, h=11.0, center=true);
      }
    }

    translate([40/2, 0, -5]) {
      cube([9,16,2], center=true);
    }
  }
}

module top_part() {

  difference() {
    union() {
      translate([0, 0, -4]) {
          linear_extrude(height = 10.60, center=true) offset(Wp) square(size=[40, 40], center=true);
      }

      hull() {
        translate([0, 0, 1.0]) {
          linear_extrude(height = Wp, center=true) offset(Wp) square(size=[40, 40], center=true);
        }

        translate([0, 0, 5.5]) {
          linear_extrude(height = Wp, center=true) offset(Wp) square(size=[34.5, 34.5], center=true);
        }
      }

      hull() {
        translate([0, 0, 5.5]) {
          linear_extrude(height = Wp, center=true) offset(Wp) square(size=[34.5, 34.5], center=true);
        }

        translate([0, 0, 6]) {
          linear_extrude(height = Wp, center=true) offset(Wp) square(size=[5, 5], center=true);
        }
      }

    }

    hull(){
      translate([0, 0, -5]) cube([40, 40, 12], center=true);
      translate([0, 0, 4.5]) cube([35, 35, 1], center=true);
      translate([0, 0, 5]) cube([5, 5, 1], center=true);

    }
  }

  translate([0, 0, Bot+10/2]) {
    ear();
    rotate([0,0,90]) ear();
    rotate([0,0,180]) ear();
    rotate([0,0,-90]) ear();
  }
}

module ear2() {
  translate([40/2, 0, 0]) {
    linear_extrude(height = Wp, center=true) offset(2) square(size=[4.5, 12], center=true);
  }
}

module ear2_hole(args) {
  translate([ 40/2 + 10/2 + 1.0, 0, 0]) {
    translate([-3.9, 6, 0]) cylinder(d1=3.5, d2=1.5, h=1.2, center=true);
    translate([-3.9,-6, 0]) cylinder(d1=3.5, d2=1.5, h=1.2, center=true);
    cylinder(d=10, h=11, center=true);
  }
}

module bottom_body() {
  linear_extrude(height = Wp, center=true) offset(Wp) square(size=[40, 40], center=true);
  translate([0, 0, 1]) {
    difference() {
      translate([0,0,-0.5]) cube([40,40,0.25], center=true);
      cube([38,38,1.1], center=true);
    }
  }
  ear2();
  rotate([0,0,90]) ear2();
  rotate([0,0,180]) ear2();
  rotate([0,0,-90]) ear2();
}

module bottom_part(){
  difference() {
    bottom_body();
    ear2_hole();
    rotate([0,0,90]) ear2_hole();
    rotate([0,0,180]) ear2_hole();
    rotate([0,0,-90]) ear2_hole();
  }
}

color([0.8, 0.4, 0.4]) {
  /*difference() {*/
    top_part();
    /*translate([52,0,0]) cube([100,100,100], center=true);
    translate([-52,0,0]) cube([100,100,100], center=true);
  }*/
}

color([0.8, 0.4, 0.4]) translate([0, 0, Bot - offset]) {
  /*difference() {*/
    bottom_part();
    /*translate([52,0,0]) cube([100,100,100], center=true);
    translate([-52,0,0]) cube([100,100,100], center=true);
  }*/
}


if(0) {
// GPS-антенна 35x35x4
color("Grey") translate([0, 0, 4/2 + 1.6/2]) cube([35,35,4], center=true);
color("Silver") translate([4, 0, 4/2 + 1.6/2+4/2+0.6/2]) cylinder(d=5, h=0.6, center=true);

// PCB
color("Green") cube([40,40,1.6], center=true);
color("black") translate([0, 0, -1.6/2 - 2.5/2]) {
  cube([10,10,2.5], center=true);
  translate([10, 2, 0]) cube([5,2,2.5], center=true);
}

// Аккумулятор
color("Silver") translate([0, 0, -6/2 - 1.6/2 - 2.5]) cube([40,40,6], center=true);


// Магниты
color("Silver") translate([ 40/2 + 10/2 + 1.0, 0, Bot+10/2]) cyl_hat(10, 10, 1);
color("Silver") translate([-40/2 - 10/2 - 1.0, 0, Bot+10/2]) cyl_hat(10, 10, 1);
color("Silver") translate([0, 40/2 + 10/2 + 1.0,  Bot+10/2]) cyl_hat(10, 10, 1);
color("Silver") translate([0,-40/2 - 10/2 - 1.0,  Bot+10/2]) cyl_hat(10, 10, 1);

}

module hand() {
  translate([0, 0, -5/2]) cylinder(d=60, h=1, center=true);
  translate([ 40/2 + 10/2 + 1.0, 0, -3]) cyl_hat(4, 5, 0.5);
}

// Зарядная станция
translate([ 0, 0, Bot - 2*offset]) {

  color([0.8, 0.4, 0.4]) {
    hand();
    rotate([0, 0, 90]) hand();
    rotate([0, 0, 180]) hand();
    rotate([0, 0, -90]) hand();
  }

  // Контакты зарядки
  color("Gold") translate([0, 0, -5/2]) {
    translate([ 40/2 + 10/2 + 1.0, 0, 0]) cyl_hat(3, 5, 0.5);
    translate([-40/2 - 10/2 - 1.0, 0, 0]) cyl_hat(3, 5, 0.5);
    translate([0,  40/2 + 10/2 + 1.0, 0]) cyl_hat(3, 5, 0.5);
    translate([0, -40/2 - 10/2 - 1.0, 0]) cyl_hat(3, 5, 0.5);
  }
}
