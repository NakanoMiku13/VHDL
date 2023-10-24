library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;
entity BinaryToDecimal is
	Port(
		binaryNum : in std_logic_vector(9 downto 0);
		clock, reset: in std_logic;
		segments : out std_logic_vector(6 dwonto 0);
		digitsDisplay : out std_logic_vector(3 downto 0);
		digits : out std_logic_vector(3 downto 0));
end BinaryToDecimal;
architecture ArchBinary of BinaryToDecimal is
	signal tempBCD : std_logic_vector(13 downto 0) := "0000" & binaryNum;
	signal count : integer := 0;
	signal tempDecimal : integer := 0;
	signal counter : integer := 0;
	signal secondClock : std_logic;
	signal counter2 : integer := 0;
	function GetNumber(num : std_logic_vector(3 downto 0)) return std_logic_vector is
	begin
		case num is
		--0
			when "0000" => return "1111110";
		--1
			when "0001" => return "0110000";
		--2	
			when "0010" => return "1101101";
		--3
			when "0011" => return "1111001";
		--4
			when "0100" => return "0110011";
		--5
			when "0101" => return "1011011";
		--6
			when "0110" => return "1011111";
		--7
			when "0111" => return "1110000";
		--8
			when "1000" => return "1111111";
		--9
			when "1001" => return "1111011";
			when others => return "0000000";
		end case;
	end function;
begin
	process(clock, reset)
	begin
		if reset = '1' then
			tempBCD <= (others => '0');
			count <= 0;
			tempDecimal <= 0;
		elsif rising_edge(clock) then
			tempDecimal <= to_integer(unsigned(tempBCD(13 downto 12)));
			if count < 10 then
				if tempDecimal >= 10 then
					tempDecimal <= tempDecimal + 6;
				end if;
				tempBCD(13 downto 1) <= std_logic_vector(to_unsigned(tempDecimal,12)) & '0';
				count <= count + 1;
			end if;
		end if;
		digits <= tempBCD(13 downto 10);
	end process;
	
	process(secondClock, digits)
	begin
		if reset = '1' then
			digitsDisplay <= not "0000";
			segments <= (others => '1');
		elsif rising_edge(secondClock) then
			case counter2 is
				when 0 => digitsDisplay <= not "1000"; segments <= GetNumber(digits());
			end case;
		end if;
	end process;
	
	process(clock, reset)
	begin
		if reset = '1' then
			counter <= 0;
		elsif rising_edge(clock) then
			if counter = 5000 then
				counter <= 0;
				secondClock <= not secondClock;
			else
				counter <= counter + 1;
			end if;
		end if;
	end process;
end ArchBinary;