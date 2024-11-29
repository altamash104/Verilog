module test;
  reg [3:0]a;
  
  initial
  begin
    #5;
    a=5;
    $display("intial a=%0p t=%0t",a,$time);
  end
  
  initial@(a) // we can use senstivity list in case of initial block also
    begin
      $display("a=%0p t=%0t",a,$time);
    end
endmodule
