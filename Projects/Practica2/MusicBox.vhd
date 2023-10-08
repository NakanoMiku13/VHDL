library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MusicBox is
    Port ( 
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
		  do, re, mi, fa, sol, la, si : in std_logic;
        buzzer_out : out  STD_LOGIC;
		  display : out std_logic_vector(6 downto 0);
		  digits : out std_logic_vector(3 downto 0)
    );
end MusicBox;

architecture Behavioral of MusicBox is
    signal counter : STD_LOGIC_VECTOR(15 downto 0) := (others => '0');
    signal DoF : STD_LOGIC_VECTOR(15 downto 0) := "1111000011101110";
	 signal ReF : STD_LOGIC_VECTOR(15 downto 0) := "1111000011101110";
	 signal MiF : STD_LOGIC_VECTOR(15 downto 0) := "1111110101110110";
	 signal FaF : STD_LOGIC_VECTOR(15 downto 0) := "1111111111001011";
	 signal SolF : STD_LOGIC_VECTOR(15 downto 0) := "1000100001110011";
	 signal LaF : STD_LOGIC_VECTOR(15 downto 0) := "1010011111101001";
	 signal SiF : STD_LOGIC_VECTOR(15 downto 0) := "1011011011000010";
	 signal buzzer : std_logic;
	 signal te : integer := 0;
	 signal digit : integer := 0;
	 signal secondClock : std_logic := '0';
	 signal counter2 : integer range 0 to 5000;
begin
    process(clk, rst)
    begin
        if rst = '0' then
            counter <= (others => '0');
            buzzer <= '0';
				te <= 0;
        elsif rising_edge(clk) then
            counter <= counter + 1;
				if do = '0' then
					te <= 1;
					if counter = DoF then
						 buzzer <= NOT buzzer;
						 counter <= (others => '0');
					end if;
				elsif re = '0' then
					te <= 2;
					if counter = ReF then
						 buzzer <= NOT buzzer;
						 counter <= (others => '0');
					end if;
				elsif mi = '0' then
					te <= 3;
					if counter = MiF then
						 buzzer <= NOT buzzer;
						 counter <= (others => '0');
					end if;
				elsif fa = '0' then
					te <= 4;
					if counter = FaF then
						 buzzer <= NOT buzzer;
						 counter <= (others => '0');
					end if;
				elsif sol = '0' then
					te <= 5;
					if counter = SolF then
						 buzzer <= NOT buzzer;
						 counter <= (others => '0');
					end if;
				elsif la = '0' then
					te <= 6;
					if counter = LaF then
						 buzzer <= NOT buzzer;
						 counter <= (others => '0');
					end if;
				elsif si = '0' then
					te <= 7;
					if counter = SiF then
						 buzzer <= NOT buzzer;
						 counter <= (others => '0');
					end if;
				else
					te <= 0;
				end if;
        end if;
		  buzzer_out <= buzzer;
    end process;
	 
	 
	 -- Divisor de frecuencia
	 process(clk, rst)
	 begin
		if rst = '0' then
			secondClock <= '0';
		elsif rising_edge(clk) then
			if counter2 = 5000 then
				counter2 <= 0;
				secondClock <= not secondClock;
			else 
				counter2 <= counter2 + 1;
			end if;
		end if;
	 end process;
	 
	 
	 process(secondClock, rst)
	 begin
		if rst = '0' then
			digits <= not "0000";
			display <= not "0000000";
			digit <= 0;
		elsif rising_edge(secondClock) then
			case(te) is
			when 1 => -- Do
				case (digit) is
					when 0 => display <= not "1011110"; digit <= digit + 1; digits <= not "0100";
					when 1 => display <= not "1011100"; digit <= digit + 1; digits <= not "0010";
					when others => display <= not "0000000"; digit <= 0; digits <= not "0000";
				end case;
			when 2 => -- Re
				case (digit) is
					when 0 => display <= not "1010000"; digit <= digit + 1; digits <= not "0100";
					when 1 => display <= not "1111001"; digit <= digit + 1; digits <= not "0010";
					when others => display <= not "0000000"; digit <= 0; digits <= not "0000";
				end case;
			when 3 => -- Mi
				case (digit) is
					when 0 => display <= not "1010100"; digit <= digit + 1; digits <= not "0100";
					when 1 => display <= not "1010100"; digit <= digit + 1; digits <= not "0010";
					when 2 => display <= not "0000100"; digit <= digit + 1; digits <= not "0001";
					when others => display <= not "0000000"; digit <= 0; digits <= not "0000";
				end case;
			when 4 => -- Fa
				case (digit) is
					when 0 => display <= not "1110001"; digit <= digit + 1; digits <= not "0100";
					when 1 => display <= not "1110111"; digit <= digit + 1; digits <= not "0010";
					when others => display <= not "0000000"; digit <= 0; digits <= not "0000";
				end case;
			when 5 => -- Sol
				case (digit) is
					when 0 => display <= not "1101101"; digit <= digit + 1; digits <= not "0100";
					when 1 => display <= not "1011100"; digit <= digit + 1; digits <= not "0010";
					when 2 => display <= not "0000110"; digit <= digit + 1; digits <= not "0001";
					when others => display <= not "0000000"; digit <= 0; digits <= not "0000";
				end case;
			when 6 => -- La
				case (digit) is
					when 0 => display <= not "0111000"; digit <= digit + 1; digits <= not "0100";
					when 1 => display <= not "1110111"; digit <= digit + 1; digits <= not "0010";
					when others => display <= not "0000000"; digit <= 0; digits <= not "0000";
				end case;
			when 7 => -- Si
				case (digit) is
					when 0 => display <= not "1101101"; digit <= digit + 1; digits <= not "0100";
					when 1 => display <= not "0000100"; digit <= digit + 1; digits <= not "0010";
					when others => display <= not "0000000"; digit <= 0; digits <= not "0000";
				end case;
			when others =>
				display <= not "0000000"; digit <= 0; digits <= not "0000";
			end case;
		end if;
	end process;
end Behavioral;
