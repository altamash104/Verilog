/*
1. $display or $write displays the specified variable when command is executed in the code flow
2. $display automatically adds a newline character to the end of its output where as  the $write task does not
              $write --------->
              |$display
              |
              |
              \/ 
3. $display and $write lies inside the active region of the veirfied stratified event queue events suitable for blocking statement.
4.     %h or %H -Hexadecimal format
      %d  or %D -Decimal format
      %o  or %O -Octal format
      %b  or %B -Binary format
      %m  or %M -Hierarchical name
      %s  or %S -String
      %t        -Time units
5.System task are not synthesizable
*/

module disp;
  reg[15:0]mreg;
  initial
    begin
      $display("mreg=%h hex, %d decimal",mreg,mreg);
      $display("mreg=%o octal\n,mreg=%b bins",mreg,mreg);// \n will take it to next line.
      $display("current scope is %m"); // it  will display the class name "disp"
      $display("simulation time is =%0t",$time);
    end
endmodule
/*
mreg=xxxx hex , x decimal
mreg=xxxxxx octal
,mreg=xxxxxxxxxxxxxxxx bins
current scope is disp
simulation time is =0
*/


// $strobe- it will display data at the end of simulation time,when all the simulation events that have occured for that simulation time.
module display_check();
  reg [1:0]a;
  initial
    begin
      a=2'd0;
      $strobe ("strobe1: value of a=%0d",a,$time); //here current simulation time is 0ns so $strobe will show only value at 0ns 
      $display("Display1 :value of a=%0d",a,$time);
      a=2'd1;
      #5;
      a=2'd2;
      $strobe ("strobe2: value of a=%0d",a,$time);//here current simulation time is 5ns so $strobe will show only value at 3
      $display("Display2 :value of a=%0d",a,$time);
      a=2'd3;
      #10;
      a=2'd4;
    end
endmodule


/*
Display1 :value of a=0                   0
strobe1: value of a=1                   0
Display2 :value of a=2                   5
strobe2: value of a=3                   5
*/

//$Monitor Each time a variable or an expression in the argument list changes value ,the entire argument list is displayed at the end of the time step.
module monitor_check();
  reg[1:0]a;
  initial
    begin
      a=2'b00;
      #5 a=2'b01;
      #5 a=2'b10;
      #5 a=2'b11;
    end
  $monitor("Display: value of a is %b",a);
endmodule
/*
Display: value of a is 11
*/
