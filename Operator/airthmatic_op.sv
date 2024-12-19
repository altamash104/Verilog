module arith_op();
  reg[3:0]a,b,c;
  integer d,e;
  reg[3:0]x,y,z;
  integer k,l,m ,n;
  
  initial
    begin
      a=4'b0010; b=4'b0011; c=4'b101x; d=3; e=8;
      
      x=a*b;    //evalutes to 0110
      y=a+b;	//evalutes to 0101
      z=b-a;	//evaluate to 0001
      l=e/d;	////evalutes 2 fraction is truncated
      m=e%d;    //evalutes to 2
      n=c*a;	//evaluate to x
      $display("x=%0b,y=%0b,z=%0b,l=%0b,m=%0b,n=%0b",x,y,z,l,m,n);
    end
  
endmodule
 // x=110,y=101,z=1,l=10,m=10,n=xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
