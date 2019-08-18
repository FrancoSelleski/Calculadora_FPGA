
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY testsumasignmag IS
END testsumasignmag;
 
ARCHITECTURE behavior OF testsumasignmag IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sumsignmag
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         s : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic_vector(4 downto 0);
	


BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sumsignmag PORT MAP (
          a => a,
          b => b,
          s => s
        );


   -- Stimulus process
   stim_proc: process
		variable a_ent, b_ent : integer;
   begin		

	for a_ent in 0 to 7 loop
	
		for b_ent in 0 to 7 loop
			
			a <= std_logic_vector(to_unsigned(a_ent, 4));
			b <= std_logic_vector(to_unsigned(b_ent, 4));
			
			wait for 10 ns;
			
			assert to_integer(unsigned(s)) = a_ent + b_ent report "fallo mismo signo pos" severity failure;
		
		end loop;
	
	end loop;
	
	for a_ent in 0 to 7 loop
		
		for b_ent in 0 to 7 loop
			a <=  '1' & std_logic_vector(to_unsigned(a_ent, 3));
			b <= '1' & std_logic_vector(to_unsigned(b_ent, 3));
			
			wait for 10 ns;
			
			--assert to_integer(unsigned(s(2 downto 0))) = a_ent + b_ent report "fallo magnitud 2 neg" severity failure; 
			
			--assert s(3)='1' report "fallo signo 2 neg" severity failure;
			
		end loop;
	end loop;
	
	for a_ent in 0 to 7 loop
		
		for b_ent in 0 to 7 loop
			a <= std_logic_vector(to_unsigned(a_ent, 4));
			b <= '1' & std_logic_vector(to_unsigned(b_ent, 3));
			

			wait for 10 ns;
			if a_ent > b_ent then
				assert to_integer(unsigned(s(3 downto 0))) = a_ent - b_ent report "fallo magnitud 2 neg" severity failure; 
				assert s(4)='0' report "fallo signo 2 neg a > b" severity failure;
			else 
				assert to_integer(- signed(s(3 downto 0))) = a_ent - b_ent report "fallo magnitud 2 neg a < b" severity failure;
				assert s(4)='1' report "fallo signo 2 neg a < b" severity failure;
			end if;
			
			
		end loop;
	end loop;
	
	
	assert false report "joya" severity failure;
      wait;
   end process;

END;
