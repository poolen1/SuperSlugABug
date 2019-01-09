library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity hammer is
port(
	clock_in : in std_logic;
	enable_in3 : in std_logic;
	enable_in2 : in std_logic;
	enable_in1 : in std_logic;
	enable_in0 : in std_logic;
	
	led_9 : out std_logic;
	led_8 : out std_logic;
	led_7 : out std_logic;
	led_6 : out std_logic;
	led_5 : out std_logic;
	led_4 : out std_logic;
	led_3 : out std_logic;
	led_2 : out std_logic;
	led_1 : out std_logic;
	led_0 : out std_logic;
	
	whack3 : out std_logic;
	whack2 : out std_logic;
	whack1 : out std_logic;
	whack0 : out std_logic;
	sWhack3 : out std_logic;
	sWhack2 : out std_logic;
	sWhack1 : out std_logic;
	sWhack0 : out std_logic
);
end hammer;

architecture rtl of hammer is
signal clock : std_logic;
signal enable3 : std_logic;
signal enable2 : std_logic;
signal enable1 : std_logic;
signal enable0 : std_logic;
signal reset : std_logic;

begin
clock   <= clock_in;
enable3 <= enable_in3; 
enable2 <= enable_in2;
enable1 <= enable_in1;
enable0 <= enable_in0;

process(clock, enable3, enable2, enable1, enable0)
variable temp : std_logic_vector (3 downto 0) := "0000";
BEGIN

if enable3 = '0' or enable2 = '0' or enable1 = '0' or enable0 = '0' then
	if (rising_edge(clock)) then
		if temp /= "1011" then
			temp := temp + '1';
		end if;
	end if;
elsif enable3 = '1' or enable2 = '1' or enable1 = '1' or enable0 = '1' then
	temp := "0000";
end if;
	
case temp is
when "0001" => 
	led_9 <= '1';  -- '0'
	led_8 <= '0';  -- '1'
	led_7 <= '0';  -- '2'
	led_6	<= '0';  -- '3'
	led_5 <= '0';  -- '4'
	led_4 <= '0';  -- '5'
	led_3 <= '0';  -- '6'
	led_2 <= '0';  -- '7'
	led_1 <= '0';  -- '8'
	led_0 <= '0';  -- '9'
	
	if enable3 = '0' then
	whack3  <= '1';
	else
	whack3 <= '0';
	end if;
	
	if enable2 = '0' then
	whack2  <= '1';
	else
	whack2 <= '0';
	end if;
	
	if enable1 = '0' then
	whack1  <= '1';
	else
	whack1 <= '0';
	end if;
	
	if enable0 = '0' then
	whack0  <= '1';
	else
	whack0 <= '0';
	end if;
	
	sWhack3 <= '0';
	sWhack2 <= '0';
	sWhack1 <= '0';
	sWhack0 <= '0';
	
when "0010" => 
	led_9 <= '1';  -- '0'
	led_8 <= '1';  -- '1'
	led_7 <= '0';  -- '2'
	led_6	<= '0';  -- '3'
	led_5 <= '0';  -- '4'
	led_4 <= '0';  -- '5'
	led_3 <= '0';  -- '6'
	led_2 <= '0';  -- '7'
	led_1 <= '0';  -- '8'
	led_0 <= '0';  -- '9'
	whack3  <= '0';
	whack2  <= '0';
	whack1  <= '0';
	whack0  <= '0';
	sWhack3 <= '0';
	sWhack2 <= '0';
	sWhack1 <= '0';
	sWhack0 <= '0';
	
when "0011"	=> 
	led_9 <= '1';  -- '0'
	led_8 <= '1';  -- '1'
	led_7 <= '1';  -- '2'
	led_6	<= '0';  -- '3'
	led_5 <= '0';  -- '4'
	led_4 <= '0';  -- '5'
	led_3 <= '0';  -- '6'
	led_2 <= '0';  -- '7'
	led_1 <= '0';  -- '8'
	led_0 <= '0';  -- '9'
	whack3  <= '0';
	whack2  <= '0';
	whack1  <= '0';
	whack0  <= '0';
	sWhack3 <= '0';
	sWhack2 <= '0';
	sWhack1 <= '0';
	sWhack0 <= '0';
	
when "0100"	=> 
	led_9 <= '1';  -- '0'
	led_8 <= '1';  -- '1'
	led_7 <= '1';  -- '2'
	led_6	<= '1';  -- '3'
	led_5 <= '0';  -- '4'
	led_4 <= '0';  -- '5'
	led_3 <= '0';  -- '6'
	led_2 <= '0';  -- '7'
	led_1 <= '0';  -- '8'
	led_0 <= '0';  -- '9'
	whack3  <= '0';
	whack2  <= '0';
	whack1  <= '0';
	whack0  <= '0';
	sWhack3 <= '0';
	sWhack2 <= '0';
	sWhack1 <= '0';
	sWhack0 <= '0';
	
when "0101"	=> 
	led_9 <= '1';  -- '0'
	led_8 <= '1';  -- '1'
	led_7 <= '1';  -- '2'
	led_6	<= '1';  -- '3'
	led_5 <= '1';  -- '4'
	led_4 <= '0';  -- '5'
	led_3 <= '0';  -- '6'
	led_2 <= '0';  -- '7'
	led_1 <= '0';  -- '8'
	led_0 <= '0';  -- '9'
	whack3  <= '0';
	whack2  <= '0';
	whack1  <= '0';
	whack0  <= '0';
	sWhack3 <= '0';
	sWhack2 <= '0';
	sWhack1 <= '0';
	sWhack0 <= '0';
	
