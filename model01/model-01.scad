
$fn = 128;

// GPS-антенна 35х35х4
G_W=35;
G_H=4;

// Магнит: шайба - 62-42x15
M_DO=62;
M_DI=42;
M_H=15;

// Печатная плата - 1.6mm
P_H = 1.6;

// Аккумулятор 20x35x8 (500mAh)
A_W = 20;
A_H = 35;
A_T = 10.0;

TZ = 0.1; // Тепловой зазор.

// Корпус

W_T = 1.0;
W_O = 1.0;


module antenna() {
  // GPS-антенна 25х25х4
  /*color("LightGrey") translate([0,0,7]) cube([25,25,4], center=true);*/
  // GPS-антенна 35х35х4
  translate([0, 0, M_H/2 + G_H/2])
  color("LightGrey")
  cube([G_W, G_W, G_H], center=true);
}

// Печатная плата
module pcb() {
  translate([0, 0, M_H/2 - P_H/2])
  color("Green") {
    cylinder(d=M_DI-TZ, h=P_H, center=true);
  }

  // Компоненты.
  C_H = 2.5;  // Максимальная высота компонентов.
  translate([0, 0, M_H/2 - P_H - C_H/2])
  color("Black") {
    // SIM800C
    translate([3, 0, 0]) cube([16, 18, C_H], center=true);
  }
}

module akkumulator() {
  // Аккумулятор
  color("Silver") {
    translate([0, 0, -2]) cube([A_W,A_H,A_T], center=true);
  }
}

module magnite() {
  // Магнит:

  // http://magnetix.com.ua/
  /*color("Silver") {*/
  color([1,1,1,0.5]) {
    difference() {
      cylinder(d=M_DO,h=M_H,center=true);
      cylinder(d=M_DI,h=M_H+1,center=true);
    }
  }
}

module case() {
  difference() {
    hull() {
      // Верхняя стенка
      translate([0, 0, M_H/2 + G_H + W_T/2 + W_O])
      cube([G_W, G_W, W_T], center=true);

      translate([0, 0, M_H/2 + G_H + W_T/2 + W_O])
      cube([5, 5, 3], center=true);

      // Кольцо
      cylinder(d=M_DO + (W_T + W_O)*2, h=M_H + W_T*2,center=true);
    }

    hull() {
      translate([0, 0, M_H/2 + G_H + W_T/2])
        cube([G_W, G_W, W_T], center=true);
      translate([0, 0, M_H/2 + G_H + W_T/2])
        cube([5, 5, 3], center=true);
      translate([0,0,-W_O]) cylinder(d=M_DO + (W_O)*2, h=M_H+W_O*2,center=true);
    }
  }


}

offset = 57 * (1-$t);
echo(offset);

difference() {

  union() {
    translate([0, 0, offset*0.6]) antenna();
    translate([0, 0, offset*0.45]) pcb();
    translate([0, 0, offset*0.35]) akkumulator();
    translate([0, 0, 0]) magnite();
    translate([0, 0, offset*1.0]) case();
  }

  translate([70, 20, 0]) rotate([0,0,60]) cube([100, 100, 150], center=true);
}
