hull() {
  translate([0,0,0]) cube([30,30,10], center=true);
  translate([0,0,8]) cube([18,18,4], center=true);
  translate([20,0,0]) cylinder(d=10,h=10,center=true);
  translate([-20,0,0]) cylinder(d=10,h=10,center=true);
}
