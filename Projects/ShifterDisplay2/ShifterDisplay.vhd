library IEEE;
use IEEE.std_logic_1164.all;
entity ShifterDisplay is
	Port(
		digits : out std_logic_vector(3 downto 0);
		clock, reset : in std_logic;
		segments : out std_logic_vector(6 downto 0)
	);
end ShifterDisplay;
architecture ArchShifterDisplay of ShifterDisplay is
	signal message : std_logic_vector (76 downto 0) := "11101101011100000011011101110000000101010010101000011100101010010111101011100";
	signal secondClock : std_logic := '0';
	signal thirdClock : std_logic := '0';
	signal digitsDisplay : std_logic_vector(3 downto 0) := (others => '1');
	signal counter : integer := 0;
	signal counter2 : integer := 0;
	signal counter3 : integer := 0;
	signal counter4 : integer := 0;
	signal tempLetter : std_logic_vector(6 downto 0) := (others => '1');
begin
	-- Display message
	process(thirdClock, reset)
		variable segmenter: integer := 0;
		variable segmenter2: integer := 7;
		variable segmenter3: integer := 14;
		variable segmenter4: integer := 21;
		constant size : integer := 76;
		variable aux : integer := 0;
	begin
		if reset = '0' then
			counter <= 0;
			counter4 <= 0;
			digits <= not "0000";
			segments <= not "0000000";
			segmenter := 0;
			segmenter2 := 7;
			segmenter3 := 14;
			segmenter4 := 21;
		elsif rising_edge(thirdClock) then
			if counter < 20000 then
				digits <= not "0001";
				tempLetter <= message(size - segmenter downto size - 6 - segmenter);
				segments <= not tempLetter;
				counter <= counter + 1;
			elsif counter < 40000 then
				case counter4 is
				when 0 => 
					digits <= not "0010";
					segments <= not message(size - segmenter downto size - 6 - segmenter);
					counter4 <= counter4 + 1;
				when others =>
					digits <= not "0001";
					segments <= not message(size - segmenter2 downto size - 6 - segmenter2);
					counter4 <= 0;
				end case;
				counter <= counter + 1;
			elsif counter < 60000 then
				case counter4 is
				when 0 =>
					digits <= not "0100";
					segments <= not message(size - segmenter downto size - 6 - segmenter);
					counter4 <= counter4 + 1;
				when 1 => 
					digits <= not "0010";
					segments <= not message(size - segmenter2 downto size - 6 - segmenter2);
					counter4 <= counter4 + 1;
				when others => 
					digits <= not "0001";
					segments <= not message(size - segmenter3 downto size - 6 - segmenter3);
					counter4 <= 0;
				end case;
				counter <= counter + 1;
			elsif counter < 80000 then
				case counter4 is
				when 0 => 
					digits <= not "1000";
					segments <= not message(size - segmenter downto size - 6 - segmenter);
					counter4 <= counter4 + 1;
				when 1 =>
					digits <= not "0100";
					segments <= not message(size - segmenter2 downto size - 6 - segmenter2);
					counter4 <= counter4 + 1;
				when 2 => 
					digits <= not "0010";
					segments <= not message(size - segmenter3 downto size - 6 - segmenter3);
					counter4 <= counter4 + 1;
				when others =>
					digits <= not "0001";
					segments <= not message(size - segmenter4 downto size - 6 - segmenter4);
					counter4 <= 0;
				end case;
				counter <= counter + 1;
			elsif counter < 100000 then
				case counter4 is
				when 0 =>
					digits <= not "1000";
					segments <= not message(size - segmenter2 downto size - 6 - segmenter2);
					counter4 <= counter4 + 1;
				when 1 => 
					digits <= not "0100";
					segments <= not message(size - segmenter3 downto size - 6 - segmenter3);
					counter4 <= counter4 + 1;
				when 2 =>
					digits <= not "0010";
					segments <= not message(size - segmenter4 downto size - 6 - segmenter4);
					counter4 <= counter4 + 1;
				when others =>
					if aux = 0 then
						segmenter := segmenter + 21;
						aux := 1;
					end if;
					digits <= not "0001";
					segments <= not message(size - segmenter downto size - 6 - segmenter);
					counter4 <= 0;
				end case;
				counter <= counter + 1;
			elsif counter < 120000 then
				case counter4 is
				when 0 => 
					digits <= not "1000";
					segments <= not message(size - segmenter3 downto size - 6 - segmenter3);
					counter4 <= counter4 + 1;
				when 1 =>
					digits <= not "0100";
					segments <= not message(size - segmenter4 downto size - 6 - segmenter4);
					counter4 <= counter4 + 1;
				when 2 => 
					digits <= not "0010";
					segments <= not message(size - segmenter downto size - 6 - segmenter);
					counter4 <= counter4 + 1;
				when others =>
					if aux = 1 then
						segmenter2 := segmenter + 7;
						aux := 0;
					end if;
					digits <= not "0001";
					segments <= not message(size - segmenter2 downto size - 6 - segmenter2);
					counter4 <= 0;
				end case;
				counter <= counter + 1;
			elsif counter < 140000 then
				case counter4 is
				when 0 =>
					digits <= not "1000";
					segments <= not message(size - segmenter4 downto size - 6 - segmenter4);
					counter4 <= counter4 + 1;
				when 1 => 
					digits <= not "0100";
					segments <= not message(size - segmenter downto size - 6 - segmenter);
					counter4 <= counter4 + 1;
				when 2 =>
					digits <= not "0010";
					segments <= not message(size - segmenter2 downto size - 6 - segmenter2);
					counter4 <= counter4 + 1;
				when others =>
					digits <= not "0001";
					if aux = 0 then
						segmenter3 := segmenter2 + 7;
						aux := 1;
					end if;
					segments <= not message(size - segmenter3 downto size - 6 - segmenter3);
					counter4 <= 0;
				end case;
				counter <= counter + 1;
			elsif counter < 160000 then
				case counter4 is
				when 0 => 
					digits <= not "1000";
					segments <= not message(size - segmenter downto size - 6 - segmenter);
					counter4 <= counter4 + 1;
				when 1 =>
					digits <= not "0100";
					segments <= not message(size - segmenter2 downto size - 6 - segmenter2);
					counter4 <= counter4 + 1;
				when 2 =>
					digits <= not "0010";
					segments <= not message(size - segmenter3 downto size - 6 - segmenter3);
					counter4 <= 0;
				when others =>
					digits <= not "0001";
					if aux = 1 then
						segmenter4 := segmenter3 + 7;
						aux := 0;
					end if;
					segments <= not message(size - segmenter4 downto size - 6 - segmenter4);
					counter4 <= 0;
				end case;
				counter <= counter + 1;
			else
				digits <= not "0000";
				if segmenter3 >= size or segmenter4 >= size then
					segmenter := 0;
					segmenter2 := 7;
					segmenter3 := 14;
					segmenter4 := 21;
				else
					segmenter := segmenter + 28;
					segmenter2 := segmenter + 7;
					segmenter3 := segmenter2 + 7;
					segmenter4 :=  segmenter3 + 7;
				end if;
				counter <= 0;
			end if;
		end if;
	end process;
	-- Frecuency divisor 1 second
	process(clock, reset)
	begin
		if reset = '0' then
			secondClock <= '0';
			counter2 <= 0;
		elsif rising_edge(clock) then
			if counter2 = 50000000 then
				counter2 <= 0;
				secondClock <= not secondClock;
			else 
				counter2 <= counter2 + 1;
			end if;
		end if;
	 end process;
	 
	 -- Frecuency divisor 10 ms
	 process(clock, reset)
	 begin
		if reset = '0' then
			thirdClock <= '0';
			counter3 <= 0;
		elsif rising_edge(clock) then
			if counter3 = 500 then
				counter3 <= 0;
				thirdClock <= not thirdClock;
			else
				counter3 <= counter3 + 1;
			end if;
		end if;
	end process;
end ArchShifterDisplay;