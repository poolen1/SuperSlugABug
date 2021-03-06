module twentyHertz(clk_50mhz, clk_20hz); 
input clk_50mhz; 
output clk_20hz; 
reg clk_20hz; 
reg [24:0] count; 
always @ (posedge clk_50mhz) 
begin if(count == 999999) 
begin count <= 0; 
$dumpfile("f.vcd"); 
clk_20hz <= ~clk_20hz; 
end 
else begin 
count <= count + 1; 
end 
end 
endmodule