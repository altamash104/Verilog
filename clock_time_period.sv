//$time and $realtime system functions return the current time and the default reporting format can be changed with another system task $timeformat.

//Verilog code to calculate the timeperiod of a clock

module time_period;
  bit clock;
  int tp, tp1,tp2;
  
always 
  begin
  #5 clock=~clock;
  end
  
initial
    begin
    @(posedge clock)
      tp1= $time;
    @(posedge clock)
     tp2= $time;
      
     tp=tp2-tp1;
      $display("The timeperiod of the clock is : %0d",tp);
    end
 
initial
    begin
      #50 $finish;
    end  
  
initial
   begin
   $dumpfile("dump.vcd"); 
   $dumpvars;
   end
   
endmodule
