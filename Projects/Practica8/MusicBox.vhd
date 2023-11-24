library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity MusicBox is
    Port ( 
        clk : in  STD_LOGIC;
        rst : in  STD_LOGIC;
		  set, slatchReset : in std_logic;
		  --selector : in std_logic_vector(2 downto 0);
        buzzer_out, buzzer_out2 : out  STD_LOGIC;
		  display : out std_logic_vector(6 downto 0);
		  digits : out std_logic_vector(3 downto 0)
    );
end MusicBox;

architecture Behavioral of MusicBox is
    signal counter, counter2, counter3, te, digit, steper, count : integer := 0;
    signal DoF : STD_LOGIC_VECTOR(15 downto 0) := "1111000011101110";
	 signal ReF : STD_LOGIC_VECTOR(15 downto 0) := "1111000011101110";
	 signal selector : std_logic_vector(2 downto 0) := "111";
	 signal MiF : STD_LOGIC_VECTOR(15 downto 0) := "1111110101110110";
	 signal FaF : STD_LOGIC_VECTOR(15 downto 0) := "1111111111001011";
	 signal SolF : STD_LOGIC_VECTOR(15 downto 0) := "1000100001110011";
	 signal LaF : STD_LOGIC_VECTOR(15 downto 0) := "1010011111101001";
	 signal SiF : STD_LOGIC_VECTOR(15 downto 0) := "1011011011000010";
	 signal buzzer, buzzer2, secondClock, thirdClock: std_logic;
	 signal frecuencyController : integer := 5000;
begin
	-- Sound box
    process(thirdClock, rst)
		constant do : integer := 2617;
		constant re : integer := 2937;
		constant mi : integer := 3296;
		constant fa : integer := 3492;
		constant sol : integer := 3920;
		constant la : integer := 4400;
		constant si : integer := 4939;
		constant zz : integer := 3500;
		constant step : integer := 950;
		--constant step : integer := 830;
		--constant step : integer := 2500;
		constant second : integer := 5000;
    begin
        if rst = '0' then
            counter <= 0;
            buzzer <= '0';
				te <= 0;
				steper <= 0;
        elsif rising_edge(thirdClock) then
			-- 5000 = 1 sec
			-- Each step = 830 = 0.166 sec 
				case steper is
				when 0 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 1 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 2 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 3 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 4 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 5 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 6 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 7 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 8 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 9 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 10 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 11 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 12 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 13 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 14 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 15 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 16 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 17 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 18 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 19 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 20 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 21 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 22 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 23 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 24 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 25 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 26 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 27 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 28 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 29 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 30 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 31 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 32 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 33 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 34 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 35 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 36 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 37 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 38 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 39 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 40 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 41 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 42 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 43 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 44 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 45 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 46 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 47 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 48 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 49 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 50 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 51 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 52 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 53 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 54 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 55 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 56 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 57 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 58 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 59 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 60 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 61 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 62 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 63 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 64 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 65 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 66 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 67 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 68 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 69 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 70 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 71 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 72 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 73 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 74 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 75 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 76 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 77 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 78 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 79 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 80 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 81 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 82 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 83 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 84 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 85 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 86 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 87 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 88 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 89 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 90 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 91 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 92 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 93 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 94 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 95 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 96 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 97 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 98 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 99 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 100 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 101 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 102 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 103 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 104 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 105 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 106 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 107 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 108 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 109 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 110 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 111 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 112 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 113 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 114 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 115 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 116 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 117 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 118 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 119 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 120 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 121 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 122 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 123 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 124 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 125 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 126 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 127 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 128 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 129 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 130 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 131 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 132 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 133 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 134 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 135 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 136 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 137 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 138 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 139 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 140 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 141 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 142 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 143 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 144 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 145 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 146 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 147 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 148 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 149 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 150 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 151 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 152 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 153 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 154 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 155 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 156 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 157 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 158 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 159 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 160 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 161 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 162 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 163 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 164 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 165 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 166 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 167 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 168 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 169 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 170 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 171 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 172 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 173 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 174 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 175 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 176 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 177 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 178 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 179 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 180 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 181 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 182 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 183 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 184 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 185 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 186 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 187 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 188 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 189 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 190 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 191 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 192 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 193 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 194 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 195 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 196 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 197 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 198 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 199 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 200 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 201 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 202 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 203 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 204 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 205 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 206 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 207 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 208 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 209 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 210 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 211 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 212 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 213 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 214 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 215 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 216 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 217 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 218 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 219 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 220 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 221 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 222 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 223 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 224 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 225 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 226 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 227 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 228 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 229 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 230 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 231 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 232 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 233 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 234 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 235 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 236 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 237 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 238 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 239 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 240 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 241 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 242 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 243 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 244 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 245 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 246 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 247 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 248 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 249 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 250 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 251 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 252 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 253 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 254 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 255 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 256 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 257 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 258 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 259 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 260 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 261 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 262 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 263 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 264 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 265 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 266 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 267 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 268 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 269 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 270 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 271 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 272 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 273 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 274 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 275 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 276 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 277 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 278 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 279 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 280 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 281 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 282 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 283 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 284 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;


