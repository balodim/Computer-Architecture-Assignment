module pc(PCin, clk, reset,PCout);
input [7:0] PCin;
input clk, reset;
output reg [7:0]PCout;
always @(posedge clk, negedge reset )
begin //if reset == 0, make PC = 0
if(reset == 0)
PCout <=0;
else //incerement PC by 4
PCout <= PCin;
end
endmodule
