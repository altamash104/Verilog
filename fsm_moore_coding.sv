
//moore fsm 1001
module fsm_1001(input  in,rst,clk,output reg out);
  
  /*parameter s0=3'b000,
  			s1=3'b001,
  			s2=3'b010,
  			s3=3'b011,
  			s4=3'b100;
  reg[2:0]prst ,nxt_state;
  */
  /*
 1.incase of enumeration  it is  Easier to add, remove, or rename states. here encoding is managed by the compiler.	
 1.incase of parameter  If you change the number of states, you need to update the reg size and all parameter definitions.

 2.The compiler can perform better type checking. Assigning a value that is not one of the enumerated states can result in an error or warning.	
   but in case of parameter wecould face Less type safety. You could potentially assign any 2-bit value to pstate or nstate.
   
  */
  typedef enum bit [2:0]{s0,s1,s2,s3,s4}state_type;
  
  state_type nxt_state, prst;
  
  //Present state sequential logic
  
  always@(posedge clk)
    begin
    if(rst)
      prst<=s0;
    else
      prst<=nxt_state;
    end 
   // prst = rst ? nxt_state:s0;
  
  //next state combinational logic
  always@(*)
    begin
    
      case(prst)
        s0:nxt_state=(in) ? s1:s0;
        s1:nxt_state =(in)? s1:s2;
        s2:nxt_state =(in)? s0:s3;
        s3:nxt_state =(in)? s4:s0;
        s4:nxt_state =(in)? s1:s0;
        
        default:nxt_state=s0;
        
        endcase
      end
      
   //output logic
  always@(posedge clk)
    begin
      if(prst ==s4)
        out<=1'b1;
      else
        out <= 1'b0;
    end
endmodule   

//testbench
module fsm_1001_tb;
  
  reg clk,rst,in;
  wire out;
  
  fsm_1001 dut(.clk(clk),.rst(rst),.in(in),.out(out));
  
  always #5 clk=~clk;
  
  initial
    begin
      clk=0;
      rst=1;
      in=0;
      @(posedge clk)
       rst=0;
      
      //stimulus 1001 pattern
      @(posedge clk)
      in=1;// 1
      @(posedge clk)
      in=0;// 10
      @(posedge clk)
      in=0;//100
      @(posedge clk)
      in=1;//1001
      
      //stimulus 01001
      @(posedge clk)
      in=0;// 0
      @(posedge clk)
      in=1;// 01
      @(posedge clk)
      in=0;//010
      @(posedge clk)
      in=0;//01001
      @(posedge clk)
      in=1;
      
      #50;
    end
       initial
    	begin
          $dumpfile("dump.vcd");
      	 $dumpvars();
      #150 $finish;
    
    end
endmodule
