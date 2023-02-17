library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;
ENTITY sumador IS
       GENeric (n:INTEGER:=7); 
       PORT (A,B : IN std_logic_vector(n-1 DOWNTO 0); 
             AmasB : OUT std_logic_vector(n-1 DOWNTO 0));
END sumador;
 
     ARCHITECTURE synth OF sumador IS
     BEGIN

       PROCESS (A,B) IS
       BEGIN
         AmasB <= std_logic_vector(UNSIGNED(A) + UNSIGNED(B));
       END PROCESS;
END synth;