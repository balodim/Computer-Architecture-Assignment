module id(PCid_in, j_adr, Read_Reg_Num_1,ImmData,reset,
Write_Reg_Num, Write_Data,RegWrite, Read_Data_1, Read_Data_2,PCid_out);
// let all the control signals be generated in the id unit and then these signals will be passed to later registers.
//declare the inputs and outputs
input [2:0] Read_Reg_Num_1,Write_Reg_Num; // total  8 registers
input [7:0] Write_Data, PCid_in;
input RegWrite, reset;
input [5:0] j_adr;
input [2:0] ImmData;
output [7:0] Read_Data_1;
output [7:0] Read_Data_2, PCid_out;
//output RegWrite, Sel1, PCsrc;

//define the functionality
reg [7:0] Reg_Mem[7:0];
assign Read_Data_1 = Reg_Mem[Read_Reg_Num_1];//goes to a
assign Read_Data_2 = {{5{ImmData[2]}},ImmData}; //sign extend range is from -4 to 3 
//extended[15:0] <= { {8{extend[7]}}, extend[7:0] };
assign PCid_out = {PCid_in[7:6],j_adr};
always @( negedge reset, Write_Reg_Num, Write_Data)
begin
	if(reset == 0)
		begin
Reg_Mem[0] = 8'h00; 
Reg_Mem[1] = 8'h01; 
Reg_Mem[2] = 8'h02; 
Reg_Mem[3] = 8'h03;
Reg_Mem[4] = 8'h04;
Reg_Mem[5] = 8'h05; 
Reg_Mem[6] = 8'h06; 
Reg_Mem[7] = 8'h07; 
		end
if( RegWrite == 1)
    begin
    Reg_Mem[Write_Reg_Num] <= Write_Data; 
    end
end

endmodule
