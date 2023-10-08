library IEEE;
use IEEE.std_logic_1164.all;

entity LeftShifter is
    Port (
        input : in std_logic_vector(9 downto 0);
        clock : in std_logic;
        reset : in std_logic;
        shiftAmount : in natural range 0 to 9;
        output : out std_logic_vector(9 downto 0)
    );
end LeftShifter;

architecture LeftShifterArch of LeftShifter is
    signal shift : std_logic_vector(9 downto 0) := (others => '0');
begin
    process(clock, reset)
    begin
        if reset = '1' then
            shift <= (others => '0');
        elsif rising_edge(clock) then
            -- Initialization of result
            if shiftAmount > 0 then
                for i in 0 to 8 loop
                    shift(i) <= shift(i + 1);
                end loop;
                shift(9) <= '0';
            end if;
        end if;
    end process;

    output <= shift;
end LeftShifterArch;
