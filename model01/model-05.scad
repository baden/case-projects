$fn=32;

W = 50; // Ширина корпуса
H = 30; // Высота корпуса
T = 6;  // Толщина корпуса

wp = 1.0; // Толщина стенок корпуса

// Пробка
Pt = 2; // Толщина пробки

difference() {
  linear_extrude(height = W, scale = 1.0, center=true) {
    difference() {
      hull() {
        translate([0,-H/2,0]) circle(d=T);
        translate([0, H/2,0]) circle(d=T);
      }

      hull() {
        translate([0,-15,0]) circle(d=T-wp*2);
        translate([0, 15,0]) circle(d=T-wp*2);
      }
    }
    /*offset(3) {
    scale([0.001,1,1]) square(30, center=true);
    }*/
  }

  translate([0, 0, -W/2 + Pt/2 - 0.25]) linear_extrude(height = Pt + 0.5, scale = 1.0, center=true) {
    hull() {
      translate([0,-H/2]) circle(d=T-wp);
      translate([0, H/2]) circle(d=T-wp);
    }
  }

}

translate([0, 0, W/2-wp/2]) linear_extrude(height = wp, scale = 1.0, center=true) {
  hull(){
    translate([0,-H/2]) circle(d=T);
    translate([0, H/2]) circle(d=T);
  }
}

offset = 5.0;

/*%translate([0, 0, -W/2 + Pt/2 - offset]) linear_extrude(height = Pt, scale = 1.0, center=true) {
  hull() {
    translate([0,-H/2]) circle(d=T-wp);
    translate([0, H/2]) circle(d=T-wp);
  }
}*/

pdi = 1.0;  // Диаметр резинового уплотнителя.

/*hull()*/{


  // Пробка
  translate([0, 0, -W/2 + Pt/2 - offset]) {

    translate([0, H/2, 0]) {
      difference() {
        cylinder(d = T-wp, h=Pt, center=true);
        rotate_extrude() {
          translate([T/2 - pdi/2, 0, 0]) circle(d = pdi);
        }
      }
    }

    translate([0,-H/2, 0]) {
      difference() {
        cylinder(d = T-wp, h=Pt, center=true);
        rotate_extrude() {
          translate([T/2 - pdi/2, 0, 0]) circle(d = pdi);
        }
      }
    }

    difference() {
      cube([T-wp, H, Pt], center=true);
      rotate([90, 0, 0]) {
        translate([-T/2+wp/2, 0, 0]) cylinder(d=pdi, h=H, center=true);
      }
      rotate([90, 0, 0]) {
        translate([ T/2-wp/2, 0, 0]) cylinder(d=pdi, h=H, center=true);
      }

    }

  }

}
