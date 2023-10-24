library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MusicBox is
    Port ( 
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
		  set, slatchReset : in std_logic;
		  selector : in std_logic_vector(2 downto 0);
        buzzer_out, buzzer_out2 : out  STD_LOGIC;
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
	 signal buzzer2 : std_logic;
	 signal te : integer := 0;
	 signal digit : integer := 0;
	 signal secondClock : std_logic := '0';
	 signal counter2 : integer range 0 to 5000;
	 signal Q : std_logic := '1';
	 signal NQ : std_logic := '0';
	 component Slatch
		 Port(
			S, R: in std_logic;
			Q, NQ : out std_logic
		);
	end component;
begin
	SlatchI : Slatch
		Port map(
			S => set, R => slatchReset,
			Q => Q, NQ => NQ
		);
    process(clk, rst)
    begin
        if rst = '0' then
            counter <= (others => '0');
            buzzer <= '0';
				te <= 0;
        elsif rising_edge(clk) then
            counter <= counter + 1;
				case selector is
				when "000" =>
					te <= 1;
					if counter = DoF then
						buzzer <= NOT buzzer;
						counter <= (others => '0');
					end if;
				when "001" =>
					te <= 2;
					if counter = ReF then
						buzzer <= NOT buzzer;
						counter <= (others => '0');
					end if;
				when "010" =>
					te <= 3;
					if counter = MiF then
						buzzer <= NOT buzzer;
						counter <= (others => '0');
					end if;
				when "011" =>
					te <= 4;
					if counter = FaF then
						buzzer <= NOT buzzer;
						counter <= (others => '0');
					end if;
				when "100" =>
					te <= 5;
					if counter = SolF then
						buzzer <= NOT buzzer;
						counter <= (others => '0');
					end if;
				when "101" =>
					te <= 6;
					if counter = LaF then
						buzzer <= NOT buzzer;
						counter <= (others => '0');
					end if;
				when "110" =>
					te <= 7;
					if counter = SiF then
						buzzer <= NOT buzzer;
						counter <= (others => '0');
					end if;
				when others => te <= 0;
			end case;
			end if;
		  if Q = '1' then
				buzzer_out <= buzzer;
		  else
				buzzer_out2 <= buzzer;
			end if;
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
