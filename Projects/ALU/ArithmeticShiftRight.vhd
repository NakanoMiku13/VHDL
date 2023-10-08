library IEEE;
use IEEE.std_logic_1164.all;
entity ArithmeticShiftRight is
	Port(
		A : in std_logic_vector(9 downto 0);
		clock, reset : in std_logic;
		shiftAmount : in natural range 0 to 9;
		output : out std_logic_vector(9 downto 0)
	);
end ArithmeticShiftRight;
architecture ASRArch of ArithmeticShiftRight is
	signal shift : std_logic_vector(9 downto 0) := (others => '0');
begin
	process(clock, reset)
		constant amount : natural := shiftAmount;
	begin
		shift <= A;
		if reset = '1' then
			shift <= (others => '0');
		else
			for i in 0 to amount loop
				if(A(9) = '1') then 
					shift <= "1" & shift (8 downto 0);
				else
					shift <= "0" & shift (8 downto 0);
				end if;
			end loop;
		end if;
	end process;
	output <= shift;
end ASRArch;