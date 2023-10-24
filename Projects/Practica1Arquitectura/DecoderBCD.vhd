library IEEE;
use IEEE.std_logic_1164.all;
entity DecoderBCD is
	Port(
		bcdMessage : in std_logic_vector(15 downto 0);
		message : out std_logic_vector(27 downto 0);
		clock, reset : in std_logic
	);
end DecoderBCD;
architecture ArchDecoder of DecoderBCD is
	signal counter : integer := 0;
	signal decodedMessage : std_logic_vector(27 downto 0) := (others => '0');
	function Decode(inp : std_logic_vector(3 downto 0)) return std_logic_vector is
	begin
		case inp is
			when "0000"	=> return "0111111";
			when "0001"	=> return "0000110";
			when "0010"	=> return "1011011";
			when "0011"	=> return "1001111";
			when "0100"	=> return "1100110";
			when "0101"	=> return "1101101";
			when "0110"	=> return "1111101";
			when "0111"	=> return "0000111";
			when "1000"	=> return "1111111";
			when "1001"	=> return "1101111";
			when others => return "0111111";
		end case;
	end function Decode;
begin
	process(clock, reset)
		constant max : integer := 15;
	begin
		if reset = '0' then
			counter <= 0;
			decodedMessage <= (others => '0');
		elsif rising_edge(clock) then
			decodedMessage <= Decode(bcdMessage(15 downto 12)) & Decode(bcdMessage(11 downto 8)) & Decode(bcdMessage(7 downto 4)) & Decode(bcdMessage(3 downto 0));
		end if;
		message <= decodedMessage;
	end process;
end ArchDecoder;