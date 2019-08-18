library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.numeric_std.all;

entity sumsignmag is
	port(
	a,b: in std_logic_vector(3 downto 0);
	s: out std_logic_vector (4 downto 0)
	);
end sumsignmag;

architecture Behavioral of sumsignmag is
signal ma, mb : unsigned(2 downto 0); --temporales para las magnitudes
signal Oa,Ob :unsigned(3 downto 0); --temporales para poner un 0 delante de los 3 bits de magnitud de los operandos
signal s0 : unsigned(3 downto 0); --temporal de suma de los operandos sin su signo

begin
process(a,b,Oa,Ob,ma,mb,s0)
begin
ma <= unsigned(a(2 downto 0)); --magnitud de a
mb <= unsigned(b(2 downto 0)); --magnitud de b
Oa <= unsigned('0'& a(2 downto 0)); 
Ob <= unsigned('0'& b(2 downto 0));
if(a(3)= b(3)) then --si tienen el mismo signo
	s0 <= Oa + Ob;      --suma de los operandos(es unsigned vector)
	s  <= a(3) & std_logic_vector(s0); --concateno el signo con la suma de las magnitudes (es std_logic_vector)
else 
	if(ma >mb) then -- pone el signo del mayor
		s0 <= Oa - Ob; --resta al mayor la magnitud del menor
		s  <= a(3) & std_logic_vector(s0); --concateno el signo del mayor con la resta de las magnitudes (es std_logic_vector)
	else
		s0 <= Ob - Oa; --resta al mayor la magnitud del menor
		s  <= b(3) & std_logic_vector(s0); --concateno el signo del mayor con la resta de las magnitudes (es std_logic_vector)
	end if;
end if;
end process;

end Behavioral;

