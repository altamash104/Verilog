module shift_op();
  reg[3:0]a,b,x,y,z;
  
  initial
    begin
      a= 4'b0110; b=4'b1100;
      x=a<<1;
      y=b>>2;
      z=a>>1;
      $display("x=%b,y=%b,z=%b",x,y,z);
    end
  
endmodule

simulation result: x=1100,y=0011,z=0011
