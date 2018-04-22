//this module will be complete instruction fetch unit
module ifetch(clk, reset,PC_j,PCsrc, inst_code_out, PCline_out );
input clk, reset;
input [7:0]PC_j;
input PCsrc;
output [7:0]PCline_out;
output [7:0]inst_code_out;
wire [7:0] PCin, PCout, inst_code;
wire [7:0] PC_d, out2, PCline;
pc x1(PC_d, clk, reset,PCout);
im x2(PCout, reset, inst_code );
adder x3(PCout, PCin );
if_id reg1(PCin,inst_code, clk, reset, PCline, out2, PCsrc);
assign PC_d = (PCsrc == 1)? (PCin):(PC_j);
assign inst_code_out = out2;
assign PCline_out = PCline;
endmodule
