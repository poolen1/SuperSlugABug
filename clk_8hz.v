module eightHertz(clk_50mhz, clk_8hz); 
input clk_50mhz; 
output clk_8hz; 
reg clk_8hz; 
reg [24:0] count; 
always @ (posedge clk_50mhz) 
begin if(count == 3124999) 
begin count <= 0; 
$dumpfile("f.vcd"); 
clk_8hz <= ~clk_8hz; 
end 
else begin 
count <= count + 1; 
end 
end 
endmodule