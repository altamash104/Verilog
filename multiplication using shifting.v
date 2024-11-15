module test;
  
  bit [7:0]a=7'd1;
  bit [3:0] n=5;
  initial
    begin
      $display("before shifting");
      $display("a=%d",a);
      
      a=(a<<n);
    
      
      $display("after shifting");
      $display("a=%d",a);
     end
  
endmodule