when 285 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 286 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 287 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 288 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 289 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 290 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 291 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 292 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 293 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 294 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 295 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 296 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 297 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 298 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 299 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 300 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 301 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 302 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 303 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 304 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 305 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 306 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 307 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 308 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 309 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 310 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 311 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 312 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 313 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 314 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 315 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 316 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 317 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 318 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 319 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 320 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 321 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 322 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 323 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 324 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 325 =>
if count < step then
count <= count + 1; frecuencyController <= mi;
else
steper <= steper + 1; count <= 0;
end if;
when 326 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 327 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 328 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 329 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 330 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 331 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 332 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 333 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 334 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 335 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 336 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 337 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 338 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 339 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 340 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 341 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 342 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 343 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 344 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 345 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 346 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 347 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 348 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 349 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 350 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 351 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 352 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 353 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 354 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 355 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 356 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 357 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 358 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 359 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 360 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 361 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 362 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 363 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 364 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 365 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 366 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 367 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 368 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 369 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 370 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 371 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 372 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 373 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 374 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 375 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 376 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 377 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 378 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 379 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 380 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 381 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 382 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 383 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 384 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 385 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 386 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 387 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 388 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 389 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 390 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 391 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 392 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 393 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 394 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 395 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 396 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 397 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 398 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 399 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 400 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 401 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 402 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 403 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 404 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 405 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 406 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 407 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 408 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 409 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 410 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 411 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 412 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 413 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 414 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 415 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 416 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 417 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 418 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 419 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 420 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 421 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 422 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 423 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 424 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 425 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 426 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 427 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 428 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 429 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 430 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 431 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 432 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 433 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 434 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 435 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 436 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 437 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 438 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 439 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 440 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 441 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 442 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 443 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 444 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 445 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 446 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 447 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 448 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 449 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 450 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 451 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 452 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 453 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 454 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 455 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 456 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 457 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 458 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 459 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 460 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 461 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 462 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 463 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 464 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 465 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 466 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 467 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 468 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 469 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 470 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 471 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 472 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 473 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 474 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 475 =>
if count < step then
count <= count + 1; frecuencyController <= do;
else
steper <= steper + 1; count <= 0;
end if;
when 476 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 477 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 478 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 479 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 480 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 481 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 482 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 483 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 484 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 485 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 486 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 487 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 488 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 489 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 490 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 491 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 492 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 493 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 494 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 495 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 496 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 497 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 498 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 499 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 500 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 501 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 502 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 503 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 504 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 505 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 506 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 507 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 508 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 509 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 510 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 511 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 512 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 513 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 514 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 515 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 516 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 517 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 518 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 519 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 520 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 521 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 522 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 523 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 524 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 525 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 526 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 527 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 528 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 529 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 530 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 531 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 532 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 533 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 534 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 535 =>
if count < step then
count <= count + 1; frecuencyController <= re;
else
steper <= steper + 1; count <= 0;
end if;
when 536 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 537 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 538 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 539 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 540 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 541 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 542 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 543 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 544 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 545 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 546 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 547 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 548 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 549 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 550 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 551 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 552 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 553 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 554 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 555 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 556 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 557 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 558 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 559 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 560 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 561 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 562 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 563 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 564 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 565 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 566 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 567 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 568 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 569 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 570 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;

when 571 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 572 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 573 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 574 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 575 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 576 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 577 =>
if count < step then
count <= count + 1; frecuencyController <= si;
else
steper <= steper + 1; count <= 0;
end if;
when 578 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 579 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 580 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 581 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 582 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 583 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 584 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 585 =>
if count < step then
count <= count + 1; frecuencyController <= la;
else
steper <= steper + 1; count <= 0;
end if;
when 586 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 587 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 588 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 589 =>
if count < step then
count <= count + 1; frecuencyController <= fa;
else
steper <= steper + 1; count <= 0;
end if;
when 590 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 591 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 592 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 593 =>
if count < step then
count <= count + 1; frecuencyController <= sol;
else
steper <= steper + 1; count <= 0;
end if;
when 594 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 595 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 596 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 597 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 598 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 599 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 600 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 601 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 602 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 603 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 604 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 605 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 606 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 607 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 608 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 609 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 610 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 611 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 612 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 613 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 614 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 615 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 616 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 617 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 618 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 619 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 620 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 621 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
when 622 =>
if count < step then
count <= count + 1; frecuencyController <= zz;
else
steper <= steper + 1; count <= 0;
end if;
				when others => steper <= 0;
				end case;
				buzzer <= not buzzer;
			end if;
		  case frecuencyController is
		  when do => te <= 1;
		  when re => te <= 2;
		  when mi => te <= 3;
		  when fa => te <= 4;
		  when sol => te <= 5;
		  when la => te <= 6;
		  when si => te <= 7;
		  when others => te <= 8;
		  end case;
		  if frecuencyController = zz then
			buzzer_out <= '1';
		  else
			buzzer_out <= buzzer;
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
	 
	 process(clk, rst, frecuencyController)
	 begin
		if rst = '0' then
			thirdClock <= '0';
		elsif rising_edge(clk) then
			if counter3 = frecuencyController then
				counter3 <= 0;
				thirdClock <= not thirdClock;
			else 
				counter3 <= counter3 + 1;
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
			when 8 => -- Silence
				case (digit) is
					when 0 => display <= not "0111111"; digit <= digit + 1; digits <= not "0100";
					when 1 => display <= not "0111111"; digit <= digit + 1; digits <= not "0010";
					when others => display <= not "0000000"; digit <= 0; digits <= not "0000";
				end case;
			when others => display <= not "0000000"; digit <= 0; digits <= not "0000";
			end case;
		end if;
	end process;
end Behavioral;
