library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity Counter is
	port
	(
		
		Num				: in		std_logic_vector(0 to 2);
		Clk				: in		std_logic;
		Load				: in		std_logic;
		Reset				: in		std_logic;
		Output			: inout	std_logic_vector(0 to 2);
		Seven_Segment	: out		std_logic_vector(6 downto 0)
		
	);
end Counter;

architecture Counter_Up of Counter is
	signal Temp : std_logic_vector(0 to 2);
begin
	Counter_Up_3bit : process (Clk,Reset) 
	begin
		if Reset='1' then
			Temp <= "000";
		elsif (Clk'event and Clk='1') then
			if Load='1' then
				Temp <= Num;
			elsif (Load='0') then
				Temp <= Temp + 1;
			end if;
		end if;
	end process Counter_Up_3bit;
	
	Output <= Temp;
	
	Display : process (Output) is
	begin
		case Output is
			when "000"	=> Seven_Segment <= "1111110"; --0
			when "001"	=> Seven_Segment <= "0110000"; --1
			when "010"	=> Seven_Segment <= "1101101"; --2
			when "011"	=> Seven_Segment <= "1111001"; --3
			when "100"	=> Seven_Segment <= "0110011"; --4
			when "101"	=> Seven_Segment <= "1011011"; --5
			when "110"	=> Seven_Segment <= "1011111"; --6
			when "111"	=> Seven_Segment <= "1110000"; --7
			when others	=> Seven_Segment <= "0000000"; --tidak ada
		end case;
	end process Display;

end Counter_Up;