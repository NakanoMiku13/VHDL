library IEEE;
use IEEE.std_logic_1164.all;
entity Slatch is
	Port(
		S, R: in std_logic;
		Q, NQ : out std_logic
	);
end Slatch;
architecture ArchSlatch of Slatch is
begin
	process(S, R)
	begin
		if R = '0' then
			Q <= '0';
			NQ <= '1';
		elsif S = '0' then
			Q <= '1';
			NQ <= '0';
		end if;
	end process;
end ArchSlatch;