when "0110"	=> 
	led_9 <= '1';  -- '0'
	led_8 <= '1';  -- '1'
	led_7 <= '1';  -- '2'
	led_6	<= '1';  -- '3'
	led_5 <= '1';  -- '4'
	led_4 <= '1';  -- '5'
	led_3 <= '0';  -- '6'
	led_2 <= '0';  -- '7'
	led_1 <= '0';  -- '8'
	led_0 <= '0';  -- '9'
	whack3  <= '0';
	whack2  <= '0';
	whack1  <= '0';
	whack0  <= '0';
	sWhack3 <= '0';
	sWhack2 <= '0';
	sWhack1 <= '0';
	sWhack0 <= '0';
	
when "0111"	=> 
	led_9 <= '1';  -- '0'
	led_8 <= '1';  -- '1'
	led_7 <= '1';  -- '2'
	led_6	<= '1';  -- '3'
	led_5 <= '1';  -- '4'
	led_4 <= '1';  -- '5'
	led_3 <= '1';  -- '6'
	led_2 <= '0';  -- '7'
	led_1 <= '0';  -- '8'
	led_0 <= '0';  -- '9'
	whack3  <= '0';
	whack2  <= '0';
	whack1  <= '0';
	whack0  <= '0';
	sWhack3 <= '0';
	sWhack2 <= '0';
	sWhack1 <= '0';
	sWhack0 <= '0';
	
when "1000"	=> 
	led_9 <= '1';  -- '0'
	led_8 <= '1';  -- '1'
	led_7 <= '1';  -- '2'
	led_6	<= '1';  -- '3'
	led_5 <= '1';  -- '4'
	led_4 <= '1';  -- '5'
	led_3 <= '1';  -- '6'
	led_2 <= '1';  -- '7'
	led_1 <= '0';  -- '8'
	led_0 <= '0';  -- '9'
	whack3  <= '0';
	whack2  <= '0';
	whack1  <= '0';
	whack0  <= '0';
	sWhack3 <= '0';
	sWhack2 <= '0';
	sWhack1 <= '0';
	sWhack0 <= '0';
	
when "1001"	=> 
	led_9 <= '1';  -- '0'
	led_8 <= '1';  -- '1'
	led_7 <= '1';  -- '2'
	led_6	<= '1';  -- '3'
	led_5 <= '1';  -- '4'
	led_4 <= '1';  -- '5'
	led_3 <= '1';  -- '6'
	led_2 <= '1';  -- '7'
	led_1 <= '1';  -- '8'
	led_0 <= '0';  -- '9'
	whack3  <= '0';
	whack2  <= '0';
	whack1  <= '0';
	whack0  <= '0';
	sWhack3 <= '0';
	sWhack2 <= '0';
	sWhack1 <= '0';
	sWhack0 <= '0';
	
when "1010"	=> 
	led_9 <= '1';  -- '0'
	led_8 <= '1';  -- '1'
	led_7 <= '1';  -- '2'
	led_6	<= '1';  -- '3'
	led_5 <= '1';  -- '4'
	led_4 <= '1';  -- '5'
	led_3 <= '1';  -- '6'
	led_2 <= '1';  -- '7'
	led_1 <= '1';  -- '8'
	led_0 <= '1';  -- '9'
	
	whack3 <= '0';
	whack2  <= '0';
	whack1  <= '0';
	whack0  <= '0';
	
	if enable3 = '0' then
	sWhack3 <= '1';
	else
	sWhack3 <= '0';
	end if;
	
	if enable2 = '0' then
	sWhack2 <= '1';
	else
	sWhack2 <= '0';
	end if;
	
	if enable1 = '0' then
	sWhack1 <= '1';
	else
	sWhack1 <= '0';
	end if;
	
	if enable0 = '0' then
	sWhack0 <= '1';
	else
	sWhack0 <= '0';
	end if;
	
when "1011"	=> 
	led_9 <= '0';  -- '0'
	led_8 <= '0';  -- '1'
	led_7 <= '0';  -- '2'
	led_6	<= '0';  -- '3'
	led_5 <= '0';  -- '4'
	led_4 <= '0';  -- '5'
	led_3 <= '0';  -- '6'
	led_2 <= '0';  -- '7'
	led_1 <= '0';  -- '8'
	led_0 <= '0';  -- '9'
	whack3  <= '0';
	whack2  <= '0';
	whack1  <= '0';
	whack0  <= '0';
	sWhack3 <= '0';
	sWhack2 <= '0';
	sWhack1 <= '0';
	sWhack0 <= '0';
	
when others =>
	led_0 <= '0';  -- '0'
	led_1 <= '0';  -- '1'
	led_2 <= '0';  -- '2'
	led_3 <= '0';  -- '3'
	led_4 <= '0';  -- '4'
	led_5 <= '0';  -- '5'
	led_6 <= '0';  -- '6'
	led_7 <= '0';  -- '7'
	led_8 <= '0';  -- '8'
	led_9 <= '0';  -- '9'
	whack3  <= '0';
	whack2  <= '0';
	whack1  <= '0';
	whack0  <= '0';
	sWhack3 <= '0';
	sWhack2 <= '0';
	sWhack1 <= '0';
	sWhack0 <= '0';
end case;

end process;
end rtl;