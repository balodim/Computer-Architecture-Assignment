//this block is part of instruction fetch unit, it specifically increments PC by 1
module adder(PCout, PCin );
input [7:0]PCout;
output [7:0]PCin;
assign PCin = PCout + 1;
endmodule
