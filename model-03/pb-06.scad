include <library.scad>


// Под магнит 50х15х15 (35кг?)

$fn = 64;
GPS=18;

if(false) {
  
  rotate([90,0,0]) {
    translate([-18.5, 0, 0]) akk18650();
    translate([  0.0, 0, 0]) akk18650();
    translate([ 18.5, 0, 0]) akk18650();
  }
    
    // Магниты
    /*translate([ 33, -5, 0]) cube([8,8,55], center=true);*/
    /*translate([-33, -5, 0]) cube([8,8,55], center=true);*/
    
    /*translate([-34, -7, 38/2+0.5]) cube([12,6,38], center=true);
    translate([-34, -7,-38/2-0.5]) cube([12,6,38], center=true);
    
    translate([ 34, -7, 38/2+0.5]) cube([12,6,38], center=true);
    translate([ 34, -7,-38/2-0.5]) cube([12,6,38], center=true);*/
    
  /*translate([-35.5, 0, -2.5]) color([0.8,0.8,0.8]) cube([15,50,15], center=true);
  translate([ 35.5, 0, -2.5]) color([0.8,0.8,0.8]) cube([15,50,15], center=true);*/


  translate([-W/2-1,-H/2-1, -19]) M4();

  // PCB


  translate([-36.7,0,6.2]) rotate([0,180,90]){
    color("Green") 
      translate([0, 0, 0])
        cube([40,18,1.6], center=true);
      
    color("Black") {
      translate([0,-8,1.6/2]) cube([16,16,2.5]);
    }
    color("Gray") {
      translate([-GPS/2,-GPS/2,-1.6/2-2.5]) cube([GPS,GPS,2.5]);
    }
  }

}




// Корпус

W = 84; // Длинная сторона
H = 60; // Короткая сторона

rC = 6; // Радиус скругления вертикальных граней

tV = 2; // Толщина вертикальных сренок

color("red") {
  
  difference() {
    union() {
      
      // Донышко
      translate([0, 0,-10]) linear_extrude(height = 2, center = true) {
        hull() {
          translate([-W/2,-H/2]) circle(r=rC);
          translate([ W/2,-H/2]) circle(r=rC);
          translate([-W/2, H/2]) circle(r=rC);
          translate([ W/2, H/2]) circle(r=rC);
        }
      }
      
      // Вертикальные стенки
      translate([0, 0, 0]) linear_extrude(height = 18, center = true) difference() {
        hull() {
          translate([-W/2,-H/2]) circle(r=rC);
          translate([ W/2,-H/2]) circle(r=rC);
          translate([-W/2, H/2]) circle(r=rC);
          translate([ W/2, H/2]) circle(r=rC);
        }
        hull() {
          translate([-W/2+p1,-H/2-p2]) circle(r=1);
          translate([-W/2-p2,-H/2+p3]) circle(r=1);
          translate([ W/2-p1,-H/2-p2]) circle(r=1);
          translate([ W/2+p2,-H/2+p3]) circle(r=1);
          translate([-W/2+p1, H/2+p2]) circle(r=1);
          translate([-W/2-p2, H/2-p3]) circle(r=1);
          translate([ W/2-p1, H/2+p2]) circle(r=1);
          translate([ W/2+p2, H/2-p3]) circle(r=1);
        }
      }
      
      /*translate([0, 0, 0]) linear_extrude(height = 18, center = true) {
        translate([-W/2-1,-H/2-1]) circle(r=5);
        translate([ W/2+1,-H/2-1]) circle(r=5);
        translate([-W/2-1, H/2+1]) circle(r=5);
        translate([ W/2+1, H/2+1]) circle(r=5);
      }*/
      
      p1 = 17;
      p2 = 3;
      p3 = 7;
    
      // Ботртик для уплотнительной резинки
      translate([0, 0, 9]) linear_extrude(height = 1, center = true) difference() {
        hull() {
          translate([-W/2+p1,-H/2-p2]) circle(r=2);
          translate([-W/2-p2,-H/2+p3]) circle(r=2);
          translate([ W/2-p1,-H/2-p2]) circle(r=2);
          translate([ W/2+p2,-H/2+p3]) circle(r=2);
          translate([-W/2+p1, H/2+p2]) circle(r=2);
          translate([-W/2-p2, H/2-p3]) circle(r=2);
          translate([ W/2-p1, H/2+p2]) circle(r=2);
          translate([ W/2+p2, H/2-p3]) circle(r=2);
        }
        hull() {
          translate([-W/2+p1,-H/2-p2]) circle(r=1);
          translate([-W/2-p2,-H/2+p3]) circle(r=1);
          translate([ W/2-p1,-H/2-p2]) circle(r=1);
          translate([ W/2+p2,-H/2+p3]) circle(r=1);
          translate([-W/2+p1, H/2+p2]) circle(r=1);
          translate([-W/2-p2, H/2-p3]) circle(r=1);
          translate([ W/2-p1, H/2+p2]) circle(r=1);
          translate([ W/2+p2, H/2-p3]) circle(r=1);
        }
      }
      
    }
    
    // Крепежные отверстия
    translate([0, 0, 0]) linear_extrude(height = 25, center = true) {
      translate([-W/2-0.5,-H/2-0.5]) circle(r=2);
      translate([ W/2+0.5,-H/2-0.5]) circle(r=2);
      translate([-W/2-0.5, H/2+0.5]) circle(r=2);
      translate([ W/2+0.5, H/2+0.5]) circle(r=2);
    }

    /*translate([0, 0,-10]) linear_extrude(height = 20, center = true) {
      translate([-W/2-1,-H/2-1]) circle(r=3.5);
      translate([ W/2+1,-H/2-1]) circle(r=3.5);
      translate([-W/2-1, H/2+1]) circle(r=3.5);
      translate([ W/2+1, H/2+1]) circle(r=3.5);
    }*/
    translate([-W/2-0.5,-H/2-0.5,-6]) rotate([0,0,32]) cylinder(r=7/2 / cos(30), h=20, center=true, $fn=6);
    mirror([1,0,0]) translate([-W/2-0.5,-H/2-0.5,-6]) rotate([0,0,32]) cylinder(r=7/2 / cos(30), h=20, center=true, $fn=6);
    mirror([0,1,0]) translate([-W/2-0.5,-H/2-0.5,-6]) rotate([0,0,32]) cylinder(r=7/2 / cos(30), h=20, center=true, $fn=6);
    mirror([0,1,0]) mirror([1,0,0]) translate([-W/2-0.5,-H/2-0.5,-6]) rotate([0,0,32]) cylinder(r=7/2 / cos(30), h=20, center=true, $fn=6);

    
    // Выемки под магниты
    translate([-35.5, 0, -2.5]) cube([15,50,15], center=true);
    translate([ 35.5, 0, -2.5]) cube([15,50,15], center=true);
    
    /*translate([0, 50, 0]) cube([100,100,100], center=true);*/
    
  }


    

}


