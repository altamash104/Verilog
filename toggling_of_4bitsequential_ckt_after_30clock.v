
  module toggle_4bit(clk,rst,Q);
  input clk,rst;
  output reg [3:0]Q;
  reg[4:0]temp;//to store clock cycle
  
  always@(posedge clk)
    begin
      if(rst)
        begin
        Q<=4'b0000;
      	temp<=5'b00000;
    	end
  	else if(temp==5'b11101)
    	begin
      	Q=~Q;
      	temp<=5'd00000;
    	end
  	else
    temp<=temp+1'b1;
    end

   initial
     begin
       $dumpfile("dump.vcd");
       $dumpvars;
       #1000 $finish();
     end
   
endmodule
