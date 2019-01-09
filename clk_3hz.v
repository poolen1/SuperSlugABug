module threehertz(clk_50mhz, clk_3hz); 
input clk_50mhz; 
output clk_3hz; 
reg clk_3hz; 
reg [24:0] count; 
always @ (posedge clk_50mhz) 
begin if(count == 8333333) 
begin count <= 0; 
$dumpfile("f.vcd"); 
clk_3hz <= ~clk_3hz; 
end 
else begin 
count <= count + 1; 
end 
end 
endmodule