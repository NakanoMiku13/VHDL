library IEEE;
use IEEE.std_logic_1164.all;
entity Clock is
	Port(
		clock : in std_logic;
		outClock : out std_logic
	);
end Clock;
architecture ClockArch of Clock is
	signal t : std_logic;
begin
	process(clock)
	begin
		if rising_edge(clock) then
			outClock <= t;
			t <= not t;
		end if;
	end process;
end ClockArch;	