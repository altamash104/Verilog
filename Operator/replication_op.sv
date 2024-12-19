replication operator -n{x} means replicate x for n times
module concat_repl_op();
  reg a;
  reg [2:0]b,c;
  reg [10:0]x;
  
  initial
    begin
      a=1'b1; b=3'b100; c=3'b101;
      x={{2{a}},b,{2{c}}};
      $display("x=%b",x);
    end
endmodule

simulation result: x=11100101101
