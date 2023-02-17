
--Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Entity
entity DecoBin_BCD is
    port(
        num_bin: in  std_logic_vector(7 downto 0);
		  num_bcdA: out std_logic_vector(3 downto 0);
		  num_bcdB: out std_logic_vector(3 downto 0);
        num_bcdC: out std_logic_vector(3 downto 0));
end DecoBin_BCD;

--Architecture
architecture solve of DecoBin_BCD is
	-- Signals,Constants,Variables,Components
	begin
    --Process #1
	proceso_bcd: process(num_bin)
	--Sequential programming
	variable z: std_logic_vector(19 downto 0);
		begin
		-- Inicialización de datos en cero.
		z := (others => '0');
		-- Se realizan los primeros tres corrimientos.
		z(7 downto 0) := num_bin;
		for i in 0 to 7 loop
			-- Unidades (4 bits).
			if z(11 downto 8) > 4 then
				z(11 downto 8) := z(11 downto 8) + 3;
			end if;
			-- Decenas (4 bits).
			if z(15 downto 12) > 4 then
				z(15 downto 12) := z(15 downto 12) + 3;
			end if;
			-- Centenas (3 bits).
			if z(19 downto 16) > 4 then
				z(19 downto 16) := z(19 downto 16) + 3;
			end if;
			-- Corrimiento a la izquierda.
			z(19 downto 1) := z(18 downto 0);
		end loop;
		-- Pasando datos de variable Z, correspondiente a BCD.
		num_bcdA <= z(19 downto 16);
		num_bcdB <= z(15 downto 12);
		num_bcdC <= z(11 downto 8);
	end process;
	--Process #n...
end solve;