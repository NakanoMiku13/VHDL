library IEEE;
use IEEE.std_logic_1164.all;
entity StairButton is
	Port(
		a,b : in std_logic;
		x1, x2, x3, x4: out std_logic
	);
end StairButton;
architecture Stair of StairButton is
begin
	process (a,b)
	begin
		x1 <= '1';
		x2 <= '1';
		x4 <= '1';
		x3 <= not (a or b);
	end process;
end Stair;