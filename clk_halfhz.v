module halfhertz(clk_50mhz, clk_halfhz); 
input clk_50mhz; 
output clk_halfhz; 
reg clk_halfhz; 
reg [24:0] count; 
always @ (posedge clk_50mhz) 
begin if(count == 599999999) 
begin count <= 0; 
$dumpfile("f.vcd"); 
clk_halfhz <= ~clk_halfhz; 
end 
else begin 
count <= count + 1; 
end 
end 
endmodule