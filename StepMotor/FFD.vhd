library IEEE;
use IEEE.std_logic_1164.all;
entity FFD is
	Port(
		D, clock : in std_logic;
		Q : out std_logic
	);
end FFD;
architecture ArchFFD of FFD is
begin
	process(clock)
	begin
		if rising_edge(clock) then
			Q <= D;
		end if;
	end process;
end ArchFFD;