--Library
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity compuerta_and is
	port(
		A1,A2,A3,A4,A5,A6,A7: in std_logic;
		F: out std_logic);
end compuerta_and;

--Architecture
architecture solve of compuerta_and is
	-- Signals,Constants,Variables,Components
	begin
		F<= A1 and A2 and A3 and A4 and A5 and A6 and A7;
end solve;