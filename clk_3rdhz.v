module thirdHertz(clk_50mhz, clk_3rdhz); 
input clk_50mhz; 
output clk_3rdhz; 
reg clk_3rdhz; 
reg [24:0] count; 
always @ (posedge clk_50mhz) 
begin if(count == 74999999) 
begin count <= 0; 
$dumpfile("f.vcd"); 
clk_3rdhz <= ~clk_3rdhz; 
end 
else begin 
count <= count + 1; 
end 
end 
endmodule