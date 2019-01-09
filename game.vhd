library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity game is
port(
	rand3_in   : in std_logic;
	rand2_in   : in std_logic;
	rand1_in   : in std_logic;
	rand0_in   : in std_logic;

	clock_in  : in std_logic;
	
	whack3_in  : in std_logic;
	whack2_in  : in std_logic;
	whack1_in  : in std_logic;
	whack0_in  : in std_logic;
	
	sWhack3_in : in std_logic;
	sWhack2_in : in std_logic;
	sWhack1_in : in std_logic;
	sWhack0_in : in std_logic;
	
	switch_in  : in std_logic;
	
	seg5_6 : out std_logic;
	seg5_5 : out std_logic;
	seg5_4 : out std_logic;
	seg5_3 : out std_logic;
	seg5_2 : out std_logic;
	seg5_1 : out std_logic;
	seg5_0 : out std_logic;
	
	seg4_6 : out std_logic;
	seg4_5 : out std_logic;
	seg4_4 : out std_logic;
	seg4_3 : out std_logic;
	seg4_2 : out std_logic;
	seg4_1 : out std_logic;
	seg4_0 : out std_logic;
	
	seg3_6 : out std_logic;
	seg3_5 : out std_logic;
	seg3_4 : out std_logic;
	seg3_3 : out std_logic;
	seg3_2 : out std_logic;
	seg3_1 : out std_logic;
	seg3_0 : out std_logic;
	
	seg2_6 : out std_logic;
	seg2_5 : out std_logic;
	seg2_4 : out std_logic;
	seg2_3 : out std_logic;
	seg2_2 : out std_logic;
	seg2_1 : out std_logic;
	seg2_0 : out std_logic;
	
	seg1_6 : out std_logic;
	seg1_5 : out std_logic;
	seg1_4 : out std_logic;
	seg1_3 : out std_logic;
	seg1_2 : out std_logic;
	seg1_1 : out std_logic;
	seg1_0 : out std_logic;
	
	seg0_6 : out std_logic;
	seg0_5 : out std_logic;
	seg0_4 : out std_logic;
	seg0_3 : out std_logic;
	seg0_2 : out std_logic;
	seg0_1 : out std_logic;
	seg0_0 : out std_logic
);
end game;

architecture rtl of game is
signal clock   : std_logic;
	
signal rand3   : std_logic;
signal rand2   : std_logic;
signal rand1   : std_logic;
signal rand0   : std_logic;

signal whack3  : std_logic;
signal whack2  : std_logic;
signal whack1  : std_logic;
signal whack0  : std_logic;
	
signal sWhack3 : std_logic;
signal sWhack2 : std_logic;
signal sWhack1 : std_logic;
signal sWhack0 : std_logic;

signal seg5    : std_logic_vector (6 downto 0);
signal seg4    : std_logic_vector (6 downto 0);
signal seg3    : std_logic_vector (6 downto 0);
signal seg2    : std_logic_vector (6 downto 0);
signal seg1    : std_logic_vector (6 downto 0);
signal seg0    : std_logic_vector (6 downto 0);

signal switch: std_logic;

begin
clock   <= clock_in;

rand3   <= rand3_in;
rand2   <= rand2_in;
rand1   <= rand1_in;
rand0   <= rand0_in;

whack3  <= whack3_in;
whack2  <= whack2_in;
whack1  <= whack1_in;
whack0  <= whack0_in;

sWhack3 <= sWhack3_in;
sWhack2 <= sWhack2_in;
sWhack1 <= sWhack1_in;
sWhack0 <= sWhack0_in;

seg5_6  <= seg5(6);
seg5_5  <= seg5(5);
seg5_4  <= seg5(4);
seg5_3  <= seg5(3);
seg5_2  <= seg5(2);
seg5_1  <= seg5(1);
seg5_0  <= seg5(0);

seg4_6  <= seg4(6);
seg4_5  <= seg4(5);
seg4_4  <= seg4(4);
seg4_3  <= seg4(3);
seg4_2  <= seg4(2);
seg4_1  <= seg4(1);
seg4_0  <= seg4(0);

seg3_6  <= seg3(6);
seg3_5  <= seg3(5);
seg3_4  <= seg3(4);
seg3_3  <= seg3(3);
seg3_2  <= seg3(2);
seg3_1  <= seg3(1);
seg3_0  <= seg3(0);

seg2_6  <= seg2(6);
seg2_5  <= seg2(5);
seg2_4  <= seg2(4);
seg2_3  <= seg2(3);
seg2_2  <= seg2(2);
seg2_1  <= seg2(1);
seg2_0  <= seg2(0);

seg1_6  <= seg1(6);
seg1_5  <= seg1(5);
seg1_4  <= seg1(4);
seg1_3  <= seg1(3);
seg1_2  <= seg1(2);
seg1_1  <= seg1(1);
seg1_0  <= seg1(0);

seg0_6  <= seg0(6);
seg0_5  <= seg0(5);
seg0_4  <= seg0(4);
seg0_3  <= seg0(3);
seg0_2  <= seg0(2);
seg0_1  <= seg0(1);
seg0_0  <= seg0(0);

switch <= switch_in;

process(clock)

variable temp3  : integer := 89;
variable temp2  : integer := 89;
variable temp1  : integer := 89;
variable temp0  : integer := 89;

variable scoreT : integer := 0;

variable score3 : integer := 0;
variable score2 : integer := 0;
variable score1 : integer := 0;
variable score0 : integer := 0;

