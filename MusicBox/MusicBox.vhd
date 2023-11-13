library IEEE;
use IEEE.std_logic_1164.all;
entity MusicBox is 
	Port(
		clock, reset : in std_logic;
		buzzer : out std_logic
	);
end MusicBox;
architecture ArchMusicBox of MusicBox is
	signal count, count2 : integer := 0;
	signal secondClock : std_logic;
	signal buzz : std_logic;
begin
	process(clock, reset)
	begin
		if reset = '0' then
			count <= 0;
		elsif rising_edge(clock) then
			if count <= 5000000 then
				count <= 0;
				secondClock <= not secondClock;
				buzzer <= secondClock;
			else
				count <= count + 1;
			end if;
		end if;
	end process;
end ArchMusicBox;