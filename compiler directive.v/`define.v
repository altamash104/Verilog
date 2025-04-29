/*
1.Compiler directive is the command or instruction in our code that provides guidance to the compiler.
2.Compiler is the software that translate your code into machine code
3.`define directive is used to define text(macros) substitution in verilog program.
4.It can be used both inside and outside module definitions.
*/

`define HOLD   2'b00
`define RESET  2'b01
`define SET    2'B10
`define TOGGLE 2'b11

module jk_ff(input j,k,clk,reset, output reg q);
  always@(posedge clk)
    begin
      if(reset)
        q<=1'b0;
      else
        begin
          case({j,k})
            `HODL :q<=q;
            `RESET :q<=1'b0;
            `SET   :q<=1'b1;
            `TOGGLE :q<= !q;
          endcase
        end
    end
endmodule
          