variable timer  : integer := 0;

variable trig3  : std_logic := '0';
variable trig2  : std_logic := '0';
variable trig1  : std_logic := '0';
variable trig0  : std_logic := '0';

variable start  : std_logic := '1';
variable play   : std_logic := '0';
variable again  : std_logic := '0';

variable super3 : std_logic := '0';
variable super2 : std_logic := '0';
variable super1 : std_logic := '0';
variable super0 : std_logic := '0';

BEGIN

if rising_edge(clock) then
--start
	if start = '1' then
		if timer /= 115 then
			timer := timer + 1;
		elsif timer = 115 then
			timer := 0;
		end if;
		if sWhack3 = '1' or sWhack2 = '1' or sWhack1 = '1' or sWhack0 = '1' then --newGame = '0' then
			score3 := 0;
			score2 := 0;
			score1 := 0;
			score0 := 0;
			start  := '0';
			play   := '1';
			again  := '0';
			timer  := 116;
		end if;
	end if;

--play
	if play = '1' then
		if timer /= 1116 then
			timer := timer + 1;
		elsif timer = 1116 then
			start  := '0';
			play   := '0';
			again  := '1';
			--timer := 665;
		end if;
	end if;

--again
	if again = '1' then
		if timer /= 1192 then
			timer := timer + 1;
		elsif timer = 1192 then
			timer := 1117;
		end if;
		if sWhack3 = '1' or sWhack2 = '1' or sWhack1 = '1' or sWhack0 = '1' then
			temp3    := 89;
			temp2    := 89;
			temp1    := 89;
			temp0    := 89;
			
			trig3  := '0';
			trig2  := '0';
			trig1  := '0';
			trig0  := '0';
			
			score3 := 0;
			score2 := 0;
			score1 := 0;
			score0 := 0;
			
			timer  :=  0;
			
			start  := '1';
			play   := '0';
			again  := '0';
		end if;
	end if;
	
--Game Start	
--if start = '0' and play = '1' and again = '0' then

--Display[3]
if whack3 = '1' and rand3 = '1' and trig3 = '0' and super3 = '0' then 
	temp3 := 0;
		if score3 /= 99 then
			score3 := score3 + 1;
		elsif score3 = 99 then
			score3 := 0;
		end if;
	trig3 := '1';
elsif sWhack3 = '1' and rand3 = '1' and trig3 = '0' and super3 = '1' then 
	temp3 := 0;
		if score3 /= 99 then
			score3 := score3 + 2;
		elsif score3 = 99 then
			score3 := 1;
		end if;
	trig3 := '1';	
end if;

if trig3 = '1' then
		if temp3 /= 90 then
			temp3 := temp3 + 1;
		elsif temp3 = 90 then
			trig3 := '0';
			temp3 := 89;
		end if;
end if;
--end if;

--Display[2]
if whack2 = '1' and rand2 = '1' and trig2 = '0' and super2 = '0' then
	temp2 := 0;
		if score2 /= 99 then
		score2 := score2 + 1;
		elsif score2 = 99 then
		score2 := 0;
		end if;	
	trig2 := '1';
elsif sWhack2 = '1' and rand2 = '1' and trig2 = '0' and super2 = '1' then
	temp2 := 0;
		if score2 /= 99 then
			score2 := score2 + 2;
		elsif score2 = 99 then
			score2 := 1;
		end if;	
	trig2 := '1';
end if;

if trig2 = '1' then
		if temp2 /= 90 then
			temp2 := temp2 + 1;
		elsif temp2 = 90 then
			trig2 := '0';
			temp2 := 89;
		end if;
end if;

--Display[1]
if whack1 = '1' and rand1 = '1' and trig1 = '0' and super1 = '0' then
	temp1  := 0;
		if score1 /= 99 then
			score1 := score1 + 1;
		elsif score1 = 99 then
			score1 := 0;
		end if;
	trig1  := '1';
elsif sWhack1 = '1' and rand1 = '1' and trig1 = '0' and super1 = '1' then
	temp1  := 0;
		if score1 /= 99 then
			score1 := score1 + 2;
		elsif score1 = 99 then
			score1 := 1;
		end if;
	trig1  := '1';
end if;
if trig1 = '1' then
		if temp1 /= 90 then
			temp1 := temp1 + 1;
		elsif temp1 = 90 then
			trig1 := '0';
			temp1 := 89;
		end if;
end if;

--Display[0]
if whack0 = '1' and rand0 = '1' and trig0 = '0' and super0 = '0' then
	temp0  := 0;
		if score0 /= 99 then
			score0 := score0 + 1;
		elsif score0 = 99 then
			score0 := 0;
		end if;
	trig0  := '1';
elsif sWhack0 = '1' and rand0 = '1' and trig0 = '0' and super0 = '1' then
	temp0  := 0;
		if score0 /= 99 then
			score0 := score0 + 2;
		elsif score0 = 99 then
			score0 := 1;
		end if;
	trig0  := '1';
end if;

if trig0 = '1' then
		if temp0 /= 90 then
			temp0 := temp0 + 1;
		elsif temp0 = 90 then
			trig0 := '0';
			temp0 := 89;
		end if;
end if;

scoreT := score3 + score2 + score1 + score0;


case timer is

--start
--0 to 115			
when 0 =>
			seg5   <= "1111111";
			
			seg4   <= "1111111";
			
			seg3   <= "1111111";
			
			seg2   <= "1111111";
			
			seg1   <= "1111111";
			
			seg0   <= "1111111";
			
