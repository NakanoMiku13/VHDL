library IEEE;
use IEEE.std_logic_1164.all;
entity StepMotor is
	Port(
		clock, reset, X : in std_logic;
		motor : out std_logic_vector(3 downto 0);
		led, enable1, enable2 : out std_logic
	);
end StepMotor;
architecture ArchStepMotor of StepMotor is
	signal B : std_logic_vector(3 downto 0) := (others => '0'); 
	signal c : std_logic := '0';
	signal counter : integer;
	signal secondClock : std_logic;
	signal e1, e2 : std_logic := '0';
begin
	process(clock, reset)
	begin
		if reset = '0' then
			counter <= 0;
		elsif rising_edge(clock) then
			if counter = 700000 then
				secondClock <= not secondClock;
				counter <= 0;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
	process(secondClock, reset)
	begin
		if reset = '0' then
			B <= (others => '0');
			e1 <= '1';
			e2 <= '1';
		elsif rising_edge(secondClock) then
			c <= not c;
			if X = '1' then
				case B is
					when "1001" => B <= "0110";
					when "0110" => B <= "0101";
					when "0101" => B <= "1010";
					when "1010" => B <= "1001";
					when others => B <= "1001";
				end case;
				
			else
				case B is
					when "1010" => B <= "0101";
					when "0101" => B <= "0110";
					when "0110" => B <= "1001";
					when "1001" => B <= "1010";
					when others => B <= "1010";
				end case;
			end if;
			motor <= B;
			enable1 <= '1';
			enable1 <= '1';
			led <= c;
		end if;
	end process;
end ArchStepMotor;