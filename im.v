module im(PCout, reset, inst_code );
input [7:0] PCout;
input reset;
output [7:0] inst_code;
reg [7:0] Mem[0:7]; // this creates 8 memory location each having 1 byte size
assign inst_code  = Mem[PCout];
//this is big endian format as msb is lower address and lsb is high address
// we are reading the instrution code for which address is specified byPC
always @(negedge reset)
begin
if (reset == 0)
// if 0 then initialize the memory with 4 instructions
begin
Mem[0] = 8'h13; //li r2, 3
Mem[1] = 8'h52; //addi r2, 2
Mem[2] = 8'h6B; //addi r5, 3
Mem[3] = 8'hC5; // j L1
Mem[4] = 8'h29;// li r5, 4
//Mem[5] = 8'h6A;//addi r5, 2 01101010//7 
Mem[5] = 8'h6D;  //addi r5, -3 01101101 
end
end
endmodule
