//using non blocking method;
module swapping();
  int a,b;
  initial
  begin
    a=4;b=5;
    $display("value before swapping a=%0d b=%0d",a,b);
    a<=b;
    b<=a;
    $strobe("value after swapping a=%0d b=%0d",a,b);
    //#5 $display("value after swapping a=%0d b=%0d",a,b); since NBA can not be evaluated in active region but we can make it happen by using inter assignment delay
  end
endmodule

//using blocking method with temp reg;
module swapping();
  int a,b,temp;
  initial
  begin
    a=4;b=5;
    $display("value before swapping a=%0d b=%0d",a,b);
    temp=a;
    a=b;
    b=temp;
    $display("value after swapping a=%0d b=%0d",a,b);
  end
endmodule

//using airthmatic operator
module swapping();
  int a,b;
  initial
  begin
    a=4;b=5;
    $display("value before swapping a=%0d b=%0d",a,b);
    a=a+b; //a=a*b;  //a=a^b;
    b=a-b; //b=a/b;  //b=a^b;
    a=a-b; //a=a/b;  //a=a^b;
    $display("value after swapping a=%0d b=%0d",a,b);
  end
endmodule



