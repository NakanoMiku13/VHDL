library IEEE;
use IEEE.std_logic_1164.all;
entity bUSR is
	Port(
		clock, reset : in std_logic;
		input : in std_logic_vector(3 downto 0);
		selector : in std_logic_vector(1 downto 0);
		shifter : out std_logic_vector(3 downto 0);
		digits : out std_logic_vector(3 downto 0);
		segments : out std_logic_vector(6 downto 0)
	);
end bUSR;
architecture ArchbUSR of bUSR is
	--gfedcba
	--1011110
	signal displayMessage2: std_logic_vector(27 downto 0) := "0111000011111101111101111001";
	signal displayMessage3 : std_logic_vector(27 downto 0) := "0000000101111011011011011110";
	signal segmentsOutput, segmentsOutput2 : std_logic_vector(6 downto 0) := (others => '0');
	signal digitsOutput, digitsOutput2 : std_logic_vector(3 downto 0) := (others => '0');
	signal reg, LSLShifterResult, LRSShifterResult : std_logic_vector(3 downto 0) := (others => '0');
	component LSL is
		Port(
			A : in std_logic_vector(3 downto 0);
			shifterResult : out std_logic_vector(3 downto 0);
			clock, reset: in std_logic
		);
	end component;
	component LRS is
		Port(
			clock, reset : in std_logic;
			A : in std_logic_vector(3 downto 0);
			C : out std_logic_vector(3 downto 0)
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
begin
	LogicShiftLeft : LSL Port Map(A => reg, shifterResult => LSLShifterResult, clock => clock, reset => reset);
	LogicShiftRight : LRS Port Map(A => reg, C => LRSShifterResult, clock => clock, reset => reset);
	PrintMessage : Display Port Map (digits => digits, segments => segments, clock => clock, reset => reset, inputMessage => displayMessage2, inputMessage2 => displayMessage3);
	process(selector)
	begin
		case (not selector) is
			when "00" =>
				-- Memory
				shifter <= reg;
			when "01" =>
				-- Clear
				reg <= input;
				shifter <= (others => '1');
			when "10" =>
				-- LSL
				shifter <= LSLShifterResult;
			when "11" =>
				-- LRS
				shifter <= LRSShifterResult;
		end case;
	end process;
end ArchbUSR;