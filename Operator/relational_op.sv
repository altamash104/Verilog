module relational_op();
  reg [3:0]a,b,x,y,z;
  
  initial
    begin
     
      
      a=4; b=3;
      $display ("Result for a<b : %0d", a<b);
      
      a=4; b=3;
      $display ("Result for a >b : %0d", a > b);
      
      x=4'b1000; y=4'b1100;
      $display ("Result for x >=y : %0d",x >=y );
      
      x=4'b1000; y=4'b1100;
      $display ("Result for x <=y : %0d",x <=y );
      
      x=4'b1000; z=4'b1x1x;
      $display ("Result for x >=z : %0d",x >=z );
    end
endmodule

/*
simulation result:
Result for a<b : 0
Result for a >b : 1
Result for x >=y : 0
Result for x <=y : 1
Result for x >=z : x
*/
