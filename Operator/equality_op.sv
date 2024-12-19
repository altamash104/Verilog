/*
logical ==  logical;
inequality !=;
case ===;
case inequality !==;

logical eqaulity evalutes only two value 0 or 1
case eqaulity evaluates all four values 0,1,x,z
*/

module equality_op();
  reg[3:0]a,b;
  
  initial
    begin
     
      //logical equality
        a=4'b1x0z; b=4'b1x0z;
      $display("Result for a==b :%0d",a==b);
      
      //logical inequality
        a=4'b1x0z; b=4'b1x0z;
      $display("Result for a!=b :%0d",a!=b);
      
      //case equality
        a=4'b1x0z; b=4'b1x0z;
      $display ("Result for a===b :%0d",a===b);
      
      //case inequality
        a=4'b1x0z; b=4'b1x0z;
      $display ("Result for a===b :%0d",a!==b);
      
      
     end
endmodule
/*
Simulation result:
Result for a==b :x
Result for a!=b :x
Result for a===b :1
Result for a===b :0
*/
