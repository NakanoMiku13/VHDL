library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
entity ALU is
	Port(
		selectorOperation : in std_logic_vector(2 downto 0);
		selectorOption : in std_logic_vector(3 downto 0);
		inputA, inputB : in std_logic_vector(9 downto 0);
		displayDigits : out std_logic_vector(3 downto 0);
		displaySegments : out std_logic_vector(6 downto 0);
		output : out std_logic_vector(9 downto 0);
		clock, reset : in std_logic
		);
end ALU;
architecture ArchAlu of ALU is
	-- Shifter components
	component RightShifter
	Port (
		input : in std_logic_vector(9 downto 0);
		shiftAmount : in natural range 0 to 9;
		output : out std_logic_vector(9 downto 0);
		clock, reset : in std_logic);
	end component;
	
	component LeftShifter
	Port (
		input : in std_logic_vector(9 downto 0);
		shiftAmount : in natural range 0 to 9;
		output : out std_logic_vector(9 downto 0);
		clock, reset : in std_logic);
	end component;
	
	component ArithmeticShiftRight
	Port(
		A : in std_logic_vector(9 downto 0);
		clock, reset : in std_logic;
		shiftAmount : in natural range 0 to 9;
		output : out std_logic_vector(9 downto 0));
	end component;
	
	-- Full Adder component
	component FullAdder
	Port(
		A, B: in std_logic_vector(9 downto 0);
		clock, reset: in std_logic;
		initialCarry : in std_logic;
		Result: out std_logic_vector(9 downto 0));
	end component;
	
	-- Multiplier component
	component Multiplier
	Port(
		inputA, inputB : in std_logic_vector(4 downto 0);
		clock, reset : in std_logic;
		output : out std_logic_vector(9 downto 0));
	end component;
	
	-- Frecuency divisor
	component FrecuencyDivisor
	Port(
		clock, reset : in std_logic;
		maxFrecuency : in integer;
		newClock : out std_logic);
	end component;

	-- Signals
	-- Result signals (like functions)
	signal shifterRightResult : std_logic_vector(9 downto 0);
	signal shifterLeftResult : std_logic_vector(9 downto 0);
	signal arithShifterRightResult : std_logic_vector(9 downto 0);
	
	-- Variable signals
	-- Preassigned with 3
	signal shifterAmount : natural range 0 to 9 := 3;
	signal comp2Result : std_logic_vector(9 downto 0) := (others => '0');
	signal adderResult : std_logic_vector(9 downto 0) := (others => '0');
	signal substractionResult : std_logic_vector(9 downto 0) := (others => '0');
	signal multiplierResult : std_logic_vector(9 downto 0) := (others => '0');
	-- Predefined signals results
	signal logicResult : std_logic_vector(9 downto 0) := "0000000000";
	
	-- New clock signal
	signal newClock : std_logic;
	signal maxFrecuency : integer := 5000;
begin
	RightShift : RightShifter
		Port map (
			input => inputA,
			-- Sample value
			shiftAmount => shifterAmount,
			output => shifterRightResult,
			clock => clock,
			reset => reset
		);	
	LeftShift : LeftShifter
		Port map (
			input => inputA,
			shiftAmount => shifterAmount,
			output => shifterLeftResult,
			clock => clock,
			reset => reset
			);
	ArithShifter : ArithmeticShiftRight
		Port map(
			A => inputA,
			clock => clock,
			reset => reset,
			shiftAmount => shifterAmount,
			output => arithShifterRightResult
		);
	Adder : FullAdder
		Port map(
			A => inputA,
			B => inputB,
			initialCarry => '0',
			Result => adderResult,
			clock => clock,
			reset => reset
		);
	Substract : FullAdder
		Port map(
			A => inputA,
			B => inputB,
			initialCarry => '1',
			Result => substractionResult,
			clock => clock,
			reset => reset
		);
	Multi : Multiplier
		Port map(
			inputA => inputA(4 downto 0),
			inputB => inputB(4 downto 0),
			clock => clock,
			reset => reset,
			output => multiplierResult
		);
	Add : FullAdder
		Port map(
			A => (not inputA),
			initialCarry => '0',
			B => "0000000001",
			clock => clock,
			reset => reset,
			Result => comp2Result
		);	
	Frecuency : FrecuencyDivisor
		Port map(
			clock => clock,
			reset => reset,
			maxFrecuency => maxFrecuency,
			newClock => newClock
		);
	process(selectorOperation, selectorOption, inputA, inputB, shifterRightResult, shifterLeftResult)
		variable tempR : std_logic_vector(9 downto 0) := (others => '0');
	begin
		case (selectorOperation) is
		--Logic operation
			when "001" =>
				case (selectorOption) is
					when "0001" =>
					-- Complemento a 1 o Negacion
						logicResult <= not inputA;
					when "0011" =>
					-- Complemento a 2
						logicResult <= comp2Result;
					when "0111" =>
					-- AND de A y B
						logicResult <= inputA and inputB;
					when "1111" =>
					-- OR de A y B
						logicResult <= inputA or inputB;
					when others => logicResult <= (others => '0');
				end case;
		-- Shifters operations
			when "011" =>
				case (selectorOption) is
				-- Right Shifter
					when "0001" => logicResult <= shifterRightResult;
				-- Left Shifter
					when "0011" => logicResult <= shifterLeftResult;
				-- Arithmetic Right Shifter
					when "0111" => logicResult <= arithShifterRightResult;
					when others => logicResult <= (others => '0');
				end case;
			when "111" =>
				case (selectorOption) is
				-- Add
					when "0001" => logicResult <= adderResult;
				-- Substraction
					when "0010" => logicResult <= substractionResult;
				-- Product
					when "0100" => logicResult <= multiplierResult;
					when others => logicResult <= (others => '0');
				end case;
			when others => logicResult <= (others => '0');	
		end case;
	end process;
end ArchAlu;
