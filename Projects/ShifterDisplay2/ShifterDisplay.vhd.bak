library IEEE;
use IEEE.std_logic_1164.all;
entity ShifterDisplay is
	Port(
		digits : out std_logic_vector(3 downto 0);
		clock, reset : in std_logic;
		segments : out std_logic_vector(6 downto 0));
end ShifterDisplay;
architecture ArchShifterDisplay of ShifterDisplay is
	signal secondClock : std_logic := '0';
	signal digitsDisplay : std_logic_vector(3 downto 0) := (others => '1');
	signal counter2 : integer range 0 to 5000;
	signal counter : integer := 0;
begin
	-- Display message
	process(secondClock, reset)
	begin
		if reset = '0' then
			counter <= 0;
			digits <= not "1000";
			segments <= not "0100000"; 
		elsif rising_edge(secondClock) then
			case (counter) is
				when 1 => digits <= not "0001"; counter <= counter + 1;
				when 2 => digits <= not "0010"; counter <= counter + 1;
				when 3 => digits <= not "0100"; counter <= counter + 1;
				when others => digits <= not "1000"; counter <= 0;
			end case;
			segments <= not "1111110";
		end if;
	end process;
	-- Frecuency divisor
	process(clock, reset)
	begin
		if reset = '1' then
			secondClock <= '0';
			counter2 <= 0;
		elsif rising_edge(clock) then
			if counter2 = 5000 then
				counter2 <= 0;
				secondClock <= not secondClock;
			else 
				counter2 <= counter2 + 1;
			end if;
		end if;
	 end process;
end ArchShifterDisplay;