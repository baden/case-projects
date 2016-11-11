$fn = 128;

W = 85.60;
H = 53.98;
T =  0.90;
R =  5.50; // 2.88..3.48

Wp = 78.00;
Hp = 48.00;
Tp = 5.50;

wt = 0.5;

/*pi_2 = 3.141592654 / 2;*/

h = (Tp-T) / 2; // Высота сужающегося в ноль угла.
/*r = R;          // Внешний радиус скругления.
theta = 45;   // 0..pi_2 Острота грани. 1.0 -> 0 градусов, 0.5 -> 45градусов, 0.0 - 90 градусов.*/

module edge1() {
  echo("h=", h);
  H1 = h + R;
  echo("H1=", H1);
  cylinder(r=R, h=T, center=true);
  difference() {
    translate([0, 0, Tp/2 - H1]) sphere(r=H1, center=true);
    translate([0, 0, T/2-H1]) {
      cube([2*H1,2*H1,2*H1], center=true);
    }
  }
}

/*echo(H);*/

if(1) {
  /*difference() {*/

    /*hull() {*/
      /*translate([ W/2 - R,  H/2 - R, 0]) cylinder(r=R, h=T, center=true);
      translate([-W/2 + R,  H/2 - R, 0]) cylinder(r=R, h=T, center=true);
      translate([ W/2 - R, -H/2 + R, 0]) cylinder(r=R, h=T, center=true);
      translate([-W/2 + R, -H/2 + R, 0]) cylinder(r=R, h=T, center=true);*/
    /*}*/


      /*translate([ Wp/2 - R,  Hp/2 - R, 0]) cylinder(r=R, h=Tp, center=true);
      translate([-Wp/2 + R,  Hp/2 - R, 0]) cylinder(r=R, h=Tp, center=true);
      translate([ Wp/2 - R, -Hp/2 + R, 0]) cylinder(r=R, h=Tp, center=true);
      translate([-Wp/2 + R, -Hp/2 + R, 0]) cylinder(r=R, h=Tp, center=true);*/

      hull(){
        translate([ W/2 - R,  H/2 - R, 0]) edge1();
        translate([-W/2 + R,  H/2 - R, 0]) edge1();
        translate([ W/2 - R, -H/2 + R, 0]) edge1();
        translate([-W/2 + R, -H/2 + R, 0]) edge1();
      }

      mirror([0,0,1]) hull(){
        translate([ W/2 - R,  H/2 - R, 0]) edge1();
        translate([-W/2 + R,  H/2 - R, 0]) edge1();
        translate([ W/2 - R, -H/2 + R, 0]) edge1();
        translate([-W/2 + R, -H/2 + R, 0]) edge1();
      }
    /*}*/


    /*hull(){
      translate([ W/2 - R - wt,  H/2 - R - wt, 0]) cylinder(r=R, h=T - wt, center=true);
      translate([-W/2 + R + wt,  H/2 - R - wt, 0]) cylinder(r=R, h=T - wt, center=true);
      translate([ W/2 - R - wt, -H/2 + R + wt, 0]) cylinder(r=R, h=T - wt, center=true);
      translate([-W/2 + R + wt, -H/2 + R + wt, 0]) cylinder(r=R, h=T - wt, center=true);

      translate([ Wp/2 - R - wt,  Hp/2 - R - wt, 0]) cylinder(r=R, h=Tp - wt*2, center=true);
      translate([-Wp/2 + R + wt,  Hp/2 - R - wt, 0]) cylinder(r=R, h=Tp - wt*2, center=true);
      translate([ Wp/2 - R - wt, -Hp/2 + R + wt, 0]) cylinder(r=R, h=Tp - wt*2, center=true);
      translate([-Wp/2 + R + wt, -Hp/2 + R + wt, 0]) cylinder(r=R, h=Tp - wt*2, center=true);

    }

    translate([-W/2, H/2, 0]) cube([W+1, H+1, Tp+1], center=true);*/
  /*}*/

}

if(0) {

  // Магнит
  color("Silver") translate([ 75/2, 0, 0]) rotate([0,0,90]) cube([40, 5, 3], center=true);
  color("Silver") translate([-75/2, 0, 0]) rotate([0,0,90]) cube([40, 5, 3], center=true);

  // PCB

  color("Green") translate([-35/2, 0, -1.25]) cube([35, 48, 1.0], center=true);
  color("Grey") translate([-11, 15, 0.25]) cube([18, 18, 2.0], center=true);

  // Аккумулятор
  color("Silver") translate([34/2, 0, 0]) rotate([0,0,90]) cube([48, 34, 4.0], center=true);


  /*translate([0,0,0]) cube([W, H, T], center=true);*/

  /*hull() {
    translate([0,0,8]) cube([18,18,4], center=true);
    translate([20,0,0]) cylinder(d=10,h=10,center=true);
    translate([-20,0,0]) cylinder(d=10,h=10,center=true);
  }*/
}
