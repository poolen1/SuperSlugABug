library ieee;
   use ieee.std_logic_1164.all;
    
 entity tb_lfsr_bit is
 port(
	output : out std_logic
 );
 end entity;

 architecture test of tb_lfsr_bit is
   constant PERIOD  : time   := 10 ns;
   signal clk       : std_logic := '0';
   signal reset     : std_logic := '1';
   signal endSim    : boolean   := false;

   component lfsr_bit is
     port (
       reset     : in  std_logic;
       clk       : in  std_logic; 
       rbit_out  : out std_logic
     );
   end component;

 begin
   clk     <= not clk after PERIOD/2;
   reset   <= '0' after  PERIOD*10;
	output <= rbit_out;

   -- Main simulation process
   main_pr : process 
   begin
     wait until (reset = '0');
     for i in 0 to 31 loop
       wait until (clk = '1');
     end loop;
     endSim <= true;
   end process main_pr; 

   -- End the simulation
   stop_pr : process 
   begin
     if (endSim) then
       assert false 
         report "End of simulation." 
         severity failure; 
     end if;
     wait until (clk = '1');
   end process stop_pr; 

   DUT : lfsr_bit
     port map (
       clk         => clk,
       reset       => reset,
       rbit_out    => open
     );

end architecture;