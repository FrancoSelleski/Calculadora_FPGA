library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity botonera is
port(
	a,b: in std_logic_vector (3 downto 0);
	boton: in std_logic_vector(1 downto 0);
	seg : out std_logic_vector (7 downto 0); --salida para el 7 segmentos
	an: out std_logic_vector (3 downto 0); -- salida selector de 1 de los 3 7segmentos
	led : out std_logic 
	);
end botonera;

architecture Behavioral of botonera is
	signal sum,rest : std_logic_vector(4 downto 0); --temporales para guardar los resultados de las sumas y restas
	signal mult : std_logic_vector (4 downto 0); --temporal para guardar el resultado de la multiplicacion
	signal res : std_logic_vector(4 downto 0);
begin
	suma: entity work.sumsignmag(Behavioral)
		port map (a =>a, b=>b, s=>sum);
	resta: entity work.restasignmag(Behavioral)
		port map (a =>a, b=>b, r=>rest);
	multi: entity work.multsignmag(Behavioral) 
		port map (a =>a, b=>b, m=>mult, led =>led);
	mostrar: entity work.segmentos(Behavioral)
		port map (res => res, salida => seg);
	an <= "1110";
	process(a,b,res,boton,sum,rest,mult) --multiplexor que pasa un resultado u otro segun el boton que apretes
	begin
		
		if (boton(0) = '1') then --caso sumar
		res <= rest;
		elsif (boton(1) = '1') then  --caso restar
		res <= mult;
		else 
		res <= sum;
		end if;
	end process;
end Behavioral;

