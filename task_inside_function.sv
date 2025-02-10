module my_test;
   
  task my_boy;
     #100;
    $display("Hey_baby ,I want to come inside you");
    $display("Yes! you can  come daddy ");
   endtask

  function void Hey_baby;
    fork
      my_boy;
       
    join_none
  
  endfunction
    
  initial
      begin
        
        Hey_baby;
      end

endmodule
