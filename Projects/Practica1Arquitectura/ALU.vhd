library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Multiplicador
-- Corregir ASR
-- Agregar mensaje de suma y demas aritmeticas y mostrar resultado 5 seg despues

-- Agregar multiplicado para la 2B
entity ALU is
	Port(
		--A: in std_logic_vector(9 downto 0);
		shifterResult : out std_logic_vector(9 downto 0);
		selector : in std_logic_vector(3 downto 0);
		segments : out std_logic_vector(6 downto 0);
		digits : out std_logic_vector(3 downto 0);
		clock, reset, inputSelector : in std_logic
	);
end ALU;
architecture ArchALU of ALU is
	signal fetchResult, productResult, arithResult, leftShifterOutput, asrShifterOutput, complementOutput: std_logic_vector(9 downto 0) := (others => '0');
	signal B : std_logic_vector(9 downto 0) := "1000100011";
	signal A : std_logic_vector(9 downto 0) := "1000100011";
	signal partialSubABLSB, partialSumABLSB : std_logic_vector(7 downto 0) := (others => '0');
	signal carry_in, carry_in2 : std_logic_vector(8 downto 0) := (others => '0');
	signal bcdNumber : std_logic_vector(15 downto 0) := (others => '0');
	signal displayMessage, displayMessage2, displayMessage3 : std_logic_vector(27 downto 0) := (others => '0');
	signal segmentsOutput, segmentsOutput2 : std_logic_vector(6 downto 0) := (others => '0');
	signal digitsOutput, digitsOutput2 : std_logic_vector(3 downto 0) := (others => '0');
	signal cons : std_logic_vector(0 downto 0) := (others => '0');
	signal higherInput, lowerInput, equal  : std_logic_vector(10 downto 0) := (others => '0');
	component LeftShifter is
	Port(
		A : in std_logic_vector(9 downto 0);
		shifterResult : out std_logic_vector(9 downto 0);
		clock, reset: in std_logic
	);
	end component;
	component ArithmeticShiftRight is
	Port(
		A : in std_logic_vector(9 downto 0);
		shifterResult : out std_logic_vector(9 downto 0);
		clock, reset: in std_logic
	);
	end component;
	component Complement2 is
	Port(
		A : in std_logic_vector(9 downto 0);
		complement : out std_logic_vector(9 downto 0);
		clock, reset : std_logic
	);
	end component;
	component FullAdder3 is
	Port(
		A, B, cin, X : in std_logic;
		result, cout: out std_logic
	);
	end component;
	component BinaryToBCD is
	Port(
		input : in std_logic_vector(9 downto 0);
		output : out std_logic_vector(15 downto 0);
		clock, reset : in std_logic
	);
	end component;
	component Display is
	Port(
		digits : out std_logic_vector(3 downto 0);
		clock, reset : in std_logic;
		inputMessage, inputMessage2 : in std_logic_vector(27 downto 0);
		segments : out std_logic_vector(6 downto 0)
	);
	end component;
	component DecoderBCD is
	Port(
		bcdMessage : in std_logic_vector(15 downto 0);
		message : out std_logic_vector(27 downto 0);
		clock, reset : in std_logic
	);
	end component;
	component Multiplier is
	Port(
		A, B : in std_logic_vector(4 downto 0);
		result : out std_logic_vector(9 downto 0)
	);
	end component;
	component FetchCycle is
	Port (
		A, B: in std_logic_vector(4 downto 0);
		option : in std_logic_vector(3 downto 0);
		result : out std_logic_vector(9 downto 0)
	);
	end component;
	component Comparison is
	Port(
		A, B, H, L : in std_logic;
		Higher, Lower, Equal : out std_logic
	);
	end component;
