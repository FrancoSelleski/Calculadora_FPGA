
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity restasignmag is
port(
	a,b: in std_logic_vector(3 downto 0);
	r: out std_logic_vector (4 downto 0)
	);
end restasignmag;

architecture Behavioral of restasignmag is
signal menosb: std_logic_vector(3 downto 0); 
begin

menosb(2 downto 0) <= b(2 downto 0);  --creo que al hacer esto y despues hacer el port map se rompe
menosb(3) <= not b(3); --voy a hacer a-b, por lo que hago a + (-b)

resta: entity work.sumsignmag(Behavioral)
port map (a=>a, b=>menosb, s=>r);

end Behavioral;

