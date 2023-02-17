
-- PENDIENTE POR TERMINAR¡¡¡¡¡¡¡¡¡¡


--3-input n-bit comparator
--https://github.com/VHDL-Digital-Systems
--http://blog.espol.edu.ec/sistemasdigitalesfiec

--Library
library ieee;
use ieee.std_logic_1164.all;

--Entity
Entity clasificador is
	generic ( n: integer :=8);--<-- nbits
	Port(
		A,B,C,D: in std_logic_vector(n-1 downto 0);
		AmenorigB,A_entre_B_C,A_entre_C_D,AmayorigD: out std_logic);
end clasificador;

--Architecture
Architecture solve of clasificador is
	-- Signals,Constants,Variables,Components
	Begin
		AmenorigB<='1' when (A<B or A=B) else '0';
		A_entre_B_C<='1' when (A<C and A>B) else '0';
		A_entre_C_D<='1' when (A<D and (A>C or A=C)) else '0';
		AmayorigD<='1' when (A>D or A=D) else '0';

end solve;