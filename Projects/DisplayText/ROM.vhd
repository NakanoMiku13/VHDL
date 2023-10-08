library IEEE;
use IEEE.std_logic_1164.all;
entity ROM is
	Port(
		direction : in std_logic_vector(6 downto 0);
		output : out std_logic_vector(6 downto 0));
end ROM;
architecture ArchROM of ROM is
	signal message : std_logic_vector(6 downto 0) := (others => '0');
begin
	process
	begin
		case (direction) is
		-- Numbers
		-- 0
			when "0000000" => message <= "1111110";
		-- 1
			when "0000001" => message <= "0110000";
		-- 2
			when "0000010" => message <= "1101101";
		-- 3
			when "0000011" => message <= "1111001";
		-- 4
			when "0000100" => message <= "0110011";
		-- 5
			when "0000101" => message <= "1011011";
		-- 6
			when "0000110" => message <= "1011111";
		-- 7
			when "0000111" => message <= "1110000";
		-- 8
			when "0001000" => message <= "1111111";
		-- 9
			when "0001001" => message <= "1111011";
		-- Letters
		-- A
			when "0001010" => message <= "1110111";
		--	E
			when "0001011" => message <= "0111101";
		--	I
			when "0001100" => message <= "0110000";
		--	O
			when "0001101" => message <= "1110000";
		--	U
			when "0001110" => message <= "0111110";
		--	S
			when "0001111" => message <= "1011011";
		--	N
			when "0010000" => message <= "1010101";
		--	R
			when "0010001" => message <= "1100111";
		--	T
			when "0010010" => message <= "1111100";
		-- L
			when "0010011" => message <= "0111000";
		-- Others
			when others => message <= (others => '0');
		end case;
	end process;
	output <= not message;
end ArchROM;