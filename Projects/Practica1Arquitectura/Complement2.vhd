library IEEE;
use IEEE.std_logic_1164.all;
entity Complement2 is
	Port(
		A : in std_logic_vector(15 downto 0);
		complement : out std_logic_vector(15 downto 0);
		clock, reset : std_logic
	);
end Complement2;
architecture ArchComplement2 of Complement2 is
	signal notA : std_logic_vector(15 downto 0) := not A;
	signal B : std_logic_vector(15 downto 0) := "0000000000000001";
	signal carry_in, result : std_logic_vector(16 downto 0) := (others => '0');
	component FullAdder3 is
	Port(
		A, B, cin, X : in std_logic;
		result, cout: out std_logic
	);
	end component;
begin
	adder1 : for i in 0 to 15 generate
		FullAdder1 : FullAdder3 Port Map (A => notA(i), B => B(i), X => '0', cin => carry_in(i), result => result(i), cout => carry_in(i+1));
	end generate;
	complement <= result(15 downto 0);
end ArchComplement2;