//Q1.what value of a is displayed on the console output?justify the same.
module test();
  reg[1:0]a;
  initial
    begin
      $display($time,"a=%d",a);
      a=2'd3;
      #10;
      a=2'd2;
      
    end
endmodule
/*
0a=x
a is reg type hence default value is unknown
because $display will be executed at t=0 in this snippet and a is not initialized before the execution of $display
*/

//Q2.What is the value of b displayed on the console output?
module test();
  reg[1:0]b;
  initial
    begin
      $strobe("b=%0d",b,$time);
      b=2'd3;
      b=2'dx;
      #10;
      b=2'd2;
      
    end
endmodule

/*
output:0b=x    t=5
even though $strobe is scheduled to execute at the end of current simulation time the value of 3 in b is over written with x before
the execution of $strobe.
*/
//Q3.what values are monitored for b till the end of simulation time ?
module test();
  reg[1:0]b;
  initial
    begin
      $monitor("b=%0d",b,$time);
      b=2'd0;
      b=2'dx;  //0ns b=x
      #10;
      b=2'd2;  //10ns b=2
      #10;
      b=2'd1;   //no o/p bcz of the $monitoroff at 20 time units
      $monitoroff;
      #10;
      b=2'd2;
      $monitoron;  // 30ns b=2 bcz $monitor is enabled
      #10;
      b=2'd1;
      #100 $finish  //40ns b=1;
    end
endmodule

/*
simulation output:
b=x                   0
b=2                  10
b=2                  30
b=1                  40
*/
