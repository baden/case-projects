include <library.scad>


// Под магнит 50х30х10 (40кг)

$fn = 64;

if(true) {

  translate([ 24.5, 0, 0]) akk18650();
  translate([-24.5, 0, 0]) akk18650();
  
  // Магниты
  /*translate([ 33, -5, 0]) cube([8,8,55], center=true);*/
  /*translate([-33, -5, 0]) cube([8,8,55], center=true);*/

  /*translate([-34, -7, 38/2+0.5]) cube([12,6,38], center=true);
  translate([-34, -7,-38/2-0.5]) cube([12,6,38], center=true);
  
  translate([ 34, -7, 38/2+0.5]) cube([12,6,38], center=true);
  translate([ 34, -7,-38/2-0.5]) cube([12,6,38], center=true);*/

  translate([0, -4, 0]) cube([30,10,50], center=true);

}


// PCB

GPS=18;

if(true) {
  translate([0,5,0]) rotate([90,90,0]){
    color("Green") 
      translate([0, 0, 0])
        cube([50,30,1.6], center=true);
      
    color("Black") {
      translate([0,-8,1.6/2]) cube([16,16,2.5]);
    }
    color("Gray") {
      translate([-GPS/2,-GPS/2,-1.6/2-2.5]) cube([GPS,GPS,2.5]);
    }
  }
}


// Корпус

L = 66;

module hand() {
  rotate([-90, 0, 0]) {
    difference() {
      cylinder(d1=6, d2=5, h=3.0);
      translate([ 0, 0, 0.1]) cylinder(d=1.5, h=33);
    }
  }
}

module shape() {
  hull() {
    translate([-24.5,0]) circle(d=18.5+2);
    translate([ 24.5,0]) circle(d=18.5+2);
    /*translate([-20,7]) circle(d=9);
    translate([ 20,7]) circle(d=9);*/
  }
}

color("red")
difference() {
  
union(){

linear_extrude(height = L, center=true) {
  union() {
    difference() {
      shape();
      
      // Под аккумуляторы
      translate([-24.5,0]) circle(d=18.5);
      translate([ 24.5,0]) circle(d=18.5);
      
      // Полость для платы и магнита.
      translate([ 0, 0.25]) square(size=[48, 18], center=true);
      
      // Формы на дне
      translate([ 0, -7]) square(size=[30.5, 4.5], center=true);
      
      // Монтажное окно
      /*translate([ 0, 10]) square(size=[36, 5], center=true);
      translate([ 19.5, 11.5]) square(size=[1,2], center=true);
      translate([-19.5, 11.5]) square(size=[1,2], center=true);*/
    }
    /*translate([-16,-9]) square(size=[6, 1], center=true);*/
    /*translate([ 13.2,-9]) square(size=[1, 2], center=true);*/
    
  }
}


// Боковые стенки
  /*translate([0, 0,-L/2-1]) linear_extrude(height = 2, center=true) difference() {
    shape();
  }*/

  translate([0, 0, L/2-1]) linear_extrude(height = 2, center=true) difference() {
    shape();
    hull() {
      translate([-31/2+1,-18/2+1]) circle(r=1);
      translate([ 31/2-1,-18/2+1]) circle(r=1);
      translate([-31/2+1, 18/2-1]) circle(r=1);
      translate([ 31/2-1, 18/2-1]) circle(r=1);
    }
  }

  /*translate([0, 0,-L/2-1]) difference() {
    linear_extrude(height = 2, center=true) difference() {
      shape();
      translate([-19.5, 11.5]) square(size=[1,2], center=true);
      translate([ 19.5, 11.5]) square(size=[1,2], center=true);
    }
    translate([ 0, 11.5,-1]) cube(size=[40,2,2], center=true);
  }

  mirror([0,0,1]) translate([0, 0,-L/2-1]) difference() {
    linear_extrude(height = 2, center=true) difference() {
      shape();
      translate([-19.5, 11.5]) square(size=[1,2], center=true);
      translate([ 19.5, 11.5]) square(size=[1,2], center=true);
    }
    translate([ 0, 11.5,-1]) cube(size=[40,2,2], center=true);
  }*/



  /*translate([-18.5/2, -9.6, -L/2+5]) hand();
  translate([ 18.5/2, -9.6, -L/2+5]) hand();
  translate([-18.5/2, -9.6,  L/2-5]) hand();
  translate([ 18.5/2, -9.6,  L/2-5]) hand();*/

}
  // Монтажное окно
  /*%translate([ 0, 0, -L/2]) cube([36, 18.5, 5], center=true);*/

/*translate([50,0,50]) cube([100,100,100], center=true);*/
}

// Ориентир
translate([0,11,0]) cube([1,1,1], center=true);

// Крышка
if(false){
  
color([1,1,0.5])
translate([0, 12.1, 0]) {
  difference() {
    cube([40, 3, L+4], center=true);
    
    // Выборка под GPS-антенну 35х35
    translate([0, -1, 0]) cube([35, 1.75, L-1], center=true);
    
    // Выборка под уплотнительную резинку
    translate([-18.5,-0.51, 0]) cube([1.5, 2.0, L+2], center=true);
    translate([ 18.5,-0.51, 0]) cube([1.5, 2.0, L+2], center=true);
    
    translate([ 0,-0.51,-L/2-0.5]) cube([38, 2.0, 1.5], center=true);
    translate([ 0,-0.51, L/2+0.5]) cube([38, 2.0, 1.5], center=true);

    /*translate([50,0,50]) cube([100,100,100], center=true);*/

  }
}
}

