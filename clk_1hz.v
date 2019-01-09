module onehertz(clk_50mhz, clk_1hz); 
input clk_50mhz; 
output clk_1hz; 
reg clk_1hz; 
reg [24:0] count; 
always @ (posedge clk_50mhz) 
begin if(count == 24999999) 
begin count <= 0; 
$dumpfile("f.vcd"); 
clk_1hz <= ~clk_1hz; 
end 
else begin 
count <= count + 1; 
end 
end 
endmodule