--Library
library ieee;
use ieee.std_logic_1164.all;

--Entity
entity comp_or is
	port(
		A,B: in std_logic;
		F: out std_logic);
end comp_or;

--Architecture
architecture solve of comp_or is
	-- Signals,Constants,Variables,Components
	begin
		F<= A or B;
end solve;