module reduction_op();
  reg[3:0]a,b;
  reg y,z;
  initial
    begin
      a=4'b0110; b=4'b1000;
      y=~&b;
      z=^a;
      $display("y=%b,z=%b",y,z);
    end
endmodule

simulation result:y=1,z=0
