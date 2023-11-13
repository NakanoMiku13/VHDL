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
	signal X1, Y1, Z1, W1 : std_logic_vector(9 downto 0);
	signal resultA, x, y, z, w : integer := 0;
	signal memValue1, memValue2, memValue3, memValue4 : std_logic_vector(23 downto 0);
	component ROM is
		Port(
			direction : in std_logic_vector(4 downto 0);
			memoryValue : out std_logic_vector(23 downto 0)
		);
	end component;
begin
	Op1Value : ROM Port Map(direction => "10000", memoryValue => memValue1);
	Op2Value : ROM Port Map(direction => "10001", memoryValue => memValue2);
	Op3Value : ROM Port Map(direction => "10010", memoryValue => memValue3);
	Op4Value : ROM Port Map(direction => "10011", memoryValue => memValue4);
	process(option)
	begin
		X1 <= memValue1(9 downto 0);
		Y1 <= memValue2(9 downto 0);
		Z1 <= memValue3(9 downto 0);
		W1 <= memValue4(9 downto 0);
		resultA <= 0;
		x <= conv_integer(X1);
		y <= conv_integer(Y1);
		z <= conv_integer(Z1);
		w <= conv_integer(W1);
		case (option) is
			when "1001" =>
			-- Op 1
				resultA <= (13 * x) + (23 * y) - (w / 4);
			when "1010" =>
			-- Op 2
				resultA <= (5 * (x * x)) + (30 * x) - (z / 2);
			when "1011" =>
			-- Op 3
				resultA <= (-7 * (x * x)) - (5 * z) + (w / 5);
			when others =>
			-- ZERO
				resultA <= 0;
		end case;
	end process;
	result <= conv_std_logic_vector(resultA, 10);
end ArchFetchCycle;