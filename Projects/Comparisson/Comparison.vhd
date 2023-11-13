library IEEE;
use IEEE.std_logic_1164.all;
entity Comparison is
    Port(
        X,Y : in std_logic_vector(3 downto 0);
        higher, equal, lower : std_logic
    );
end Comparison;
architecture ArchComparator of Comparison8 is
    signal e : std_logic;
    signal h, l : std_logic_vector(4 downto 0);
	 signal h2, l2 : std_logic_vector(4 downto 0);
    component Comp1Bit is
        Port(
            x, y, hi, li : in std_logic;
            h, e, l : out std_logic
        );
    end component;
	 procedure Compare(constant a, b : in std_logic_vector(3 downto 0); signal h1, l1, e1 : inout std_logic; variable equal, higher, lower : out std_logic) is
	 begin
		for i in 0 to 3 loop
			if (a(i) = '1' and b(i) = '0') or (a(i) = b(i) and h1 = '1') then
				h1 := '1';
				l1 := '0';
				e1 := '0';
			elsif a(i) = b(i) and h1 = '0' and l1 = '0' then
				e1 := '1';
				l1 := '0';
				h1 := '0';
			elsif (a(i) = '0' and b(i) = '1') or (a(i) = b(i) and l1 = '1') then
				l1 := '1';
				e1 := '0';
				l1 := '0';
			end if;
		end loop;
		if a(3) = '1' and b(3) = '0' then
			higher <= '1';
			equal <= '0';
			lower <= equal;
		elsif a(3) = '1' and b(3) = a(3) then
			higher <= l1;
			lower <= h1;
			equal <= e1;
		else
			higher <= h1;
			lower <= l1;
			equal <= e1;
		end if;
	end procedure;
begin
    Comparison : for i in 0 to 3 generate        
        Comp : Comp1Bit Port Map(x => X(i), y => Y(i), hi => h(i), h => h(i+1), li => l(i), l => l(i+1), e => e);
    end generate;
    -- Is negative
    if X(3) = '1' and Y(3) = '0' then
        higher <= '0';
        lower <= not higher;
        equal <= higher;
    elsif X(3) = '1' and Y(3) = '1' then
        higher <= l(4);
        lower <= h(4);
        equal <= e;
    else
        higher <= h(4);
        lower <= l(4);
        equal <= e;
    end if;
end ArchComparator;