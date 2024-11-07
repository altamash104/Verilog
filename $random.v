/*
-->it provides a mechanism for generating random numbers.
-->  it is a function returns a new 32-bit random number each 32-bit random number each time it is called.
--> The random number is a signed integer ,it can be positive or negative 
--> seed parameters controls the numbers that $random returns.
              syntax: $random(seed_num)
              $random%b:numbers in range[-(b-1) to +(b-1)]
              {$random}%b:numbers in range[0:-(b-1)]
*/
module tb;
int r_a,ur_a ,ur_r;
  
  initial
    begin
    repeat(5)
        begin
          r_a=$random%30; // -29 t0 +29
          ur_a={$random}%30;// 0 to +29
          ur_a=$urandom%30;// 0 to+29
          ur_r=$urandom_range(0,29);
          $display("r_a=%0d ur_a=%0d ur_r=%0d",r_a,ur_a,ur_r);
        end
    end
endmodule
