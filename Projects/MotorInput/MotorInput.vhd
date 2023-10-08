library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;
entity MotorInput is
	Port(A,B : in std_logic;
		left, right : out std_logic);
end MotorInput;
architecture MotorFunctionality of MotorInput is
begin
	process(A,B)
	begin
		if A = '1' or B = '1' then
			left <= A;
			right <= B;
		else
			left <= '0';
			right <= '0';
		end if;
	end process;
end MotorFunctionality;