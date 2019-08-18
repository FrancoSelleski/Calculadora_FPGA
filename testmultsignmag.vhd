LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY testmultsignmag IS
END testmultsignmag;
 
ARCHITECTURE behavior OF testmultsignmag IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT multsignmag
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         m : OUT  std_logic_vector(6 downto 0);
			led: OUT std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal m : std_logic_vector(6 downto 0);
	signal led: std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: multsignmag PORT MAP (
          a => a,
          b => b,
          m => m,
			 led => led
        );
 

   -- Stimulus process
   stim_proc: process
		variable a_ent, b_ent : integer;
	begin		

	for a_ent in 0 to 7 loop
	
		for b_ent in 0 to 7 loop
			
			a <= std_logic_vector(to_unsigned(a_ent, 4));
			b <= std_logic_vector(to_unsigned(b_ent, 4)); --caso a y b >0
			
			wait for 10 ns;
			
			assert to_integer(unsigned(m(5 downto 0))) = (a_ent*b_ent) report "fallo mag a,b>0" severity failure;
			assert m(6) = '0' report "fallo signo a,b>0" severity failure;
			if (a_ent*b_ent < 16 and a_ent*b_ent > -16) then 
				assert led ='0' report "fallo led deberia estar apagado" severity failure;
			else
				assert led ='1' report "fallo led deberia estar prendido" severity failure;
			end if;
			
		end loop;
	
	end loop;

--	for a_ent in 0 to 7 loop
--	
--		for b_ent in 0 to 7 loop
--			
--			a <= std_logic_vector(to_unsigned(a_ent, 4));
--			b <= '1' & std_logic_vector(to_unsigned(b_ent, 3)); --caso a >0 y b <0
--			
--			wait for 10 ns;
--			
--			assert to_integer(unsigned(m(5 downto 0))) = (a_ent*b_ent) report "fallo mag a,b>0" severity failure;
--			assert m(6) = '1' report "fallo signo a>0,b<0" severity failure;
--			if (a_ent*b_ent < 16 and a_ent*b_ent >= -16) then 
--				assert led ='0' report "fallo led deberia estar apagado" severity failure;
--			else
--				assert led ='1' report "fallo led deberia estar prendido" severity failure;
--			end if;
--		
--		end loop;
--	
--	end loop;

--	for a_ent in 0 to 7 loop
--	
--		for b_ent in 0 to 7 loop
--			
--			a <= '1' & std_logic_vector(to_unsigned(a_ent, 3));
--			b <= std_logic_vector(to_unsigned(b_ent, 4)); --caso a<0 y b >0
--			
--			wait for 10 ns;
--			
--			assert to_integer(unsigned(m(5 downto 0))) = (a_ent*b_ent) report "fallo mag a<0,b>0" severity failure;
--			assert m(6) = '1' report "fallo signo a<0,b>0" severity failure;
--			if (a_ent*b_ent <= 15 and a_ent*b_ent >= -15) then 
--				assert led ='0' report "fallo led deberia estar apagado" severity failure;
--			else
--				assert led ='1' report "fallo led deberia estar prendido" severity failure;
--			end if;
--		
--		end loop;
--	
--	end loop;

	assert false report "Anduvo todo bien" severity failure;
      wait;
   end process;

END;
