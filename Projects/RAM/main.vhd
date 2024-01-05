library IEEE;
use IEEE.std_logic_1164.all;

use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity main is
	Port(
		push, pop, clock, reset : in std_logic;
		leds : out std_logic_vector(3 downto 0)
	);
end main;
architecture ArchMain of main is
	component RAM is
	Port(
		dataIn : in std_logic_vector(3 downto 0);
		direction : in integer;
		dataOut : out std_logic_vector(3 downto 0);
		we, clock, reset : in std_logic
	);
	end component;
	signal valIn, valOut : std_logic_vector(3 downto 0) := (others => '0');
	signal memDirection : integer := 0;
	signal we : std_logic := '0';
	signal count : integer := 0;
	signal second : std_logic;
begin
	
	process(clock, reset)
	begin
		if reset = '0' then
			count <= 0;
		elsif rising_edge(clock) then
			if count = 2850000 then
				second <= not second;
				count <= 0;
			else
				count <= count + 1;
			end if;
		end if;
	end process;
	RAM_1 : RAM Port Map(dataIn => valIn, direction => memDirection, dataOut => valOut, we => we, clock => second, reset => reset);
	process(second, reset)
	begin
		if reset = '0' then
			memDirection <= 0;
			we <= '0';
			leds <= "0110";
		elsif rising_edge(second) then
			valIn <= conv_std_logic_vector(memDirection, 4);
			we <= '0';
			if push = '0' then
				memDirection <= memDirection + 1;
				we <= '1';
			end if;
			leds <= not valOut;
		end if;
	end process;
	
end ArchMain;