
--Library
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity DecoBCD_7ABC is
	port(
		en_disp: in std_logic;
		BCD_A: in std_logic_vector(3 downto 0);
		BCD_B: in std_logic_vector(3 downto 0);
		BCD_C: in std_logic_vector(3 downto 0);
		anodoA: out std_logic_vector(6 downto 0);
		anodoB: out std_logic_vector(6 downto 0);
		anodoC: out std_logic_vector(6 downto 0));
end DecoBCD_7ABC;

--Architecture
architecture solve of DecoBCD_7ABC is
	-- Signals,Constants,Variables,Components
	begin
	--Process #1
	process(BCD_A)
	--Sequential programming
		begin
		if en_disp ='1' then
			case BCD_A is
				when "0000" => anodoA<="0000001";
				when "0001" => anodoA<="1001111";
				when "0010" => anodoA<="0010010";
				when "0011" => anodoA<="0000110";
				when "0100" => anodoA<="1001100";
				when "0101" => anodoA<="0100100";
				when "0110" => anodoA<="0100000";
				when "0111" => anodoA<="0001111";
				when "1000" => anodoA<="0000000";
				when "1001" => anodoA<="0000100";
				when others => anodoA<="1111111";
			end case;
			end if;
	end process;
	process(BCD_B)
	--Sequential programming
		begin
		if en_disp ='1' then
			case BCD_B is
				when "0000" => anodoB<="0000001";
				when "0001" => anodoB<="1001111";
				when "0010" => anodoB<="0010010";
				when "0011" => anodoB<="0000110";
				when "0100" => anodoB<="1001100";
				when "0101" => anodoB<="0100100";
				when "0110" => anodoB<="0100000";
				when "0111" => anodoB<="0001111";
				when "1000" => anodoB<="0000000";
				when "1001" => anodoB<="0000100";
				when others => anodoB<="1111111";
			end case;
			end if;
	end process;
	process(BCD_C)
	--Sequential programming
		begin
		if en_disp ='1' then
			case BCD_c is
				when "0000" => anodoC<="0000001";
				when "0001" => anodoC<="1001111";
				when "0010" => anodoC<="0010010";
				when "0011" => anodoC<="0000110";
				when "0100" => anodoC<="1001100";
				when "0101" => anodoC<="0100100";
				when "0110" => anodoC<="0100000";
				when "0111" => anodoC<="0001111";
				when "1000" => anodoC<="0000000";
				when "1001" => anodoC<="0000100";
				when others => anodoC<="1111111";
			end case;
			end if;
	end process;
	--Process #n...
end solve;