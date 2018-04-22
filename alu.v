module alu(
num1,num2, zeroflag,aluRes );
//num2 will take care of load or ImmData
input [7:0] num1, num2;//PCline_ex;
//input [5:0] j_adr_out;
//input [2:0] aluop; // No need as only add operation is performed
output zeroflag; //indicates when the output is zero
output reg [7:0] aluRes;// PCex_j; // will be assigned in always block
assign zeroflag = (aluRes == 0)? 0 : 1;
always @ (*)
begin
aluRes <= num1 + num2;

end

endmodule
//test bench passed
