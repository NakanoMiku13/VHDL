library IEEE;
use IEEE.std_logic_1164.all;
entity Display is
	Port(
		digits : out std_logic_vector(3 downto 0);
		clock, reset : in std_logic;
		inputMessage, inputMessage2 : in std_logic_vector(27 downto 0);
		segments : out std_logic_vector(6 downto 0)
	);
end Display;
architecture ArchShifterDisplay of Display is
	signal message : std_logic_vector (27 downto 0) := inputMessage;
	signal message2 : std_logic_vector (27 downto 0) := inputMessage2;
	signal NoneMessage : std_logic_vector (27 downto 0) := (others => '0');
	signal secondClock : std_logic := '0';
	signal thirdClock : std_logic := '0';
	signal digitsDisplay : std_logic_vector(3 downto 0) := (others => '1');
	signal counter : integer := 0;
	signal counter2 : integer := 0;
	signal counter3 : integer := 0;
	signal counter4 : integer := 0;
	signal tempLetter : std_logic_vector(6 downto 0) := (others => '1');
	procedure PrintMessage(inputMessage : in std_logic_vector(55 downto 0); timeout : in integer) is
	begin
	end procedure;
begin
	-- Display message
	process(thirdClock, reset)
		variable segmenter: integer := 0;
		variable segmenter2: integer := 7;
		variable segmenter3: integer := 14;
		variable segmenter4: integer := 21;
		constant size : integer := 27;
		variable aux : integer := 0;
	begin
		if reset = '0' then
			message <= inputMessage;
			counter <= 0;
			counter4 <= 0;
			digits <= not "0000";
			segments <= not "0000000";
			segmenter := 0;
			segmenter2 := 7;
			segmenter3 := 14;
			segmenter4 := 21;
			aux := 0;
			tempLetter <= (others => '1');
		elsif rising_edge(thirdClock) then
			if counter < 200 then
				digits <= not "0001";
				tempLetter <= message(size - segmenter downto size - 6 - segmenter);
				segments <= not tempLetter;
				counter <= counter + 1;
			elsif counter < 400 then
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
			elsif counter < 600 then
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
			elsif counter < 800 then
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
			elsif counter < 1000 then
				case counter4 is
				when 0 =>
					digits <= not "1000";
					segments <= not message(size - segmenter2 downto size - 6 - segmenter2);
					counter4 <= counter4 + 1;
				when 1 => 
					digits <= not "0100";
					segments <= not message(size - segmenter3 downto size - 6 - segmenter3);
					counter4 <= counter4 + 1;
				when others =>
					digits <= not "0010";
					segments <= not message(size - segmenter4 downto size - 6 - segmenter4);
					counter4 <= 0;
				end case;
				counter <= counter + 1;
			elsif counter < 1200 then
				case counter4 is
				when 0 => 
					digits <= not "1000";
					segments <= not message(size - segmenter3 downto size - 6 - segmenter3);
					counter4 <= counter4 + 1;
				when others =>
					digits <= not "0100";
					segments <= not message(size - segmenter4 downto size - 6 - segmenter4);
					counter4 <= 0;
				end case;
				counter <= counter + 1;
			elsif counter < 1400 then
				digits <= not "1000";
				segments <= not message(size - segmenter4 downto size - 6 - segmenter4);
				counter <= counter + 1;
			else
				digits <= not "0000";
				segmenter := 0;
				segmenter2 := 7;
				segmenter3 := 14;
				segmenter4 := 21;
				counter <= 0;
				if message2 /= NoneMessage then
					message <= message2;
					message2 <= (others => '0');
				else
					message2 <= inputMessage2;
					message <= inputMessage;
				end if;
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
			if counter3 = 50000 then
				counter3 <= 0;
				thirdClock <= not thirdClock;
			else
				counter3 <= counter3 + 1;
			end if;
		end if;
	end process;
end ArchShifterDisplay;