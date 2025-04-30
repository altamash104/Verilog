module clk_div(
input clk,rst,en,
output reg divby_2,divby_4,divby_8,divby_16);
  
  reg[3:0]count;
  
  always@(posedge clk or posedge rst)
    begin
      if(rst==1)
        count<=4'b0000;
      else
        if(en==1)
          count=count+1;
      
      divby_2<=count[0];
      divby_4<=count[1];
      divby_8<=count[2];				  
      divby_16<=count[3];
    end
endmodule

///////////////Testbench///////////////////

module clk_div_tb();
  reg clk;
  reg rst;
  reg en;
  
  wire  divby_2,divby_4,divby_8,divby_16;
  
  clk_div dut(clk,rst,en,divby_2,divby_4,divby_8,divby_16);
  
  always #5 clk=~clk;
  
  initial clk=0;
  initial
    begin
      en=0; rst=1;
      #50;
      en=1; rst=0;
      end
  
  initial
    begin
      $dumpfile("dump.vcd");
 	  $dumpvars;
     #500;
      $finish();
    end
 
endmodule
