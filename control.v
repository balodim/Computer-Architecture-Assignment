module control(opcode,Sel1, PCsrc,RegWrite     );
input [1:0] opcode;
output Sel1, PCsrc, RegWrite;
assign Sel1 = (opcode == 2'b00)? 1:0;
assign PCsrc = (opcode == 2'b11)? 1: 0;
assign RegWrite = (opcode ==2'b11)? 1:0 ;
endmodule