when 1 to 5 =>

			seg5   <= "1111111";
			
			seg4   <= "1111111";
			
			seg3   <= "1111111";
			
			seg2   <= "1111111";
			
			seg1   <= "1111111";
			
			seg0   <= "0010010"; -- S
			
when 6 to 10 =>
			seg5   <= "1111111";
			
			seg4   <= "1111111";
			
			seg3   <= "1111111";
			
			seg2   <= "1111111";
			
			seg1   <= "0010010"; -- S
			
			seg0   <= "1100011"; -- u
			
when 11 to 15 =>
			seg5   <= "1111111";
			
			seg4   <= "1111111";
			
			seg3   <= "1111111";
			
			seg2   <= "0010010"; -- S
			
			seg1   <= "1100011"; -- u
			
			seg0   <= "0001100"; -- P
			
when 16 to 20 =>
			seg5   <= "1111111";
			
			seg4   <= "1111111";
			
			seg3   <= "0010010"; -- S
			
			seg2   <= "1100011"; -- u
			
			seg1   <= "0001100"; -- P
			
			seg0   <= "0000110"; -- E
			
when 21 to 25 =>
			seg5   <= "1111111";
			
			seg4   <= "0010010"; -- S
			
			seg3   <= "1100011"; -- u
			
			seg2   <= "0001100"; -- P
			
			seg1   <= "0000110"; -- E
			
			seg0   <= "0101111"; -- r
			
when 26 to 30 =>
			seg5   <= "0010010"; -- S
			
			seg4   <= "1100011"; -- u
			
			seg3   <= "0001100"; -- P
			
			seg2   <= "0000110"; -- E
			
			seg1   <= "0101111"; -- r
			
			seg0   <= "1111111";
			
when 31 to 35 =>
			seg5   <= "1100011"; -- u
			
			seg4   <= "0001100"; -- P
			
			seg3   <= "0000110"; -- E
			
			seg2   <= "0101111"; -- r
			
			seg1   <= "1111111";
			
			seg0   <= "0010010"; -- S

when 36 to 40 =>
			seg5   <= "0001100"; -- P
			
			seg4   <= "0000110"; -- E
			
			seg3   <= "0101111"; -- r
			
			seg2   <= "1111111";
			
			seg1   <= "0010010"; -- S
			
			seg0   <= "1000111";	-- L
	
when 41 to 45 =>
			seg5   <= "0000110"; -- E
			
			seg4   <= "0101111"; -- r
			
			seg3   <= "1111111";
			
			seg2   <= "0010010"; -- S
			
			seg1   <= "1000111"; -- L
			
			seg0   <= "1100011"; -- u
		
when 46 to 50 =>
			seg5   <= "0101111"; -- r
			
			seg4   <= "1111111";
			
			seg3   <= "0010010"; -- S
			
			seg2   <= "1000111"; -- L
			
			seg1   <= "1100011"; -- u
			
			seg0   <= "0010000";	-- g
			
when 51 to 55 =>
			seg5   <= "1111111";
			
			seg4   <= "0010010"; -- S
			
			seg3   <= "1000111"; -- L
			
			seg2   <= "1100011"; -- u
			
			seg1   <= "0010000"; -- g
			
			seg0   <= "0111111"; -- -

when 56 to 60 =>
			seg5   <= "0010010"; -- S
			
			seg4   <= "1000111"; -- L
			
			seg3   <= "1100011"; -- u
			
			seg2   <= "0010000"; -- g
			
			seg1   <= "0111111"; -- -
			
			seg0   <= "0001000";	-- A
	
when 61 to 65 =>
			seg5   <= "1000111"; -- L
			
			seg4   <= "1100011"; -- u
			
			seg3   <= "0010000"; -- g
			
			seg2   <= "0111111"; -- -
			
			seg1   <= "0001000"; -- A
			
			seg0   <= "0111111"; -- -
		
when 66 to 70 =>
			seg5   <= "1100011"; -- u
			
			seg4   <= "0010000"; -- g
			
			seg3   <= "0111111"; -- -
			
			seg2   <= "0001000"; -- A
			
			seg1   <= "0111111"; -- -
			
			seg0   <= "0000011"; -- b
		
when 71 to 75 =>
			seg5   <= "0010000"; -- g
			
			seg4   <= "0111111"; -- -
			
			seg3   <= "0001000"; -- A
			
			seg2   <= "0111111"; -- -
			
			seg1   <= "0000011"; -- b
			
			seg0   <= "1100011";	-- u	
			
when 76 to 80 =>
			seg5   <= "0111111"; -- -
			
			seg4   <= "0001000"; -- A
			
			seg3   <= "0111111"; -- -
			
			seg2   <= "0000011"; -- b
			
			seg1   <= "1100011"; -- u
			
			seg0   <= "0010000";	-- g
	
when 81 to 85 =>
			seg5   <= "0001000"; -- A
			
			seg4   <= "0111111"; -- -
			
			seg3   <= "0000011"; -- b
			
			seg2   <= "1100011"; -- u
			
			seg1   <= "0010000"; -- g
			
			seg0   <= "1111111";
			
when 86 to 90 =>
			seg5   <= "0111111"; -- -
			
			seg4   <= "0000011"; -- b
			
			seg3   <= "1100011"; -- u
			
			seg2   <= "0010000"; -- g
			
			seg1   <= "1111111";
			
			seg0   <= "1111111";

