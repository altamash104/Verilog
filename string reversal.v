module tb; 
	string s1 = "altamash"; 
	string s2; 
  initial 
    begin 
      s2 = {<<8{s1}}; // each character of word is represented as 1 byte means 8 bit that is why here 8 with streaming operator is used
	$display("reversed string=%s", s2); 
	end 
endmodule
