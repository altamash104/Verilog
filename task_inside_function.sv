module my_test;
   
  task my_task;
     #100;
    $display("call me ,I am inside task ");
    
   endtask

  function void my_fun;
    fork
      my_task;
       
    join_none
  
  endfunction
    
  initial
      begin
        
        my_fun;
      end

endmodule
