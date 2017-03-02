include <library.scad>

$fn = 64;

  akk18650();
  translate([ 9.25, 16, 0]) akk18650();
  translate([-9.25, 16, 0]) akk18650();


// Магниты
translate([ 15, -5, 0]) cube([8,8,55], center=true);
translate([-15, -5, 0]) cube([8,8,55], center=true);

// Корпус

w_t = 1.0;  // Толщина стенки корпуса.

if(false) {

difference() {

  translate([0, 0, 2])
  linear_extrude(height = 71.0, center=true) {
    hull() {
      translate([ 18.5, 0, 0]) circle(d = 19 + 2*w_t);
      translate([-18.5, 0, 0]) circle(d = 19 + 2*w_t);
    }
  }

  translate([0, 0, 5]) linear_extrude(height = 75.0, center=true) {
    translate([ 18.5, 0, 0]) circle(d = 19);
    translate([    0, 0, 0]) circle(d = 19);
    translate([-18.5, 0, 0]) circle(d = 19);
  }
  translate([0, 0, 5]) cube([30,10,75], center=true);
  
  translate([0, 0, 38]) linear_extrude(height = 8.0, center=true) {
    hull() {
      translate([ 18.5, 0, 0]) circle(d = 19);
      translate([-18.5, 0, 0]) circle(d = 19);
    }
  }

  /*translate([0,50,0]) cube([100,100,100], center=true);*/

}


}