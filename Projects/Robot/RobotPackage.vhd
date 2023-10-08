library IEEE;
use IEEE.std_logic_1164.all;
entity RobotPackage is
	Port(
		boxes : in std_logic_vector(3 downto 0);
		robotGo, robotStand : out std_logic);
end RobotPackage;
architecture Robot of RobotPackage is
begin
		process (boxes) is
		begin
			case(boxes) is
				when "1111" => robotGo <= '1'; robotStand <= '0';
				when others => robotGo <= '0'; robotStand <= '1';
			end case;
		end process;
end Robot;