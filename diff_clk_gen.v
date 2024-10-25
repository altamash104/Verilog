module clk_generation();
  
  
  	bit clk1, clk2, clk3, clk4, clk5;
  
  // using always block
  	always #5 clk1 = ~ clk1;					
  
  // using forever block	
  	initial begin
      
  			forever #5 clk2 = ~ clk2;				
    end
  
  // using while loop 
  	initial 
      begin							
  
      while(1) begin
      
  			#5 clk3 = ~ clk3;
        
      end
    
  	end 
  
  // using do while loop
  	initial begin
  
      do begin 							
      
  			#5 clk4 = ~ clk4;
        
      end while(1);
    
  	end
  
  // using for loop
  	initial begin						
  
      for(;;) begin
      
  			#5 clk5 = ~ clk5;
        
      end
       
  	end
    	
 
	initial 
    begin
    
      	$dumpfile("dump.vcd");
    	$dumpvars;
  
    	#500 $finish();
    
  	end:
  
  
endmodule
