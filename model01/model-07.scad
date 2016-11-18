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

  // Плата GSM-антенны
  color("Green") {
    translate([-30/2+1.6/2, 0, 1]) {
      rotate([0, 90, 0]) {
        cube([6, 25, 1.6], center=true);
      }
    }
  }

  // Кнопка
  translate([0, -13.0, 0]) {
    color("Silver") translate([0, 0, 1.5/2]) cube([6, 3.5, 1.5], center=true);
    color("White")  translate([0, 0, 2.4/2]) cube([2.6, 1.2, 2.4], center=true);
  }

  // Аккумулятор 30х30х6 (550мАч)
  color("Silver") translate([0,0,-6/2-1.6-0.5]) cube([30, 30, 6], center=true);
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
  color("Silver") translate([0, 30/2 + 10/2 + 1.0, -4]) r_cube(25, 10, 10, 1);
  color("Silver") translate([0,-30/2 - 10/2 - 1.0, -4]) r_cube(25, 10, 10, 1);
}


mb();
magnetes();
