module twohertz(clk_50mhz, clk_2hz); 
input clk_50mhz; 
output clk_2hz; 
reg clk_2hz; 
reg [24:0] count; 
always @ (posedge clk_50mhz) 
begin if(count == 12499999) 
begin count <= 0; 
$dumpfile("f.vcd"); 
clk_2hz <= ~clk_2hz; 
end 
else begin 
count <= count + 1; 
end 
end 
endmodule