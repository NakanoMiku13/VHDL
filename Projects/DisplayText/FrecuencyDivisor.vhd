library IEEE;
use IEEE.std_logic_1164.all;
entity FrecuencyDivisor is
	Port(
		clock, reset : in std_logic;
		maxFrecuency : in integer;
		newClock : out std_logic);
end FrecuencyDivisor;
architecture ArchFrecuency of FrecuencyDivisor is
	--Max 500000
	signal newClockCounter : integer := maxFrecuency;
	signal nClock : std_logic;
begin
	process(clock, reset)
		variable counter : integer := 0;
	begin
		if reset = '1' then
			newClockCounter <= 0;
			counter := 0;
			nClock <= '0';
		elsif (rising_edge(clock)) then
			if newClockCounter = counter then
				nClock <= not nClock;
				counter := 0;
			else
				counter := counter + 1;
			end if;
		end if;
	end process;
	newClock <= nClock;
end ArchFrecuency;