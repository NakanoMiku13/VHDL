library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity MorseCode is
    Port(
        button : in std_logic;
        lamp : out std_logic
    );
end MorseCode;
architecture Lamp of MorseCode is
begin
    process(button)
    begin
        if button = '1' then
            lamp <= '1';
        else
				 lamp <= '0';
        end if;
    end process;
end Lamp;