library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Display is
    Port (
        segments: out STD_LOGIC_vector(7 downto 0);
        anodes,anodes1,anodes2,anodes3 : out std_logic
    );
end Display;

architecture Behavioral of Display is
    signal display_data : STD_LOGIC_VECTOR(7 downto 0) := "00000000"; -- Representa el número 9 en 7 segmentos

begin
    segments <= display_data;
    anodes <= '0';
	anodes1 <= '0';
anodes2 <= '0';
anodes3 <= '0';	-- Ánodo común activo para el dígito único
              
end Behavioral;
