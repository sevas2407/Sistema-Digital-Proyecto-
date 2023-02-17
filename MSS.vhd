library ieee;
use ieee.std_logic_1164.all;
entity MSS is
 port ( clock,resetn: IN STD_LOGIC;
		start,min_max,mostrar_lista: IN STD_LOGIC;
		i_mayor_j,menor_115,entre_115_125,entre_125_135: IN STD_LOGIC;
		mayor_135,i_menor,cnt_menor_127,menor_tres,fin_ram,ultima_fila,cero_cambio: IN STD_LOGIC;
		
		led_fin,D_aguda_severa,d_aguda_moderada,Riesgo_desnutr,No_desnutr: OUT STD_LOGIC;
		en_cnt,rst_cnt,en_i_cnt,rst_i_cnt,en_read,en_write,en_reg_i,rst_reg_i: OUT STD_LOGIC;
		en_reg_j,rst_reg_j,sel_j,en_clasf,rst_clasf: OUT STD_LOGIC;
		en_disp,sel_cnt,en_cnthz,rst_cnthz,sel_dato,en_cnt_cambio,rst_cnt_cambio: OUT STD_LOGIC);
			
end MSS;

architecture solve of MSS is
type estado is (T1,s0,s1,s2,T2,T3,T5,T6,T7,Tn1,Tn2,Tn3,Tn4,Tn5,T8,T9,T10,T11,T12,T13,T14,T15,T16,T17,T18,T19,T20,T21);
signal y: estado;
begin 
	MSS_transiciones: process (resetn, Clock)
	begin
	if resetn='0' then y <= T1;
	elsif (clock'event and clock ='1') then 
		case y is
			when T1 => if start='1' then y <= s0; else y <= T1; end if;
			when s0 => if start='1' then y <= s0; else y <= T2; end if;
			when T2 => if min_max='1' then y <= s1; else y <= T2; end if;
			when s1 => if min_max='1' then y <= s1; else y <= T3; end if;
			when T3 => y <= T5;
			when T5 => y <= T6;
			when T6 => if i_menor='1' then y <= T7; else y <= Tn2; end if;
			when Tn2 => y <= T5;
			when T7 => y <= Tn1;
			when Tn1 => y <= T8;
			when T8 => if i_mayor_j='1' then y <= T9;
						  elsif i_mayor_j='0' and ultima_fila='0' then y<=T11;
						  elsif i_mayor_j='0' and ultima_fila='1' and cero_cambio='0' then y<=T11;
						  elsif i_mayor_j='0' and ultima_fila='1' and cero_cambio='1' then y<= T12; end if;			
			when T9 => y <= T10;
			when T10 => y <= T11;
			when T11 => y <= T6;
			--when Ti => y <= T6;
			when T12 => y <= T13;
			when T13 => if menor_tres='0' then y <= T14; else y <= T13;end if;
		   when T14 => if mostrar_lista ='0' then y <= T14;else y <= s2; end if;
			when s2 => if mostrar_lista ='0' then y <= T15;else y <= s2; end if;
			when T15 => if cnt_menor_127='1' then y <= Tn3;end if;
			when Tn3 => y<=T16;
			when T16 => if mayor_135 = '0' and entre_125_135='0' and entre_115_125='0' and menor_115='0' then y <=T21;
							elsif mayor_135 = '0' and entre_125_135='0' and entre_115_125='0' and menor_115='1' then y <=T20;
							elsif mayor_135 = '0' and entre_125_135='0' and entre_115_125='1' then y <=T19;
							elsif mayor_135 = '0' and entre_125_135='1' then y <=T18;
							elsif mayor_135 = '1' then y <=T17;end if;
			when T17 => if menor_tres='1' then y <= T17; else y <= Tn4; end if; 
			when T18 => if menor_tres='1' then y <= T18; else y <= Tn4; end if; 
			when T19 => if menor_tres='1' then y <= T19; else y <= Tn4; end if; 
			when T20 => if menor_tres='1' then y <= T20; else y <= Tn4; end if;
			when Tn4 => if fin_ram='0' then y <= T21; else y <= Tn5; end if;
			when Tn5 => y <= T13;
			when T21 => y <= T15;
			
 		end case;
	end if;
	end process;
	
	MSS_salidas: process (y)
	begin
	led_fin<='0';D_aguda_severa<='0';d_aguda_moderada<='0';Riesgo_desnutr<='0';No_desnutr<='0';
	en_cnt<='0';rst_cnt<='0';en_i_cnt<='0';rst_i_cnt<='0';en_read<='0';en_write<='0';en_reg_i<='0';
	en_reg_j<='0';rst_reg_j<='0';sel_j<='0';en_clasf<='0';rst_clasf<='0';rst_reg_i<='0';
	en_disp<='0';sel_cnt<='0';en_cnthz<='0';rst_cnthz<='0';sel_dato<='0';en_cnt_cambio<='0';rst_cnt_cambio<='0';	
		case y is
			when T1 =>
			when s0 =>
			when T2 =>
			when s1 =>
			when T3 => rst_cnt<='1';rst_i_cnt<='1';
			when T5 => en_cnt<='1';
			when T6 => en_read<='1';--
			when T7 => en_read<='1';en_reg_i<='1';
			when Tn1 => en_read<='1';sel_j<='1';
			when Tn2 => rst_i_cnt<='1';rst_cnt_cambio<='1';
			when T8 => sel_j<='1';en_read<='1';en_reg_j<='1';
			when T9 => en_write<='1';sel_j<='1';en_cnt_cambio<='1';
			when T10 => en_write<='1';sel_dato<='1';--en_orden<='1';sel_orden<='1';
			when T11 => en_i_cnt<='1';rst_reg_i<='1';rst_reg_j<='1';--en_orden<='1';
			--when Ti  => en_i_cnt<='1';
			when T12 => rst_cnt<='1';rst_reg_j<='1';rst_reg_i<='1';rst_cnt_cambio<='1';
			when T13 => led_fin<='1';en_cnthz<='1';
			when Tn4 => 
			when Tn5 => rst_clasf<='1';en_disp<='1';
			when T14 =>
			when s2 =>
			when T15 => rst_cnthz<='1';
			when Tn3 => sel_cnt<='1';en_read<='1';
			when T16 => en_clasf<='1';
			when T17 => No_desnutr<='1';en_disp<='1';en_cnthz<='1';
			when T18 => Riesgo_desnutr<='1';en_disp<='1';en_cnthz<='1';
			when T19 => d_aguda_moderada<='1';en_disp<='1';en_cnthz<='1';
			when T20 => D_aguda_severa<='1';en_disp<='1';en_cnthz<='1';
			when T21 => en_cnt<='1';
		end case;
	end process;
end solve;