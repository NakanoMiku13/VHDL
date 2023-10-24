library IEEE;
use IEEE.std_logic_1164.all;
entity Complement2 is
	Port(
		A : in std_logic_vector(9 downto 0);
		complement : out std_logic_vector(9 downto 0);
		clock, reset : std_logic
	);
end Complement2;
architecture ArchComplement2 of Complement2 is
	signal output : std_logic_vector(9 downto 0) := not A;
	signal counter : integer := 0;
begin
	process(clock, reset)
	begin
		if reset = '0' then
			output <= not A;
			counter <= 0;
		elsif rising_edge(clock) then
			if counter = 0 then
				output <= not A;
			end if;
			if counter < 10 then
				output(counter) <= output(counter) XOR '1';
				counter <= counter + 1;
			else
				output <= output;
			end if;
		end if;
		complement <= output;
	end process;
end ArchComplement2;