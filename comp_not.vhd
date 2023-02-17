library ieee;
use ieee.std_logic_1164.all;

--Entity
entity comp_not is
	
	port(
		X: in std_logic;
		S: out std_logic);
end comp_not;

--Architecture
architecture solve of comp_not is
	-- Signals,Constants,Variables,Components
	begin
		s<=not(X);
end solve;