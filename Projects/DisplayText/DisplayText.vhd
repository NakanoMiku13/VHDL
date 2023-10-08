library IEEE;
use IEEE.std_logic_1164.all;
entity DisplayText is
	Port(
		clock, reset : in std_logic;
		selector : in std_logic_vector(3 downto 0);
		displaySegments : out std_logic_vector(6 downto 0);
		displayNumbers : out std_logic_vector(3 downto 0));
end DisplayText;
architecture ArchDisplay of DisplayText is
	component FrecuencyDivisor
		Port(
			clock, reset : in std_logic;
			maxFrecuency : in integer;
			newClock : out std_logic);
	end component;
	component ROM
		Port(
			direction : in std_logic_vector(6 downto 0);
			output : out std_logic_vector(6 downto 0));
	end component;
	signal newClock : std_logic;
	signal direction : std_logic_vector(6 downto 0) := (others => '0');
	signal outPut : std_logic_vector(6 downto 0);
begin
	Frecuency : FrecuencyDivisor
		Port map(
			clock => clock,
			reset => reset,
			maxFrecuency => 5000,
			newClock => newClock
		);
	ROMMap : ROM
		Port map(
			direction => direction,
			output => outPut
		);
	process(clock, reset)
	begin
	end process;	
end ArchDisplay;