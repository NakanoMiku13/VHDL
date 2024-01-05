library IEEE;
use IEEE.std_logic_1164.all;
entity LRS is
	Port(
		clock, reset : in std_logic;
		A : in std_logic_vector(3 downto 0);
		C : out std_logic_vector(3 downto 0)
	);
end LRS;
architecture ArchLRS of LRS is
	signal counter, counter2 : integer := 0;
	signal secondClock : std_logic;
	signal shifter : std_logic_vector(3 downto 0) := A;
begin
	process(secondClock, reset)
	begin
		if reset = '0' then
			counter <= 0;
			shifter <= A;
		elsif rising_edge(secondClock) then
			if counter < 5 then
				counter <= counter + 1;
				shifter <= '0' & shifter(3 downto 1);
			else
				counter <= 0;
				shifter <= A;
			end if;
		end if;
		C <= shifter;
	end process;
	process(clock, reset)
	begin
		if reset = '0' then
			counter2 <= 0;
		elsif rising_edge(clock) then
			if counter2 = 8000000 then
				counter2 <= 0;
				secondClock <= not secondClock;
			else
				counter2 <= counter2 + 1;
			end if;
		end if;
	end process;
end ArchLRS;