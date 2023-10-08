library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity DisplayController is
    Port (
        clk : in  STD_LOGIC;
        reset : in  STD_LOGIC;
        text : in  STD_LOGIC_VECTOR(31 downto 0);  -- Texto a mostrar (por ejemplo, "Hola")
        seg_out : out  STD_LOGIC_VECTOR(6 downto 0); -- Salida para el display de 7 segmentos
        dig_sel : out  STD_LOGIC_VECTOR(3 downto 0)   -- Selección de dígitos (0 a 3)
    );
end DisplayController;

architecture Behavioral of DisplayController is
    signal digit_counter : integer := 0;
    signal segment_data : STD_LOGIC_VECTOR(6 downto 0);
begin
    process(clk, reset)
    begin
        if reset = '1' then
            digit_counter <= 0;
            segment_data <= "0000000"; -- Apagar todos los segmentos
        elsif rising_edge(clk) then
            -- Lógica para seleccionar dígito y mostrar texto
            case digit_counter is
                when 0 =>
                    segment_data <= conv_std_logic_vector(text(31 downto 24), 7);
                    dig_sel <= "1110"; -- Enciende el primer dígito
                when 1 =>
                    segment_data <= conv_std_logic_vector(text(23 downto 16), 7);
                    dig_sel <= "1101"; -- Enciende el segundo dígito
                when 2 =>
                    segment_data <= conv_std_logic_vector(text(15 downto 8), 7);
                    dig_sel <= "1011"; -- Enciende el tercer dígito
                when 3 =>
                    segment_data <= conv_std_logic_vector(text(7 downto 0), 7);
                    dig_sel <= "0111"; -- Enciende el cuarto dígito
            end case;

            -- Contador de dígitos
            if digit_counter < 3 then
                digit_counter <= digit_counter + 1;
            else
                digit_counter <= 0;
            end if;
        end if;
    end process;
	
    seg_out <= segment_data;
end Behavioral;