when 91 to 95 =>
			seg5   <= "0000011"; -- b
			
			seg4   <= "1100011"; -- u
			
			seg3   <= "0010000"; -- g
			
			seg2   <= "1111111";
			
			seg1   <= "1111111";
			
			seg0   <= "1111111";

when 96 to 100 =>
			seg5   <= "1100011"; -- u
			
			seg4   <= "0010000"; -- g
			
			seg3   <= "1111111";
			
			seg2   <= "1111111";
			
			seg1   <= "1111111";
			
			seg0   <= "1111111";

when 101 to 105 =>
			seg5   <= "0010000"; -- g
			
			seg4   <= "1111111";
			
			seg3   <= "1111111";
			
			seg2   <= "1111111";
			
			seg1   <= "1111111";
			
			seg0   <= "1111111";

when 106 to 110 =>
			seg5   <= "1111111";
			
			seg4   <= "1111111";
			
			seg3   <= "1111111";
			
			seg2   <= "1111111";
			
			seg1   <= "1111111";
			
			seg0   <= "1111111";

when 111 to 115 =>
			seg5   <= "1111111";
			
			seg4   <= "1111111";
			
			seg3   <= "1111111";
			
			seg2   <= "1111111";
			
			seg1   <= "1111111";
			
			seg0   <= "1111111";			
			
--game
--40 seconds
--116 to 1116
when 116 to 1116 =>

--Display[3]
	case temp3 is

		when 88 =>
				if rand3 = '1' then
					super3 := '1';
				end if;
	
		when 89 =>
				if rand3 = '0' then
					super3 := '0';
				end if;
				
				if rand3 = '1' and (whack3 = '0' or sWhack3 = '0') then
					if super3 = '0' then
						seg3   <= "0101011";
					elsif super3 = '1' then
						seg3   <= "1001000";
					end if;
				elsif rand3 = '0' then
					seg3   <= "1111111";
				elsif trig3 = '1' then
					seg3   <= "1111111";
				end if;
		
		when 0  => seg3 <= "1111111";
				
		when 1  => 
			if super3 = '0' then
				seg3 <= "0101011";
			elsif super3 = '1' then
				seg3   <= "1001000";
			end if;	
			
		when 2  => seg3 <= "1111111";
		
		when 3  =>
			if super3 = '0' then
				seg3 <= "0101011";
			elsif super3 = '1' then
				seg3   <= "1001000";
			end if;	
			
		when 4  => seg3 <= "1111111";
		
		when 5  =>
			if super3 = '0' then
				seg3 <= "0101011";
			elsif super3 = '1' then
				seg3   <= "1001000";
			end if;		
			
		when 6  => seg3 <= "1111111";
		
		when 7  =>
			if super3 = '0' then
				seg3 <= "0101011";
			elsif super3 = '1' then
				seg3   <= "1001000";
			end if;	
			
		when 8  => seg3 <= "1111111";
		
		when 9  =>
			if super3 = '0' then
				seg3 <= "0101011";
			elsif super3 = '1' then
				seg3   <= "1001000";
			end if;	
			
		when 10 => seg3 <= "1111111";
		
		when others =>
					seg3   <= "1111111";
			
	end case;
		
--Display[2]
	case temp2 is

		when 88 =>
				if rand2 = '1' then
					super2 := '1';
				end if;
	
		when 89 =>
				if rand2 = '0' then
					super2 := '0';
				end if;
				
				if rand2 = '1' and (whack2 = '0' or sWhack2 = '0') then
					if super2 = '0' then
						seg2   <= "0101011";
					elsif super2 = '1' then
						seg2   <= "1001000";
					end if;
				elsif rand2 = '0' then
					seg2   <= "1111111";
				elsif trig2 = '1' then
					seg2   <= "1111111";
				end if;
				
		when 0  => seg2 <= "1111111";
				
		when 1  => 
			if super2 = '0' then
				seg2 <= "0101011";
			elsif super2 = '1' then
				seg2   <= "1001000";
			end if;	

		when 2  => seg2 <= "1111111";
		
		when 3  => 
			if super2 = '0' then
					seg2 <= "0101011";
				elsif super2 = '1' then
					seg2   <= "1001000";
				end if;	
		 
		when 4  => seg2 <= "1111111";
		
		when 5  => 
			if super2 = '0' then
				seg2 <= "0101011";
			elsif super2 = '1' then
				seg2   <= "1001000";
			end if;	
		
		when 6  => seg2 <= "1111111";
		
		when 7  => 
			if super2 = '0' then
				seg2 <= "0101011";
			elsif super2 = '1' then
				seg2   <= "1001000";
			end if;	
		
		when 8  => seg2 <= "1111111";
		
		when 9  => 
			if super2 = '0' then
				seg2 <= "0101011";
			elsif super2 = '1' then
				seg2   <= "1001000";
			end if;	
		
		when 10 => seg2 <= "1111111";		

		when others =>
					seg2   <= "1111111";
	end case;

