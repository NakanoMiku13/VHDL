library IEEE;
use IEEE.std_logic_1164.all;
entity Multiplier is
	Port(
		inputA, inputB : in std_logic_vector(4 downto 0);
		clock, reset : in std_logic;
		output : out std_logic_vector(9 downto 0));
end Multiplier;
architecture ArchMultiplier of Multiplier is
	signal product : std_logic_vector(9 downto 0) := (others => '0');
begin
	process(clock, reset)
		variable counter1 : integer := 0;
		variable counter2 : integer := 0;
	begin
		if reset = '1' then
			product <= (others => '0');
			counter1 := 0;
			counter2 := 0;
		elsif rising_edge(clock) then
			if counter1 < 3 then
				if counter2 < 3 then
					if inputA(counter1) = '1' and inputB(counter2) = '1' then
						product(counter1 + counter2) <= '1';
					end if;
					counter2 := counter2 + 1;
				else
					counter2 := 0;
					counter1 := counter1 + 1;
				end if;
			end if;
		end if;
		output <= product;
	end process;
end ArchMultiplier;