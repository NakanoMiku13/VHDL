library IEEE;
use IEEE.std_logic_1164.all;

entity FullAdder is
	Port(
		A, B: in std_logic_vector(9 downto 0);
		clock, reset : in std_logic;
		initialCarry : in std_logic;
		Result : out std_logic_vector(9 downto 0));
end FullAdder;
architecture AdderArch of FullAdder is
	signal Sum : std_logic_vector(9 downto 0) := (others => '0');
	signal FinalCarry : std_logic := '0';
	signal MidCarry : std_logic := initialCarry;
	signal HalfAdder : std_logic_vector(8 downto 0);
begin
-- Intermediate Bits
	process(clock, reset)
	begin
		if reset = '1' then
			 FinalCarry <= '0';
			 MidCarry <= '0';
			 HalfAdder <= (others => '0');
		elsif rising_edge(clock) then
			for i in 0 to 7 loop
				HalfAdder(i) <= A(i) XOR B(i) XOR MidCarry;
				MidCarry <= (A(i) AND B(i)) OR (A(i) AND MidCarry) OR (B(i) AND MidCarry);
			end loop;
			for i in 8 to 9 loop
				Sum(i) <= HalfAdder(i - 8) XOR A(i) XOR B(i) XOR FinalCarry;
				FinalCarry <= ((HalfAdder(i-8) AND (A(i) OR B(i))) OR (A(i) AND B(i)) OR (A(i) AND HalfAdder(i-8)) OR (B(i) AND HalfAdder(i-8)) );
			end loop;
		end if;
	end process;
	Result <= Sum;
end AdderArch;