--Display[1]
	case temp1 is

		when 88 =>
				if rand1 = '1' then
					super1 := '1';
				end if;
	
		when 89 =>
				if rand1 = '0' then
					super1 := '0';
				end if;
				
				if rand1 = '1' and (whack1 = '0' or sWhack1 = '0') then
					if super1 = '0' then
						seg1   <= "0101011";
					elsif super1 = '1' then
						seg1   <= "1001000";
					end if;
				elsif rand1 = '0' then
					seg1   <= "1111111";
				elsif trig1 = '1' then
					seg1   <= "1111111";
				end if;
				
		when 0  => seg1 <= "1111111";
				
		when 1  => 
			if super1 = '0' then
				seg1 <= "0101011";
			elsif super1 = '1' then
				seg1   <= "1001000";
			end if;	

		when 2  => seg1 <= "1111111";
		
		when 3  =>
			if super1 = '0' then
				seg1 <= "0101011";
			elsif super1 = '1' then
				seg1   <= "1001000";
			end if;	
		 
		when 4  => seg1 <= "1111111";
		
		when 5  =>
			if super1 = '0' then
				seg1 <= "0101011";
			elsif super1 = '1' then
				seg1   <= "1001000";
			end if;	
		
		when 6  => seg1 <= "1111111";
		
		when 7  =>
			if super1 = '0' then
				seg1 <= "0101011";
			elsif super1 = '1' then
				seg1   <= "1001000";
			end if;	
		
		when 8  => seg1 <= "1111111";
		
		when 9  =>
			if super1 = '0' then
				seg1 <= "0101011";
			elsif super1 = '1' then
				seg1   <= "1001000";
			end if;	
		
		when 10 => seg1 <= "1111111";	

		when others =>
					seg1   <= "1111111";
					
		end case;
		
--Display[0]
	case temp0 is

		when 88 =>
				if rand0 = '1' then
					super0 := '1';
				end if;
	
		when 89 =>
				if rand0 = '0' then
					super0 := '0';
				end if;
				
				if rand0 = '1' and (whack0 = '0' or sWhack0 = '0') then
					if super0 = '0' then
						seg0   <= "0101011";
					elsif super0 = '1' then
						seg0   <= "1001000";
					end if;
				elsif rand0 = '0' then
					seg0   <= "1111111";
				elsif trig0 = '1' then
					seg0   <= "1111111";
				end if;
					
		when 0  => seg0 <= "1111111";
				
		when 1  =>
			if super0 = '0' then
				seg0 <= "0101011";
			elsif super0 = '1' then
				seg0   <= "1001000";
			end if;	

		when 2  => seg0 <= "1111111";
		
		when 3  =>
			if super0 = '0' then
				seg0 <= "0101011";
			elsif super0 = '1' then
				seg0   <= "1001000";
			end if;	
		 
		when 4  => seg0 <= "1111111";
		
		when 5  =>
			if super0 = '0' then
				seg0 <= "0101011";
			elsif super0 = '1' then
				seg0   <= "1001000";
			end if;	
		
		when 6  => seg0 <= "1111111";
		
		when 7  =>
			if super0 = '0' then
				seg0 <= "0101011";
			elsif super0 = '1' then
				seg0   <= "1001000";
			end if;	
		
		when 8  => seg0 <= "1111111";
		
		when 9  =>
			if super0 = '0' then
				seg0 <= "0101011";
			elsif super0 = '1' then
				seg0   <= "1001000";
			end if;	
		
		when 10 => seg0 <= "1111111";					
						
		when others =>
					seg0   <= "1111111";
			
		end case;

