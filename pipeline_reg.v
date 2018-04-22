module if_id( //IF/ID REGISTER
PCin,inst_code, clk, reset, PCline, out2, PCsrc );
input [7:0] PCin, inst_code;
input clk, reset, PCsrc;
output reg[7:0] PCline,out2;
always @(posedge clk, negedge reset, PCsrc)
begin
if(reset == 0 || PCsrc == 0)
begin
PCline <= 0;
out2 <=8'b10111111;
end
else
begin
PCline <= PCin;
out2 <= inst_code;
end 
end    
endmodule
