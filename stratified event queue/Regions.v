/*
Stratified event queue
Active region- 
  evaluate blocking assignment
  evaluate RHS non-blocking assignment
  evaluate $display ,$write
  evaluate continuous assignment
Inactive  region- #0 delay statement used to avoid race condition
Non-blocking region- update LHS of NBA.
Postponed region- evalutes $strobe,$monitor.
Priority- Active-Inactive-NBA-Postponed.
Activity- of this queque is dynamic.
*/
module eg1;
  reg a,b;
  initial
    begin
      a=1;
      b=0;
      a<=b;
      b<=a;
      $display("value of a=%0b b=%0b",a,b);
    end
endmodule

//simulation ouput: value of a=1 b=0
/*when NBA & BA is used in same block NBA will override the value of BA but here we used $display which evaluates in active region &evaluates at the current simulation time hence 
we have value of a=1,b=0;*/

module eg2;
  reg a,b;
  initial
    begin
      a=1;
      b=0;
      a<=b;
      b<=a;
      $monitor ("value of a=%0b b=%0b",a,b);
    end
endmodule
//simulation ouput: value of a=0 b=1 ;we can see that NBA clearly overide the value of BA.
/////////////////////////////////////////////////////////////////
module eg3;
  reg[2:0]a;
  initial
    begin
      a<=3'd5;
      a<=#5 3'd0;
      a<=#10 3'd7;
      $monitor("value of a=%0b",a,$time);
    end
endmodule
/*
value of a=5                   0
value of a=0                   5
value of a=7                  10
*/
module eg3;
  reg[2:0]a;
  initial
    begin
      a<=3'd5;
      a<=#5 3'd0;
      a<=#10 3'd7;
      $display("value of a=%0d",a,$time);
    end
endmodule
//value of a=x  
/*
here $display is not blocked by any of the above statement so it will print the value of at current simulation time which is zero.
*/
/////////////////////////////////////////////////////////////////////

module test;
  reg[1:0]a,b;
  initial
    begin
      a<=2'd3;
      b<=2'd2;
      #10;
      a<=2'd0;
      b<=2'd1;
      $display("value of a=%0d ,b=%0d",a,b);
    end
endmodule
//simulation ouput:a=3,b=2
/*
$display is called at 10th time unit hence will be displaying active events from previous time slot i.e 0ns.
*/

module test;
  reg[1:0]a,b;
  initial
    begin
      a<=2'd3;
      b<=2'd2;
      #10;
      a<=2'd0;
      b<=2'd1;
      $monitor("value of a=%0d ,b=%0d",a,b);
    end
endmodule
//simulation ouput:a=0,b=1
/*
$monitor is called at 10ns time unit hence will be monitoring events from current time slot i.e 10ns.
*/