if switch = '0' then
	case scoreT is
		when 0 =>
					seg5   <= "1000000";			
					seg4   <= "1000000"; --seg4 0

		when 1 =>
					seg5   <= "1000000";			
					seg4   <= "1111001"; --seg4 1

		when 2 =>
					seg5   <= "1000000";			
					seg4   <= "0100100"; --seg4 2
					
		when 3 =>
					seg5   <= "1000000";			
					seg4   <= "0110000"; --seg4 3
					
		when 4 =>
					seg5   <= "1000000";			
					seg4   <= "0011001"; --seg4 4
					
		when 5 =>
					seg5   <= "1000000";			
					seg4   <= "0010010"; --seg4 5
					
		when 6 =>
					seg5   <= "1000000";			
					seg4   <= "0000010"; --seg4 6
					
		when 7 =>
					seg5   <= "1000000";			
					seg4   <= "1111000"; --seg4 7
					
		when 8 =>
					seg5   <= "1000000";			
					seg4   <= "0000000"; --seg4 8
					
		when 9 =>
					seg5   <= "1000000";			
					seg4   <= "0010000"; --seg4 9
		---------------------------------------
		when 10 =>  --10
					seg5   <= "1111001";			
					seg4   <= "1000000";
					
		when 11 =>
					seg5   <= "1111001";			
					seg4   <= "1111001";
					
		when 12 =>
					seg5   <= "1111001";			
					seg4   <= "0100100";
					
		when 13 =>
					seg5   <= "1111001";
					seg4   <= "0110000";
					
		when 14 =>
					seg5   <= "1111001";
					seg4   <= "0011001";

		when 15 =>
					seg5   <= "1111001";
					seg4   <= "0010010";
					
		when 16 =>
					seg5   <= "1111001";
					seg4   <= "0000010";
					
		when 17 =>
					seg5   <= "1111001";
					seg4   <= "1111000";
					
		when 18 =>
					seg5   <= "1111001";
					seg4   <= "0000000";
					
		when 19 =>
					seg5   <= "1111001";
					seg4   <= "0010000";
					
		when 20 => --20
					seg5   <= "0100100";
					seg4   <= "1000000";
					
		when 21 =>
					seg5   <= "0100100";
					seg4   <= "1111001";
					
		when 22 =>
					seg5   <= "0100100";
					seg4   <= "0100100";
					
		when 23 =>
					seg5   <= "0100100";
					seg4   <= "0110000";
					
		when 24 =>
					seg5   <= "0100100";
					seg4   <= "0011001";
					
		when 25 =>
					seg5   <= "0100100";
					seg4   <= "0010010";
					
		when 26 =>
					seg5   <= "0100100";
					seg4   <= "0000010";
					
		when 27 =>
					seg5   <= "0100100";
					seg4   <= "1111000";
					
		when 28 =>
					seg5   <= "0100100";
					seg4   <= "0000000";
					
		when 29 =>
					seg5   <= "0100100";
					seg4   <= "0010000";
					
		when 30 =>  --30
					seg5   <= "0110000";
					seg4   <= "1000000";
					
		when 31 =>
					seg5   <= "0110000";
					seg4   <= "1111001";
					
		when 32 =>
					seg5   <= "0110000";
					seg4   <= "0100100";
					
		when 33 =>
					seg5   <= "0110000";
					seg4   <= "0110000";
					
		when 34 =>
					seg5   <= "0110000";
					seg4   <= "0011001";
					
		when 35 =>
					seg5   <= "0110000";
					seg4   <= "0010010";
					
		when 36 =>
					seg5   <= "0110000";
					seg4   <= "0000010";
					
		when 37 =>
					seg5   <= "0110000";
					seg4   <= "1111000";
					
		when 38 =>
					seg5   <= "0110000";
					seg4   <= "0000000";
					
		when 39 =>
					seg5   <= "0110000";
					seg4   <= "0010000";
					
		when 40 =>  --40
					seg5   <= "0011001";
					seg4   <= "1000000";
					
		when 41 =>
					seg5   <= "0011001";
					seg4   <= "1111001";
					
		when 42 =>
					seg5   <= "0011001";
					seg4   <= "0100100";
					
		when 43 =>
					seg5   <= "0011001";
					seg4   <= "0110000";
					
		when 44 =>
					seg5   <= "0011001";
					seg4   <= "0011001";
					
		when 45 =>
					seg5   <= "0011001";
					seg4   <= "0010010";
					
		when 46 =>
					seg5   <= "0011001";
					seg4   <= "0000010";
					
		when 47 =>
					seg5   <= "0011001";
					seg4   <= "1111000";
					
		when 48 =>
					seg5   <= "0011001";
					seg4   <= "0000000";

		when 49 =>
					seg5   <= "0011001";
					seg4   <= "0010000";
					
		when 50 =>  --50
					seg5   <= "0010010";
					seg4   <= "1000000";
					
		when 51 =>
					seg5   <= "0010010";
					seg4   <= "1111001";
					
		when 52 =>
					seg5   <= "0010010";
					seg4   <= "0100100";
					
		when 53 =>
					seg5   <= "0010010";
					seg4   <= "0110000";
					
		when 54 =>
					seg5   <= "0010010";
					seg4   <= "0011001";
					
		when 55 =>
					seg5   <= "0010010";
					seg4   <= "0010010";
					
		when 56 =>
					seg5   <= "0010010";
					seg4   <= "0000010";
					
		when 57 =>
					seg5   <= "0010010";
					seg4   <= "1111000";
					
		when 58 =>
					seg5   <= "0010010";
					seg4   <= "0000000";
					
		when 59 =>
					seg5   <= "0010010";
					seg4   <= "0010000";

		when 60 =>  --60
					seg5   <= "0000010";
					seg4   <= "1000000";
					
		when 61 =>
					seg5   <= "0000010";
					seg4   <= "1111001";
					
		when 62 =>
					seg5   <= "0000010";
					seg4   <= "0100100";
					
		when 63 =>
					seg5   <= "0000010";
					seg4   <= "0110000";
					
		when 64 =>
					seg5   <= "0000010";
					seg4   <= "0011001";
					
		when 65 =>
					seg5   <= "0000010";
					seg4   <= "0010010";
					
		when 66 =>
					seg5   <= "0000010";
					seg4   <= "0000010";
					
		when 67 =>
					seg5   <= "0000010";
					seg4   <= "1111000";
					
		when 68 =>
					seg5   <= "0000010";
					seg4   <= "0000000";
					
		when 69 =>
					seg5   <= "0000010";
					seg4   <= "0010000";
					
		when 70 =>  --70
					seg5   <= "1111000";
					seg4   <= "1000000";
					
		when 71 =>
					seg5   <= "1111000";
					seg4   <= "1111001";
					
		when 72 =>
					seg5   <= "1111000";
					seg4   <= "0100100";
					
		when 73 =>
					seg5   <= "1111000";
					seg4   <= "0110000";
					
		when 74 =>
					seg5   <= "1111000";
					seg4   <= "0011001";
					
		when 75 =>
					seg5   <= "1111000";
					seg4   <= "0010010";
					
		when 76 =>
					seg5   <= "1111000";
					seg4   <= "0000010";
					
		when 77 =>
					seg5   <= "1111000";
					seg4   <= "1111000";
					
		when 78 =>
					seg5   <= "1111000";
					seg4   <= "0000000";

		when 79 =>
					seg5   <= "1111000";
					seg4   <= "0010000";
					
		when 80 =>  --80
					seg5   <= "0000000";
					seg4   <= "1000000";
					
		when 81 =>
					seg5   <= "0000000";
					seg4   <= "1111001";
					
		when 82 =>
					seg5   <= "0000000";
					seg4   <= "0100100";
					
		when 83 =>
					seg5   <= "0000000";
					seg4   <= "0110000";
					
		when 84 =>
					seg5   <= "0000000";
					seg4   <= "0011001";
					
		when 85 =>
					seg5   <= "0000000";
					seg4   <= "0010010";
					
		when 86 =>
					seg5   <= "0000000";
					seg4   <= "0000010";
					
		when 87 =>
					seg5   <= "0000000";
					seg4   <= "1111000";
					
		when 88 =>
					seg5   <= "0000000";
					seg4   <= "0000000";
					
		when 89 =>
					seg5   <= "0000000";
					seg4   <= "0010000";
					
		when 90 =>  --90
					seg5   <= "0010000";
					seg4   <= "1000000";
					
		when 91 =>
					seg5   <= "0010000";
					seg4   <= "1111001";
					
		when 92 =>
					seg5   <= "0010000";
					seg4   <= "0100100";
					
		when 93 =>
					seg5   <= "0010000";
					seg4   <= "0110000";
					
		when 94 =>
					seg5   <= "0010000";
					seg4   <= "0011001";
					
		when 95 =>
					seg5   <= "0010000";
					seg4   <= "0010010";
					
		when 96 =>
					seg5   <= "0010000";
					seg4   <= "0000010";
					
		when 97 =>
					seg5   <= "0010000";
					seg4   <= "1111000";
					
		when 98 =>
					seg5   <= "0010000";
					seg4   <= "0000000";
					
		when 99 =>
					seg5   <= "0010000";
					seg4   <= "0010000";

		when others =>
					seg5   <= "1111111";
					seg4   <= "1111111";

	end case;
