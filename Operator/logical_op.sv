module logical_op();
  reg[2:0]a,b,c;
  reg x,y,z;
  
  initial
    begin
      a=5; b=3'b111; c='bx;
      
      x=a && b;
      y=a && c;
      z=b && 0;
      $display("x=%0b,y=%0b,z=%0b",x,y,z);
    end
  
endmodule

simulation result: x=1 ,y=x ,z=0
