module top(clk, reset );
input clk, reset;
wire [7:0] inst_code_out;    
wire [2:0] Read_Reg_Num_1,Write_Reg_Num;
wire [2:0] ImmData;
wire [7:0] Write_Data;
wire [7:0]  Read_Data_1, Read_Data_2;
wire [5:0] j_adr,j_adr_out;
wire [7:0] inst_code_idex_in, inst_code_idex_out,inst_code_ex_wb_out;
wire [7:0]PC_j,PCline_out;
wire [7:0]num1, ImmData_out,num11,num111;
wire PCsrc, Sel1, RegWrite, RegWrite_exwb_out;
wire zeroflag;
wire [7:0] aluRes,aluRes_out;
//wire [1:0] opcode;
wire [7:0] PCline_idex_in;
wire PCsrc_idex_out, RegWrite_idex_out, Sel1_idex_out,Sel2,Sel2_later;
wire [2:0]reg_in_ex,reg_out_ex;

ifetch mod1(clk, reset,PC_j,PCsrc_idex_out, inst_code_out, PCline_out ); // this module initializes ifunit and if/id reg

id mod2( PCline_out,j_adr,Read_Reg_Num_1,ImmData,reset,
Write_Reg_Num, Write_Data,RegWrite_exwb_out, Read_Data_1, Read_Data_2,PCline_idex_in);

id_ex reg2(
Sel1, RegWrite,PCsrc,inst_code_idex_in, Read_Data_2, Read_Data_1, j_adr,PCline_idex_in,clk, reset, 
num111,PC_j, ImmData_out,inst_code_idex_out, j_adr_out, PCsrc_idex_out, RegWrite_idex_out, Sel1_idex_out);

alu mod3(
num1,ImmData_out, zeroflag,aluRes);

ex_wb reg3(Sel2,RegWrite_idex_out,clk,reset, aluRes,inst_code_idex_out,aluRes_out,inst_code_ex_wb_out,RegWrite_exwb_out,Sel2_later );
//change the jump address calculation 
//control mod4(opcode,Sel1, PCsrc,RegWrite);
f_unit mod4(reg_out_ex,reg_in_ex, Sel2);

//assign opcode = inst_code_out[7:6];
assign Read_Reg_Num_1 = inst_code_out[5:3];
assign ImmData = inst_code_out[2:0];
assign Write_Data = aluRes_out;//paste the write data here
assign j_adr = inst_code_out[5:0];
assign inst_code_idex_in = inst_code_out; 
assign reg_out_ex = inst_code_idex_out[5:3];
assign  reg_in_ex = inst_code_idex_in[5:3];
assign num11 = (Sel2_later)? (aluRes_out):(num111);
assign num1 = (Sel1_idex_out == 0) ? 8'h00 : num11 ;
assign Write_Reg_Num = inst_code_ex_wb_out[5:3];
assign Sel1 = (inst_code_out[7:6] == 2'b00)? (0):(1); // all these control signals will pass through the registers to their destination
assign PCsrc = (inst_code_out[7:6]==2'b11)? (0):(1);
assign RegWrite = (inst_code_out[7:6]==2'b00 || inst_code_out[7:6]==2'b01)? (1):(0);
   
endmodule
