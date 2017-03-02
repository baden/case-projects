include <library.scad>

$fn = 64;

if(false) {

  translate([  0.0, 0, 5]) akk18650();
  translate([ 18.5, 0, 5]) akk18650();
  translate([-18.5, 0, 5]) akk18650();
  
  // Магниты
  /*translate([ 33, -5, 0]) cube([8,8,55], center=true);*/
  /*translate([-33, -5, 0]) cube([8,8,55], center=true);*/

  translate([-34, -7, 38/2+0.5]) cube([12,6,38], center=true);
  translate([-34, -7,-38/2-0.5]) cube([12,6,38], center=true);
  
  translate([ 34, -7, 38/2+0.5]) cube([12,6,38], center=true);
  translate([ 34, -7,-38/2-0.5]) cube([12,6,38], center=true);

  translate([-64, -7, 38/2+0.5]) cube([15,15,50], center=true);

}


// PCB

if(false) {
  translate([0,0,-65/2]) {
    color("Green") {
      linear_extrude(height=1.6, center=true) hull() {
        translate([-18.5, 0]) circle(r=9);
        translate([ 18.5, 0]) circle(r=9);  
      }
    }
    color("Black") {
      translate([0,-8,1.6/2]) cube([16,16,2.5]);
    }
    color("Gray") {
      translate([-9,-9,-1.6/2-2.5]) cube([18,18,2.5]);
    }
  }
}


// Корпус

color("red")

difference() {
  

  linear_extrude(height = 79.0, center=true) {

    hull() {

      translate([-40,-9.5]) circle(r=1);
      translate([ 40,-9.5]) circle(r=1);

      translate([-40,-3]) circle(r=1);
      translate([ 40,-3]) circle(r=1);

      translate([-18.5, 0]) circle(r=10.5);
      translate([ 18.5, 0]) circle(r=10.5);
    }
  }

  // Полости под магниты
  translate([-34, -8, 38/2+0.5]) cube([12, 7, 38], center=true);
  translate([-34, -8,-38/2-0.5]) cube([12, 7, 38], center=true);

  translate([ 34, -8, 38/2+0.5]) cube([12, 7, 38], center=true);
  translate([ 34, -8,-38/2-0.5]) cube([12, 7, 38], center=true);

  /*translate([-64, -7, 38/2+0.5]) cube([15, 15, 50], center=true);*/

  // Полости под аккумуляторы
  translate([0, 0, -1]) linear_extrude(height = 79.0, center=true) {
    translate([ 18.5, 0]) circle(d = 18.5);
    translate([    0, 0]) circle(d = 18.5);
    translate([-18.5, 0]) circle(d = 18.5);
    translate([0, 0]) square(size=[30, 10], center=true);
  }

  // Полость под плату

  translate([0,0,-65/2-3])
  linear_extrude(height=14, center=true) hull() {
    translate([-18.5, 0]) circle(d=18.5);
    translate([ 18.5, 0]) circle(d=18.5);
    translate([-28, 1]) circle(d=6);
    translate([ 28, 1]) circle(d=6);
    /*translate([0, -8]) square(size=[55.5, 10], center=true);*/
  }

  // зацепы для крыщки
  translate([ 18.5/2, -7.5, -29]) {
    cylinder(d=3, h=3);  
  }
  translate([-18.5/2, -7.5, -29]) {
    cylinder(d=3, h=3);  
  }

  /*translate([50,0,0]) cube([100,100,100], center=true);*/
}


// крепежные столбики

/*color("blue")
{
  translate([ 18.5/2, 10, -36.5]) rotate([90, 0, 0]) {
    difference() {
      cylinder(d1=6, d2=5, h=4);  
      translate([ 0, 0, 0.1]) cylinder(d=1.5, h=5);  
      
    }
  }

  translate([-18.5/2, 10, -36.5]) rotate([90, 0, 0]) {
    difference() {
      cylinder(d1=6, d2=5, h=4);  
      translate([ 0, 0, 0.1]) cylinder(d=1.5, h=5);  
      
    }
  }

}*/

/*color("lime") {
  translate([0,0,-65/2-13])
}*/