end if;

if switch = '1' then
	if timer >= 116 and timer <= 140 then --40
				seg5   <= "0011001";
				seg4   <= "1000000";
				end if;
	if timer >= 141 and timer <= 165 then --39
				seg5   <= "0110000";
				seg4   <= "0010000";
				end if;
	if timer >= 166 and timer <= 190 then --38
				seg5   <= "0110000";
				seg4   <= "0000000";
				end if;
	if timer >= 191 and timer <= 215 then --37
				seg5   <= "0110000";
				seg4   <= "1111000";
				end if;
	if timer >= 216 and timer <= 240 then --36
				seg5   <= "0110000";
				seg4   <= "0000010";
				end if;
	if timer >= 241 and timer <= 265 then --35
				seg5   <= "0110000";
				seg4   <= "0010010";
				end if;
	if timer >= 266 and timer <= 290 then --34
				seg5   <= "0110000";
				seg4   <= "0011001";
				end if;
	if timer >= 291 and timer <= 315 then --33
				seg5   <= "0110000";
				seg4   <= "0110000";
				end if;
	if timer >= 316 and timer <= 340 then --32
				seg5   <= "0110000";
				seg4   <= "0100100";
				end if;
	if timer >= 341 and timer <= 365 then --31
				seg5   <= "0110000";
				seg4   <= "1111001";
				end if;
	if timer >= 366 and timer <= 390 then --30
				seg5   <= "0110000";
				seg4   <= "1000000";
				end if;
	if timer >= 391 and timer <= 415 then --29
				seg5   <= "0100100";
				seg4   <= "0010000";
				end if;
	if timer >= 416 and timer <= 440 then --28
				seg5   <= "0100100";
				seg4   <= "0000000";
				end if;
	if timer >= 441 and timer <= 465 then --27
				seg5   <= "0100100";
				seg4   <= "1111000";
				end if;
	if timer >= 466 and timer <= 490 then --26
				seg5   <= "0100100";
				seg4   <= "0000010";
				end if;
	if timer >= 491 and timer <= 515 then --25
				seg5   <= "0100100";
				seg4   <= "0010010";
				end if;
	if timer >= 516 and timer <= 540 then --24
				seg5   <= "0100100";
				seg4   <= "0011001";
				end if;
	if timer >= 541 and timer <= 565 then --23
				seg5   <= "0100100";
				seg4   <= "0110000";
				end if;
	if timer >= 566 and timer <= 590 then --22
				seg5   <= "0100100";
				seg4   <= "0100100";
				end if;
	if timer >= 591 and timer <= 615 then --21
				seg5   <= "0100100";
				seg4   <= "1111001";
				end if;
	if timer >= 616 and timer <= 640 then --20
				seg5   <= "0100100";
				seg4   <= "1000000";
				end if;
	if timer >= 641 and timer <= 665 then --19
				seg5   <= "1111001";
				seg4   <= "0010000";
				end if;
	if timer >= 666 and timer <= 690 then --18
				seg5   <= "1111001";
				seg4   <= "0000000";
				end if;
	if timer >= 691 and timer <= 715 then --17
				seg5   <= "1111001";
				seg4   <= "1111000";
				end if;
	if timer >= 716 and timer <= 740 then --16
				seg5   <= "1111001";
				seg4   <= "0000010";
				end if;
	if timer >= 741 and timer <= 765 then --15
				seg5   <= "1111001";
				seg4   <= "0010010";
				end if;
	if timer >= 766 and timer <= 790 then --14
				seg5   <= "1111001";
				seg4   <= "0011001";
				end if;
	if timer >= 791 and timer <= 815 then --13
				seg5   <= "1111001";
				seg4   <= "0110000";
				end if;
	if timer >= 816 and timer <= 840 then --12
				seg5   <= "1111001";
				seg4   <= "0100100";
				end if;
	if timer >= 841 and timer <= 865 then --11
				seg5   <= "1111001";
				seg4   <= "1111001";
				end if;
	if timer >= 866 and timer <= 890 then --10
				seg5   <= "1111001";
				seg4   <= "1000000";
				end if;
	if timer >= 891 and timer <= 915 then --09
				seg5   <= "1000000";
				seg4   <= "0010000";
				end if;
	if timer >= 916 and timer <= 940 then --08
				seg5   <= "1000000";
				seg4   <= "0000000";
				end if;
	if timer >= 941 and timer <= 965 then --07
				seg5   <= "1000000";
				seg4   <= "1111000";
				end if;
	if timer >= 966 and timer <= 990 then --06
				seg5   <= "1000000";
				seg4   <= "0000010";
				end if;
	if timer >= 991 and timer <= 1015 then --05
				seg5   <= "1000000";
				seg4   <= "0010010";
				end if;
	if timer >= 1016 and timer <= 1040 then --04
				seg5   <= "1000000";
				seg4   <= "0011001";
				end if;
	if timer >= 1041 and timer <= 1065 then --03
				seg5   <= "1000000";
				seg4   <= "0110000";
				end if;
	if timer >= 1066 and timer <= 1090 then --02
				seg5   <= "1000000";
				seg4   <= "0100100";
				end if;
	if timer >= 1091 and timer <= 1115 then --01
				seg5   <= "1000000";
				seg4   <= "1111001";
				end if;
	if timer = 1116 then         --00
				seg5   <= "1000000";
				seg4   <= "1000000";
				end if;
