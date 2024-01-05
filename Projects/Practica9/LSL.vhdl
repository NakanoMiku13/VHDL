library IEEE;
use IEEE.std_logic_1164.all;
entity LSL is
	Port(
		A : in std_logic_vector(3 downto 0);
		shifterResult : out std_logic_vector(3 downto 0);
		clock, reset: in std_logic
	);
end LSL;
architecture ArchLSL of LSL is
	signal shifterOutput : std_logic_vector(3 downto 0) := A;
	signal counter : integer := 0;
	signal counter2 : integer := 0;
	signal secondClock : std_logic;
begin
	process (secondClock, reset)
	begin
		if reset = '0' then
			shifterOutput <= A;
			counter2 <= 0;
		elsif rising_edge(secondClock) then
			case counter2 is
			when 0 => counter2 <= counter2 + 1; shifterOutput <= A; shifterResult <= shifterOutput; 
			when 1 => shifterOutput <= shifterOutput(2 downto 0) & '0'; counter2 <= counter2 + 1; shifterResult <= shifterOutput;
			when 2 => shifterOutput <= shifterOutput(2 downto 0) & '0'; counter2 <= counter2 + 1; shifterResult <= shifterOutput;
			when 3 => shifterOutput <= shifterOutput(2 downto 0) & '0'; counter2 <= counter2 + 1; shifterResult <= shifterOutput;
			when 4 => shifterOutput <= shifterOutput(2 downto 0) & '0'; counter2 <= counter2 + 1; shifterResult <= shifterOutput;
			--when 5 => shifterOutput <= shifterOutput(2 downto 0) & '0'; counter2 <= counter2 + 1; shifterResult <= shifterOutput;
			when others => shifterOutput <= (others => '0'); counter2 <= 0;
			end case;
		end if;
	end process;
	process(clock, reset)
	begin
		if reset = '0' then
			counter <= 0;
		elsif rising_edge(clock) then
			if counter = 8000000 then
				counter <= 0;
				secondClock <= not secondClock;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
end ArchLSL;