library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
use ieee.std_logic_unsigned.all;
ENTITY restador IS
       GENeric (n:INTEGER:=7); 
       PORT (A : IN std_logic_vector(n-1 DOWNTO 0); 
             B : IN std_logic_vector(n-1 DOWNTO 0);
				 c : IN std_logic_vector(n-1 DOWNTO 0); 
             ArestaB : OUT std_logic_vector(n-1 DOWNTO 0));
     END restador;
 
     ARCHITECTURE synth OF restador IS
     BEGIN
 
       PROCESS (A, B) IS
       BEGIN
         ArestaB <= std_logic_vector(UNSIGNED(A) - UNSIGNED(B)- UNSIGNED(C));
       END PROCESS;
     END synth;