library ieee;
use ieee.std_logic_1164.all;

entity comparador is
	generic (n: integer := 20);
	port ( A,B: in std_logic_vector(n-1 downto 0);
		 AmayorB,AigualB,AmenorB: out std_logic);
end comparador;

architecture sol of comparador is
begin
	AmayorB <= '1' when (A>B) else '0';
	AigualB <= '1' when (A=B) else '0';
	AmenorB <= '1' when (A<B) else '0';
end sol;