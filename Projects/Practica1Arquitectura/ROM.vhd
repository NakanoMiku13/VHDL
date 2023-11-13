library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
entity ROM is
	Port(
		direction : in std_logic_vector(4 downto 0);
		memoryValue : out std_logic_vector(23 downto 0)
	);
end ROM;
architecture ArchROM of ROM is
	type Rom_instrucciones is array(0 to 31) of std_logic_vector(23 downto 0);
	constant TR : Rom_instrucciones := (
	--Instrucciones tipo R
		0  => "000000000000000000000000",
		1  => "000001010001000100000000",
		2  => "000010100010001000000000",
		3  => "000011110011001100000000",
		4  => "000100000100010000000000",
		5  => "000101001001010100000000",
		6  => "000110001110011000000000",
		7  => "000111111111011100000000",
		8  => "001000111000100000000000",
		9  => "001001110101100100000000",
		--Instruccines tipo I
		10 => "001010010101100000000000",
		11 => "001011101001110000000000",
		12 => "001100111110000000000000",
		--Instruccines tipo J
		13 => "001101000100000000000000",
		14 => "001110010000000000000000",
		--Instruccion NOPE
		15 => "001111000000000000000000",
		--Operations
		16 => "001100110010000000000101", -- 5 X
		17 => "001110100010000000000010", -- 2 Y
		18 => "001110100010000000000001", -- 1 Z
		19 => "001010110010000111110100", -- 500 W
		others => "000000000000000000000000"
	);
begin
	memoryValue <= TR(conv_integer(direction));
end ArchROM;