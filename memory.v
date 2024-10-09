module memory;
  //array can be used to model memory elements with multiple locations
  reg [7:0]mem[0:255]; //256(depth) locations of 8(width) bit wide memory element
  initial
    begin
      int i;
      repeat(256)
        begin
          mem[i]=$urandom_range(1,1000);//we can initialize all the location randomly 
      		i++;
        end
      //mem[0]=8'd120;  //assigns 120 to the first element of mem
      //mem[1]=8'd212;  //assigns 212 to the second element of mem
      foreach(mem[i])
        $display("data at memory location mem[%0b]=%0d",i,mem[i]);// we can see the value of each memory location individually
      //$display("value of memmoy mem=%0p",mem);
      //$display("data at memory location 1 is %0d",mem[1]); // we can see value of the memory manualy one by one like this
      //$display("data at memory location 2 is %0d",mem[2]);
    end
endmodule
