library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Multiplier is
	Port(
		A, B : in std_logic_vector(4 downto 0);
		result : out std_logic_vector(9 downto 0)
	);
end Multiplier;
architecture ArchMultiplier of Multiplier is
	component FullAdder3 is
	Port(
		A, B, cin, X : in std_logic;
		result, cout: out std_logic
	);
	end component;
	signal AMSB, BMSB : std_logic;
	signal Alsb, Blsb : std_logic_vector(3 downto 0);
	signal AProdBMSB, AProdBlsb, BProdAMSB, BProdAlsb : std_logic_vector(4 downto 0);
	signal carry_in, carry_in2: std_logic_vector(5 downto 0) := (others => '0');
	signal carry_in3: std_logic_vector(10 downto 0) := (others => '0');
	signal partialSumABLSB, partialSumABMSB : std_logic_vector(4 downto 0) := (others => '0');
	signal product,product2, partial, partial2 : std_logic_vector(9 downto 0) := (others => '0');
	signal a_decimal, b_decimal : integer;
begin
		AMSB <= A(4);
		BMSB <= B(4);
		Alsb <= A(3 downto 0);
		Blsb <= B(3 downto 0);
		AProdBMSB <= "000" & AMSB & BMSB;
		AProdBlsb <= AMSB & Blsb;
		BProdAMSB <= "000" & BMSB & AMSB;
		BProdAlsb <= BMSB & Alsb;
		adder1 : for i in 0 to 4 generate
			FullAdder1 : FullAdder3 Port Map (A => AProdBMSB(i), B => AProdBMSB(i), X => '0', cin => carry_in(i), result => partialSumABMSB(i), cout => carry_in(i+1));
		end generate;
		adder2 : for i in 0 to 4 generate
			FullAdder2 : FullAdder3 Port Map (A => AProdBlsb(i), B => AProdBlsb(i), X => '0', cin => carry_in2(i), result => partialSumABLSB(i), cout => carry_in2(i+1));
		end generate;
		partial <= partialSumABMSB & partialSumABLSB;
		partial2 <= "00000" & AProdBlsb;
		adder3 : for i in 0 to 9 generate
			FullAdder1_2 : FullAdder3 Port Map (A => partial(i), B => partial2(i), X => '0', cin => carry_in3(i), result => product(i), cout => carry_in3(i+1));
		end generate;
		a_decimal <= conv_integer(A);
		 b_decimal <= conv_integer(B);
		 product2 <= conv_std_logic_vector(a_decimal * b_decimal, 10);
		result <= product2;
end ArchMultiplier;