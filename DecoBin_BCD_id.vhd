
--Library
library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;

--Entity
entity DecoBin_BCD_id is
    port(
        num_bin: in  std_logic_vector(12 downto 0);
		  num_bcdA: out std_logic_vector(3 downto 0);
		  num_bcdB: out std_logic_vector(3 downto 0);
		  num_bcdC: out std_logic_vector(3 downto 0);
		  num_bcdD: out std_logic_vector(3 downto 0));
end DecoBin_BCD_id;

--Architecture
architecture solve of DecoBin_BCD_id is
	-- Signals,Constants,Variables,Components
	begin
    --Process #1
	proceso_bcd: process(num_bin)
	--Sequential programming
	variable z: std_logic_vector(28 downto 0);
		begin
		-- Inicialización de datos en cero.
		z := (others => '0');
		-- Se realizan los primeros tres corrimientos.
		z(12 downto 0) := num_bin;
		for i in 0 to 12 loop
			-- Unidades (4 bits).
			if z(16 downto 13) > 4 then
				z(16 downto 13) := z(16 downto 13) + 3;
			end if;
			-- Decenas (4 bits).
			if z(20 downto 17) > 4 then
				z(20 downto 17) := z(20 downto 17) + 3;
			end if;
			-- Centenas (4 bits).
			if z(24 downto 21) > 4 then
				z(24 downto 21) := z(24 downto 21) + 3;
			end if;
			-- unidad de mil (4 bits) 
			if z(28 downto 25) > 4 then
				z(28 downto 25) := z(28 downto 25) + 3;
			end if;
			-- Corrimiento a la izquierda.
			z(28 downto 1) := z(27 downto 0);
		end loop;
		-- Pasando datos de variable Z, correspondiente a BCD.
		num_bcdA <= z(28 downto 25);
		num_bcdB <= z(24 downto 21);
		num_bcdC <= z(20 downto 17);
		num_bcdD <= z(16 downto 13);
	end process;
	--Process #n...
end solve;