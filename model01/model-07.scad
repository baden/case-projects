$fn=16;

module mb() {
  // Плата 30x30x1.6
  color("Green") translate([0,0,-1.6/2]) cube([30, 30, 1.6], center=true);

  // Антенна 25x25x4 (чуть смещена)
  color([0.9,0.9,0.9]) {
    translate([1.5, 2, 4/2]) {
      cube([25, 25, 4], center=true);
    }
  }

  // Компоненты
  color("Black") translate([0, 0, -1.6-2.5/2]) {
    cube([18, 20, 2.5], center=true);
  }

  // Плата GSM-антенны
  color("Green") {
    translate([-30/2+1.6/2+0.0, 0, -0.5]) {
      rotate([0, 90, 0]) {
        cube([7, 25, 1.6], center=true);
      }
    }
  }

  // Кнопка
  translate([0, -13.0, 0]) {
    color("Silver") translate([0, 0, 1.5/2]) cube([6, 3.5, 1.5], center=true);
    color("White")  translate([0, 0, 2.4/2]) cube([2.6, 1.2, 2.4], center=true);
  }

  // Аккумулятор 30х30х6 (550мАч)
  color("Silver") translate([0,0,-6/2-1.6-2.5]) cube([30, 30, 6], center=true);
}

module r_cube(x, y, z, r) {
  hull() {
    translate([ x/2-r, y/2-r, z/2-r]) sphere(r=1);
    translate([-x/2+r, y/2-r, z/2-r]) sphere(r=1);
    translate([ x/2-r,-y/2+r, z/2-r]) sphere(r=1);
    translate([-x/2+r,-y/2+r, z/2-r]) sphere(r=1);
    translate([ x/2-r, y/2-r,-z/2+r]) sphere(r=1);
    translate([-x/2+r, y/2-r,-z/2+r]) sphere(r=1);
    translate([ x/2-r,-y/2+r,-z/2+r]) sphere(r=1);
    translate([-x/2+r,-y/2+r,-z/2+r]) sphere(r=1);
  }
}

module magnetes() {
  // Магниты 25x10x10 (10кг)
  color("Silver") translate([0, 30/2 + 10/2 + 1.0, -5.5]) r_cube(25, 10, 10, 1);
  color("Silver") translate([0,-30/2 - 10/2 - 1.0, -5.5]) r_cube(25, 10, 10, 1);
}

// Корпус

module case(args) {

  translate([0, 0, -3]) {
    difference() {
      cube(size=[32, 32, 16], center=true);
      cube(size=[30, 30, 14], center=true);
    }
  }
  translate([0, 21, -5.25]) cube(size=[27, 12, 11.5], center=true);
  translate([0,-21, -5.25]) cube(size=[27, 12, 11.5], center=true);

  /*// body...
  difference() {
    hull() {
      translate([0, 0, 4.5]) {
        cube(size=[32, 30, 1], center=true);
      }
      translate([0, 0, -0.5]) {
        cube(size=[32, 54, 1], center=true);
      }
      translate([0, 0, -10.5]) {
        cube(size=[32, 54, 1], center=true);
      }
    }

    hull() {
      translate([0, 0, 3.5]) {
        cube(size=[30, 28, 1], center=true);
      }
      translate([0, 0, -0.5]) {
        cube(size=[30, 52, 1], center=true);
      }
      translate([0, 0, -9.5]) {
        cube(size=[30, 52, 1], center=true);
      }
    }
  }*/
}

// Шурупик :)
module shurup1() {
  translate([0,0,-7/2-1.5/2]) cylinder(d1=4.8, d2=1.8, h=1.5, center=true);
  cylinder(d1=1.8, d2=1.0, h=7, center=true);
}



//mb();
//magnetes();
translate([0, 0, 0]) {
  difference() {
    case();
    translate([50, 0, 0]) {
    //  cube([100,100,100], center=true);
    }

  }
}
translate([15, 21, -5]) shurup1();
