library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity FetchCycle is
	Port (
		A, B: in std_logic_vector(4 downto 0);
		option : in std_logic_vector(3 downto 0);
		result : out std_logic_vector(9 downto 0)
	);
end FetchCycle;
architecture ArchFetchCycle of FetchCycle is
	signal X : integer := 0;
	signal Y : integer := 0;
	signal Z : integer := 4;
	signal W : integer := 5;
	signal resultA : integer := 0;
begin
	process(option)
	begin
		X <= conv_integer(A);
		Y <= conv_integer(B);
		resultA <= 0;
		case (option) is
			when "1001" =>
			-- Op 1
				resultA <= ((13 * X) + (23 * Y) - W) / 4;
			when "1010" =>
			-- Op 2
				resultA <= ((5 * (X * X)) + (30 * X) - Z) / 2;
			when "1011" =>
			-- Op 3
				resultA <= ((-7 * (X * X)) - (5 * Z) + W) / 5;
			when others =>
			-- ZERO
				resultA <= 0;
		end case;
	end process;
	result <= conv_std_logic_vector(resultA, 10);
end ArchFetchCycle;