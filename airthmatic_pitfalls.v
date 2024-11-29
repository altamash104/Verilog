module test;
  reg[15:0]a;
  initial
    begin
      a= -4'd12/3; //negative register values are stored as 2's compliments if base specifier is given.
      $display("a=%0d",a);
    end
endmodule

/////////////////////////////////////////////////////////
module test;
  integer i;// we would use integer i because integer stores negative value as it is
  reg[15:0]a;
  
  initial
    begin
      i=-12/3;
      //i=-'d12/3; we must avoid base formating
      a=-12/3;
      $display("i=%0d a=%0d",i,a);
    end
endmodule

