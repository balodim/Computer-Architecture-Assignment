module test;
reg clk, reset;

top test1(clk, reset );
initial begin 
clk = 0;
#12 
repeat(18)
begin
#6 clk = ~clk; //this generates four clock cycles with period of 10 units
end
end

initial begin
reset = 0;
#5 
reset = 1;
#25
reset = 1;
#70
reset = 1;
#50
reset = 0;
#5
reset = 1;
#5
$finish;
end
initial begin
#114
$finish;
end
endmodule