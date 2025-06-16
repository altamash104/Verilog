//For signed

module test;
  byte a;
  initial begin
    a = -12; // 2's complement: 1111_0100
    $display("a << 2: %b", a << 2); //1101_0000
    $display("a <<< 2: %b", a <<< 2); // Output: 1101_0000 (same as <<)
  end
endmodule


//For unsigned

module test;
  bit [7:0] a;
  initial begin
    a = 12; //  0000_1100
    $display("a << 2: %b", a << 2); //0011_0000
    $display("a <<< 2: %b", a <<< 2); // Output: 0011_0000 (same as <<)
  end
endmodule


//For unsigned

module test;
  bit [7:0] a;
  initial begin
  a = 12; // 0000_1100
$display("a >> 2: %b", a >> 2);  // 0000_0011 (logical shift)
$display("a >>> 2: %b", a >>> 2); // 0000_0011 (arithmetic shift)(same as >>)
  end
endmodule


//For signed

module test;
  byte a;
  initial 
    begin
  		a =-12; // 2's complement: 1111_0100
	$display("a >> 2: %b", a >> 2);  // 0011_1101 (logical shift)
    $display("a >>> 2: %b", a >>> 2); // 1111_1101 (arithmetic shift) (diff)
  	end
endmodule
/*
Note:
a << 2 and a <<< 2 are identical for left shifts.
The difference is only visible with right shifts.
  >>> preserves the sign bit (arithmetic right shift).
  >> fills with 0s (logical right shift).
*/
  
