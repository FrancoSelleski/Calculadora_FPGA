
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY testsegmentos IS
END testsegmentos;
 
ARCHITECTURE behavior OF testsegmentos IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT segmentos
    PORT(
         res : IN  std_logic_vector(4 downto 0);
         salida : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal res : std_logic_vector(4 downto 0) := (others => '0');

 	--Outputs
   signal salida : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: segmentos PORT MAP (
          res => res,
          salida => salida
        );

   -- Stimulus process
   stim_proc: process
   begin		
--caso 0
	res<= "00000";
	wait for 10 ns;
	assert salida = "11000000" report "fallo 0" severity failure;
	--caso 1
	res<= "00001";
	wait for 10 ns;
	assert salida = "11111001" report "fallo 1" severity failure;
	--caso -1
	res<= "10001";
	wait for 10 ns;
	assert salida = "01111001" report "fallo -1" severity failure;
	--caso 2
	res<= "00010";
	wait for 10 ns;
	assert salida = "10100100" report "fallo 2" severity failure;
	--caso -2
	res<= "10010";
	wait for 10 ns;
	assert salida = "00100100" report "fallo -2" severity failure;
	--caso 3
	res<= "00011";
	wait for 10 ns;
	assert salida = "10110000" report "fallo 3" severity failure;
	--caso -3
	res<= "10011";
	wait for 10 ns;
	assert salida = "00110000" report "fallo -3" severity failure;
	--caso 4
	res<= "00100";
	wait for 10 ns;
	assert salida = "10011001" report "fallo 4" severity failure;
	--caso 4
	res<= "10100";
	wait for 10 ns;
	assert salida = "00011001" report "fallo -4" severity failure;
	--caso 5
	res<= "00101";
	wait for 10 ns;
	assert salida = "10010010" report "fallo 5" severity failure;
	--caso -5
	res<= "10101";
	wait for 10 ns;
	assert salida = "00010010" report "fallo -5" severity failure;
	--caso 6
	res<= "00110";
	wait for 10 ns;
	assert salida = "10000010" report "fallo 6" severity failure;
	--caso -6
	res<= "10110";
	wait for 10 ns;
	assert salida = "00000010" report "fallo -6" severity failure;
	--caso 7
	res<= "00111";
	wait for 10 ns;
	assert salida = "11111000" report "fallo 7" severity failure;
	--caso -7
	res<= "10111";
	wait for 10 ns;
	assert salida = "01111000" report "fallo -7" severity failure;
	--caso 8
	res<= "01000";
	wait for 10 ns;
	assert salida = "10000000" report "fallo 8" severity failure;
	--caso -8
	res<= "11000";
	wait for 10 ns;
	assert salida = "00000000" report "fallo -8" severity failure;
	--caso 9
	res<= "01001";
	wait for 10 ns;
	assert salida = "10011000" report "fallo 9" severity failure;
	--caso -9
	res<= "11001";
	wait for 10 ns;
	assert salida = "00011000" report "fallo -9" severity failure;
	--caso 10
	res<= "01010";
	wait for 10 ns;
	assert salida = "10100000" report "fallo 10" severity failure;
	--caso -10
	res<= "11010";
	wait for 10 ns;
	assert salida = "00100000" report "fallo -10" severity failure;
	--caso 11
	res<= "01011";
	wait for 10 ns;
	assert salida = "10000011" report "fallo 11" severity failure;
	--caso -11
	res<= "11011";
	wait for 10 ns;
	assert salida = "00000011" report "fallo -11" severity failure;
	--caso 12
	res<= "01100";
	wait for 10 ns;
	assert salida = "10100111" report "fallo 12" severity failure;
	--caso -12
	res<= "11100";
	wait for 10 ns;
	assert salida = "00100111" report "fallo -12" severity failure;
	--caso 13
	res<= "01101";
	wait for 10 ns;
	assert salida = "10100001" report "fallo 13" severity failure;
	--caso -13
	res<= "11101";
	wait for 10 ns;
	assert salida = "00100001" report "fallo -13" severity failure;
	--caso 14
	res<= "01110";
	wait for 10 ns;
	assert salida = "10000100" report "fallo 14" severity failure;
	--caso -14
	res<= "11110";
	wait for 10 ns;
	assert salida = "00000100" report "fallo -14" severity failure;
	--caso 15
	res<= "01111";
	wait for 10 ns;
	assert salida = "10001110" report "fallo 15" severity failure;
	--caso -15
	res<= "11111";
	wait for 10 ns;
	assert salida = "00001110" report "fallo -15" severity failure;
	
	assert false report "anduvo todo" severity failure;

      wait;
   end process;

END;
