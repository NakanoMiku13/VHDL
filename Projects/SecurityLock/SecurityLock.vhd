library IEEE;
use IEEE.std_logic_1164.all;
entity SecurityLock is
	Port(
		a,b,c,d : in std_logic;
		lock : out std_logic);
end SecurityLock;
architecture Lock of SecurityLock is
begin
	process(a,b,c,d)
	begin
		if(a = '1' and c = '1' and d = '1') then
			lock <= '1';
		else
			lock <= '0';
		end if;
	end process;
end Lock;