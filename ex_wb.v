module ex_wb(Sel2, RegWrite_exwb_in,clk,reset, aluRes,inst_code_ex_wb_in,aluRes_out,inst_code_ex_wb_out, RegWrite_exwb_out,Sel2_later);
input clk, reset;
input [7:0] aluRes;// PC_ex_j;
input [7:0]inst_code_ex_wb_in;
input RegWrite_exwb_in, Sel2;
output reg [7:0]inst_code_ex_wb_out;
output reg [7:0]aluRes_out;// PC_j;
output reg RegWrite_exwb_out;
output reg Sel2_later;
//output reg RegWrite, PCsrc;
always@(posedge clk, negedge reset)
begin
	if(reset == 0)
		begin
			inst_code_ex_wb_out <=0;
			aluRes_out <= 0;
			//PC_j <= 0;
			RegWrite_exwb_out <=0;
			Sel2_later <=0;
			//RegWrite <=0;
			//PCsrc <= 1;
		end
	else
		begin
			inst_code_ex_wb_out <= inst_code_ex_wb_in;
			aluRes_out <= aluRes;
			//PC_j <= PC_ex_j;
			RegWrite_exwb_out <= RegWrite_exwb_in;
			Sel2_later <= Sel2;
			/*if(inst_code_ex_wb_in[7:6]!=2'b11)
				begin
				RegWrite <=1;
				PCsrc <= 1;
				end
			else
				begin
				RegWrite <=0;
				PCsrc <= 0;
				end*/
		end

end
endmodule
