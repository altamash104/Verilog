/*
1.The `timscale compiler directive is used to set the time unit and time precision for the simulation
  syntax:- `timescale time_unit/time_precision
  1.time_unit:-specifies the basic time unit used in the simulation
  2.time_precision:-specifies the time precision
  time unit:-1.this represents base unit for simulation time.
             2.common value are 1ns(nano second),1us(micro second),1ms(millisecond) etc
             3.all the delays are multiplied with time unit.
  time precision:-specifies delay values are rounded off before being used in simulation.common value are 1ps(pico second),1ns(nano second)
  3. time_unit>=time_precision
     ex-`timescale 1ns/1ns:- time unit is 1 nano second and time precision is 1 nano second
  4.note:- `timescale 1ns/1ns--> divide-> time_unit/time_precision=1ns/1ns=10 raise to 0 then fractional part of the delay will be ignored.
           #12.5; delay will be rounded of to 13.
           `timescale 1ns/1ps--> divide->time_unit/time_precision=1ns/1ps=10^3 i.e three places will be there after a decimal point i.e ._ _ _
           #12.5; delay will be 12.5
  5. Limitation :-`timescale directive can result in file order dependency problem.
                To overcome this problem we use $timeformat(unit_number,precision_num,suffix_string,minimum_field_width)
*/
\\\\\\\\\\\\\\\\\\\-------clock generation------//////////////////
`timescale 10ns/10ps
module clk_gen();
  reg clk;
  initial
    begin
      clk=1'b0;
      forever #10 clk=~clk;//10 time unit multiply with given delay which will equal to 100ns.
    end
  
  initial
    begin
      $dumpfile("dump.vcd");
      $dumpvars;
      #500 $finish;
    end
  
endmodule
/////////////////////////////////////////////////
`timescale 10ns/1ns
module test;
parameter p=15.5;
reg a;

initial
  begin
    $monitor("value of a=%b",a,$time);
    #p a=1'b1;
    #p a=1'b0;
  end
endmodule
/*
value of a=x                   0
value of a=1                  16
value of a=0                  31
*/

/////////////////////////////////////////////

`timescale 1ns/1ns
module test;
  reg a;
parameter p=15.5;
initial
  begin
    $monitor("Value of a =%0b",a,$time);
     //$time -returns integer time
    #p a=1'b1;
    #p a=1'b0;
  end
endmodule
/*
value of a=x                   0
value of a=1                  16
value of a=0                  32
*/
///////////////////////////////////////////
`timescale 10ns/1ns
module test;
parameter p=15.5;
reg a;

initial
  begin
    $monitor("value of a=%b",a,$realtime);
    
    #p a=1'b1;
    #p a=1'b0;
  end
endmodule
/////////////////////////////////////////
`timescale 1ns/1ns
module test;
  initial
    begin
      #12.5;
      $display($realtime);
      //$realtime -returns real time i.e time in decimal point
    end
endmodule

/////////////////////////////////////////
`timescale 1ns/1ps
module test;
  initial
    begin
      #12.5;
      $display($realtime);
    end
endmodule
//note:-if unit_time and unit_precision have same value then decimal value will always converted to  nearest integer.
