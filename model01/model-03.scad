$fn = 32;

W = 85.60;
H = 53.98;
T =  0.90;
R =  3.00; // 2.88..3.48

Wp = 78.00;
Hp = 48.00;
Tp = 5.50;

wt = 0.5;

if(1) {
  difference() {

    hull() {
      translate([ W/2 - R,  H/2 - R, 0]) cylinder(r=R, h=T, center=true);
      translate([-W/2 + R,  H/2 - R, 0]) cylinder(r=R, h=T, center=true);
      translate([ W/2 - R, -H/2 + R, 0]) cylinder(r=R, h=T, center=true);
      translate([-W/2 + R, -H/2 + R, 0]) cylinder(r=R, h=T, center=true);

      translate([ Wp/2 - R,  Hp/2 - R, 0]) cylinder(r=R, h=Tp, center=true);
      translate([-Wp/2 + R,  Hp/2 - R, 0]) cylinder(r=R, h=Tp, center=true);
      translate([ Wp/2 - R, -Hp/2 + R, 0]) cylinder(r=R, h=Tp, center=true);
      translate([-Wp/2 + R, -Hp/2 + R, 0]) cylinder(r=R, h=Tp, center=true);
    }


    hull(){
      translate([ W/2 - R - wt,  H/2 - R - wt, 0]) cylinder(r=R, h=T - wt, center=true);
      translate([-W/2 + R + wt,  H/2 - R - wt, 0]) cylinder(r=R, h=T - wt, center=true);
      translate([ W/2 - R - wt, -H/2 + R + wt, 0]) cylinder(r=R, h=T - wt, center=true);
      translate([-W/2 + R + wt, -H/2 + R + wt, 0]) cylinder(r=R, h=T - wt, center=true);

      translate([ Wp/2 - R - wt,  Hp/2 - R - wt, 0]) cylinder(r=R, h=Tp - wt*2, center=true);
      translate([-Wp/2 + R + wt,  Hp/2 - R - wt, 0]) cylinder(r=R, h=Tp - wt*2, center=true);
      translate([ Wp/2 - R - wt, -Hp/2 + R + wt, 0]) cylinder(r=R, h=Tp - wt*2, center=true);
      translate([-Wp/2 + R + wt, -Hp/2 + R + wt, 0]) cylinder(r=R, h=Tp - wt*2, center=true);

    }
    translate([-W/2, H/2, 0]) cube([W+1, H+1, Tp+1], center=true);
  }

}

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
