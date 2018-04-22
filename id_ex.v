module id_ex(Sel1_idex_in, RegWrite_idex_in,PCsrc_idex_in,inst_code_idex_in, ImmData, Read_Data_1, j_adr,PCline_idex_in,clk, reset, 
num1,PCline_idex_out, ImmData_out,inst_code_idex_out, j_adr_out, PCsrc_idex_out, RegWrite_idex_out, Sel1_idex_out);
input [7:0] ImmData, Read_Data_1, PCline_idex_in;
input [7:0] inst_code_idex_in;
input [5:0] j_adr;
input clk, reset, PCsrc_idex_in,Sel1_idex_in,RegWrite_idex_in ;
output reg [7:0] ImmData_out, num1, PCline_idex_out;//ImmData_out goes to alu
output reg [7:0] inst_code_idex_out;
output reg [5:0] j_adr_out;
output reg PCsrc_idex_out, RegWrite_idex_out, Sel1_idex_out;
//output reg Sel1;
always @(posedge clk, negedge reset)
begin
if(reset == 0)
begin
ImmData_out <=0;
num1 <= 0;
PCline_idex_out <=0;
inst_code_idex_out <=0;
j_adr_out <=0;
PCsrc_idex_out <=1;
Sel1_idex_out <=0;
RegWrite_idex_out <=0;
//Sel1 <= 1;
end
else
begin 
ImmData_out <= ImmData;
num1 <= Read_Data_1 ;
PCline_idex_out <= PCline_idex_in;
inst_code_idex_out <= inst_code_idex_in;
j_adr_out <= j_adr;
PCsrc_idex_out <= PCsrc_idex_in;
Sel1_idex_out <= Sel1_idex_in;
RegWrite_idex_out <= RegWrite_idex_in;
/*if(inst_code_idex_in[7:6] == 2'b00)
	Sel1 <=0;
else
	Sel1 <= 1;
	*/
end
end     
endmodule
