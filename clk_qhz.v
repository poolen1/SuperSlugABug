module qhertz(clk_50mhz, clk_qhz); 
input clk_50mhz; 
output clk_qhz; 
reg clk_qhz; 
reg [24:0] count; 
always @ (posedge clk_50mhz) 
begin if(count == 99999999) 
begin count <= 0; 
$dumpfile("f.vcd"); 
clk_qhz <= ~clk_qhz; 
end 
else begin 
count <= count + 1; 
end 
end 
endmodule