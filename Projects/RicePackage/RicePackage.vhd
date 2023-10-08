library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity RicePackage is
    Port (
        capacity : in std_logic_vector(3 downto 0);
        speaker     : out std_logic;
		  full : out std_logic;
		  empty : out : std_logic
    );
end RicePackage;

architecture VaultAnalizer of RicePackage is
begin
    process(capacity)
	 begin
		case(capacity) is
			when "1111" =>
				full <= '1';
			when "1110" or "1100" =>
				full <= '0';
			when "1000" or "0000" =>
				full <= '0';
				empty <= '1';
				speaker <= '1';
		end case;
	 end process;
end VaultAnalizer;