begin
	LfShift : LeftShifter Port Map (A => A, shifterResult => leftShifterOutput, clock => clock, reset => reset);
	ASRShift : ArithmeticShiftRight Port Map (A => A, shifterResult => asrShifterOutput, clock => clock, reset => reset);
	Comp2 : Complement2 Port Map (A => A, complement => complementOutput, clock => clock, reset => reset);
	Mult : Multiplier Port Map (A => A(4 downto 0), B => B(4 downto 0), result => productResult);
	Fetch : FetchCycle Port Map (A => A(4 downto 0), B => B(4 downto 0), option => selector, result => fetchResult);
	PrintMessage : Display Port Map (digits => digitsOutput2, segments => segmentsOutput2, clock => clock, reset => reset, inputMessage => displayMessage2, inputMessage2 => displayMessage3);
	compare : for i in 0 to 9 generate
		Compare : Comparison Port Map (A => A(i), B => B(i), H => higherInput(i), L => lowerInput(i), Higher => higherInput(i+1), Equal => equal(i+1), Lower => lowerInput(i+1)); 
	end generate;
	adder : for i in 0 to 7 generate
		FullAdder : FullAdder3 Port Map (A => A(i), B => B(i), X => cons(0), cin => carry_in(i), result => partialSumABLSB(i), cout => carry_in(i+1));
	end generate;
	substract : for i in 0 to 7 generate
		Substraction : FullAdder3 Port Map (A => A(i), B => B(i), X => '1', cin => carry_in2(i), result => partialSubABLSB(i), cout => carry_in2(i+1));
	end generate;
	process(selector)
		variable auxAdder : std_logic_vector(1 downto 0) := (others => '0');
		variable auxAdderCarryOut : std_logic_vector(1 downto 0) := (others => '0');
	begin
		case selector is
		--Shifters
			when "0000" => shifterResult <= leftShifterOutput; displayMessage2 <= "0111000110110101110000000000"; digits <= digitsOutput2; segments <= segmentsOutput2; displayMessage3 <= (others => '0');
			when "0001" => shifterResult <= asrShifterOutput; displayMessage2 <= "1110111110110110100000000000"; digits <= digitsOutput2; segments <= segmentsOutput2; displayMessage3 <= (others => '0');
		--Logic part
			when "0010" => shifterResult <= not A; displayMessage2 <= "1010100101110000000001110111"; digits <= digitsOutput2; segments <= segmentsOutput2; displayMessage3 <= (others => '0');
			when "0011" => shifterResult <= complementOutput; displayMessage2 <= "1010100101110011101111011011"; digits <= digitsOutput2; segments <= segmentsOutput2; displayMessage3 <= (others => '0');
			when "0100" => shifterResult <= A and B; displayMessage2 <= "1110111011011110111100000000"; digits <= digitsOutput2; segments <= segmentsOutput2; displayMessage3 <= (others => '0');
			when "0101" => shifterResult <= A or B; displayMessage2 <= "0000000101110010100000000000"; digits <= digitsOutput2; segments <= segmentsOutput2; displayMessage3 <= (others => '0');
		--Arith ParthigherInput(10)
			when "0110" =>
			-- Adder
				auxAdder(0) := A(8) XOR (B(8) XOR cons(0));
				auxAdderCarryOut(0) := A(8) AND (B(8) XOR cons(0));
				auxAdder(1) := (A(9) XOR (B(9) XOR cons(0))) XOR auxAdderCarryOut(0);
				auxAdderCarryOut(1) := (A(9) AND (B(9) XOR cons(0))) OR ((B(9) XOR cons(0)) AND auxAdderCarryOut(0)) OR (A(9) AND auxAdderCarryOut(0));
				if auxAdderCarryOut(1) = '1' then
					displayMessage2 <= "1111001101000010100001011100";
					digits <= digitsOutput2;
					segments <= segmentsOutput2;
				else
					displayMessage2 <= "1101101001110010101001110111";
					arithResult <=  auxAdder & partialSumABLSB;
					digits <= digitsOutput;
					segments <= segmentsOutput;
				end if;
				 displayMessage3 <= (others => '0');
				shifterResult <= (others => '0');
			when "0111" =>
			-- Substraction
				auxAdder(0) := A(8) XOR B(8) XOR '1';
				auxAdderCarryOut(0) := A(8) AND (B(8) XOR '1');
				auxAdder(1) := (A(9) XOR (B(9) XOR '1')) XOR auxAdderCarryOut(0);
				displayMessage2 <= "1101101001110011111001101101";
				arithResult <=  auxAdder & partialSubABLSB;
				digits <= digitsOutput;
				segments <= segmentsOutput;
				shifterResult <= (others => '0');
				displayMessage3 <= (others => '0');
			when "1000" =>
			-- Product
				displayMessage2 <= "1110011101000010111001011110";
				arithResult <= productResult;
				digits <= digitsOutput;
				segments <= segmentsOutput;
				shifterResult <= (others => '0');
				displayMessage3 <= (others => '0');
			--when "1001" =>
				-- Divisor
			when "1001" =>
			-- Op 1
				displayMessage2 <= "0111111111001100000000000110";
				arithResult <= fetchResult;
				digits <= digitsOutput;
				segments <= segmentsOutput;
				shifterResult <= (others => '0');
				displayMessage3 <= (others => '0');
			when "1010" =>
			-- Op 2
				displayMessage2 <= "0111111111001100000001011011";
				arithResult <= fetchResult;
				digits <= digitsOutput;
				segments <= segmentsOutput;
				shifterResult <= (others => '0');
				displayMessage3 <= (others => '0');
			when "1011" =>
			-- Op 3
				displayMessage2 <= "0111111111001100000001001111";
				arithResult <= fetchResult;
				digits <= digitsOutput;
				segments <= segmentsOutput;
				shifterResult <= (others => '0');
				displayMessage3 <= (others => '0');
			when "1100" =>
			-- ZERO
				displayMessage2 <= "0111111111001100000001100110";
				arithResult <= fetchResult;
				digits <= digitsOutput;
				segments <= segmentsOutput;
				shifterResult <= (others => '0');
				displayMessage3 <= (others => '0');
			when "1101" => 
			-- Comparison
				--gfedcba
				--
				--
				displayMessage2 <= "1110111000000000001101101101"; --A IS
				-- One of both is negative
				if A(9) = '1' and B(9) = '0' then
					displayMessage3 <= "0111000101110000111000011100"; --Low
				elsif B(9) = '1' and A(9) = '0' then
					displayMessage3 <= "1110110000011010111111110110"; --High
				elsif B(9) = '1' and A(9) = '1' then
				-- Both negative
					if equal(10) = '1' then
						displayMessage3 <= "1111001110011101111101110111"; --E9UA
					elsif higherInput(10) = '1' then
						displayMessage3 <= "0111000101110000111000011100"; --Low
					else
						displayMessage3 <= "1110110000011010111111110110"; --High
					end if;
				else
				-- Positive numbers
					if equal(10) = '1' then
						displayMessage3 <= "1111001110011101111101110111"; --E9UA
					elsif higherInput(10) = '1' then
						displayMessage3 <= "1110110000011010111111110110"; --High
					else
						displayMessage3 <= "0111000101110000111000011100"; --Low
					end if;
				end if;
				digits <= digitsOutput2;
				segments <= segmentsOutput2;
				shifterResult <= (others => '0');
			when others => shifterResult <= (others => '0'); digits <= (others => '1'); segments <= (others => '1');  displayMessage3 <= (others => '0'); displayMessage2 <= (others => '0');
		end case;
	end process;
	BCD : BinaryToBCD Port Map (input => arithResult, output => bcdNumber, clock => clock, reset => reset);
	Decoder : DecoderBCD Port Map (bcdMessage => bcdNumber, message => displayMessage, clock => clock, reset => reset);
	PrintArithResult : Display Port Map (digits => digitsOutput, segments => segmentsOutput, clock => clock, reset => reset, inputMessage => displayMessage2, inputMessage2 => displayMessage);
end ArchALU;