// Ориентир
/*color("lime") translate([-48,10,0]) cube([1,1,1], center=true);*/

module M(d,s,l) {
  difference() {
    cylinder(r=s/2 / cos(30), h=l, center=true, $fn=6);
    cylinder(r=d/2, h=l+1, center=true);
  }
  cube([4,4,0.1], center=true);
}

// Гайка М2
/*Диаметр отверстия d: 2 (мм);
Размер «под ключ» s: 4 (мм);
Шаг резьбы: 0.40 (мм);
Высота l: 1.6 (мм).*/
module M2() {
  M(2,4,1.6);
}

/*Размеры гайки М3:
Диаметр отверстия d: 3 (мм);
Размер «под ключ» s: 5.5 (мм);
Шаг резьбы (крупный): 0.5 (мм);
Шаг резьбы (мелкий): нет;
Высота l: 2.4 (мм).*/

module M3() {
  M(3,5.5,2.4);
}

/*Размеры гайки М4:
Диаметр отверстия d: 4 (мм);
Размер «под ключ» s: 7 (мм);
Шаг резьбы (крупный): 0.7 (мм);
Шаг резьбы (мелкий): нет;
Высота l: 3.2 (мм).*/

module M4() {
  M(4,7,3.2);
}



// Крышка

if(false) {
  // Донышко
  translate([0, 0, 18]) linear_extrude(height = 3, center = true) {
    hull() {
      translate([-W/2,-H/2]) circle(r=rC);
      translate([ W/2,-H/2]) circle(r=rC);
      translate([-W/2, H/2]) circle(r=rC);
      translate([ W/2, H/2]) circle(r=rC);
    }
  }

  /*// Вертикальные стенки
  translate([0, 0, 0]) linear_extrude(height = 18, center = true) difference() {
    hull() {
      translate([-W/2,-H/2]) circle(r=rC);
      translate([ W/2,-H/2]) circle(r=rC);
      translate([-W/2, H/2]) circle(r=rC);
      translate([ W/2, H/2]) circle(r=rC);
    }
    hull() {
      translate([-W/2+p1,-H/2-p2]) circle(r=1);
      translate([-W/2-p2,-H/2+p3]) circle(r=1);
      translate([ W/2-p1,-H/2-p2]) circle(r=1);
      translate([ W/2+p2,-H/2+p3]) circle(r=1);
      translate([-W/2+p1, H/2+p2]) circle(r=1);
      translate([-W/2-p2, H/2-p3]) circle(r=1);
      translate([ W/2-p1, H/2+p2]) circle(r=1);
      translate([ W/2+p2, H/2-p3]) circle(r=1);
    }
  }*/
  
}