end if;

--again
--1117 to 1192
when 1117 to 1120 =>
			seg5   <= "1111111";
			seg4   <= "1111111";
			seg3   <= "1111111";
			seg2   <= "1111111";
			seg1   <= "1111111";
			seg0   <= "1111111";
when 1121 to 1125 =>
			seg5   <= "1111111";
			seg4   <= "1111111";
			seg3   <= "1111111";
			seg2   <= "1111111";
			seg1   <= "1111111";
			seg0   <= "0010000"; -- g
when 1126 to 1130 =>
			seg5   <= "1111111";
			seg4   <= "1111111";
			seg3   <= "1111111";
			seg2   <= "1111111";
			seg1   <= "0010000"; -- g
			seg0   <= "0100011"; -- o
when 1131 to 1135 =>
			seg5   <= "1111111";
			seg4   <= "1111111";
			seg3   <= "1111111";
			seg2   <= "0010000"; -- g
			seg1   <= "0100011"; -- o
			seg0   <= "0100011"; -- o
when 1136 to 1140 =>
			seg5   <= "1111111";
			seg4   <= "1111111";
			seg3   <= "0010000"; -- g
			seg2   <= "0100011"; -- o
			seg1   <= "0100011"; -- o
			seg0   <= "0100001"; -- d
when 1141 to 1145 =>
			seg5   <= "1111111";
			seg4   <= "0010000"; -- g
			seg3   <= "0100011"; -- o
			seg2   <= "0100011"; -- o
			seg1   <= "0100001"; -- d
			seg0   <= "1111111";
when 1146 to 1150 =>
			seg5   <= "0010000"; -- g
			seg4   <= "0100011"; -- o
			seg3   <= "0100011"; -- o
			seg2   <= "0100001"; -- d
			seg1   <= "1111111";
			seg0   <= "1100001"; -- J
when 1151 to 1155 =>
			seg5   <= "0100011"; -- o
			seg4   <= "0100011"; -- o
			seg3   <= "0100001"; -- d
			seg2   <= "1111111";
			seg1   <= "1100001"; -- J
			seg0   <= "0100011"; -- o
when 1156 to 1160 =>
			seg5   <= "0100011"; -- o
			seg4   <= "0100001"; -- d
			seg3   <= "1111111";
			seg2   <= "1100001"; -- J
			seg1   <= "0100011"; -- o
			seg0   <= "0000011"; -- b
when 1161 to 1165 =>
			seg5   <= "0100001"; -- d
			seg4   <= "1111111";
			seg3   <= "1100001"; -- J
			seg2   <= "0100011"; -- o
			seg1   <= "0000011"; -- b
			seg0   <= "1111111";
when 1166 to 1170 =>
			seg5   <= "1111111";
			seg4   <= "1100001"; -- J
			seg3   <= "0100011"; -- o
			seg2   <= "0000011"; -- b
			seg1   <= "1111111";
			seg0   <= "1111111";
when 1171 to 1175 =>
			seg5   <= "1100001"; -- J
			seg4   <= "0100011"; -- o
			seg3   <= "0000011"; -- b
			seg2   <= "1111111";
			seg1   <= "1111111";
			seg0   <= "1111111";
when 1176 to 1180 =>
			seg5   <= "0100011"; -- o
			seg4   <= "0000011"; -- b
			seg3   <= "1111111";
			seg2   <= "1111111";
			seg1   <= "1111111";
			seg0   <= "1111111";
when 1181 to 1185 =>
			seg5   <= "0000011"; -- b
			seg4   <= "1111111";
			seg3   <= "1111111";
			seg2   <= "1111111";
			seg1   <= "1111111";
			seg0   <= "1111111";
when others =>
			seg5   <= "1111111";
			seg4   <= "1111111";
			seg3   <= "1111111";
			seg2   <= "1111111";
			seg1   <= "1111111";
			seg0   <= "1111111";

end case;
end if;
--end if;
end process;
end rtl;