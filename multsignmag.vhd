
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity multsignmag is
	port(
	a,b: in std_logic_vector(3 downto 0);
	m: out std_logic_vector (6 downto 0);
	led : out std_logic
	);
	
end multsignmag;

architecture Behavioral of multsignmag is
signal ma,mb : unsigned(2 downto 0); --temporales para las magnitudes
begin
ma <= unsigned(a(2 downto 0));
mb <= unsigned(b(2 downto 0));
m <= '0' & (std_logic_vector(ma*mb)) when (a(3)=b(3)) else
		'1' & (std_logic_vector(ma*mb));
led <= '0' when (ma*mb < 16) else
		 '1' ;

end Behavioral;

