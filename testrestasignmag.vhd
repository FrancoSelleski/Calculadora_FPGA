
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
 
ENTITY testrestasignmag IS
END testrestasignmag;
 
ARCHITECTURE behavior OF testrestasignmag IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT restasignmag
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         r : OUT  std_logic_vector(4 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal r : std_logic_vector(4 downto 0);

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: restasignmag PORT MAP (
          a => a,
          b => b,
          r => r
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
			if a_ent > b_ent then
				assert to_integer(unsigned(r(3 downto 0))) = a_ent - b_ent report "fallo magnitud resta a>b"  severity failure; 
				assert r(4)='0' report "fallo signo resta a > b" severity failure;
			else 
				assert to_integer(- signed(r(3 downto 0))) = a_ent - b_ent report "fallo magnitud resta a < b" severity failure;
				assert r(4)='1' report "fallo signo resta a < b" severity failure;
			end if;
		
		end loop;
	end loop;
	
--		for a_ent in 0 to 7 loop
--		
--		for b_ent in 0 to 7 loop
--			a <= std_logic_vector(to_unsigned(a_ent, 4));
--			b <= '1' & std_logic_vector(to_unsigned(b_ent, 3));  -- a -(-b) = a+b
--			
--
--			wait for 10 ns;
--				assert to_integer(unsigned(r(3 downto 0))) = a_ent + b_ent report "fallo magnitud b neg" severity failure; 
--				assert r(4)='0' report "fallo signo b neg" severity failure;
--			
--		end loop;
--	end loop;

--	for a_ent in 0 to 7 loop
--		
--		for b_ent in 0 to 7 loop
--			a <=  '1' & std_logic_vector(to_unsigned(a_ent, 3));
--			b <= '1' & std_logic_vector(to_unsigned(b_ent, 3)); --caso -a-(-b)=b-a
--			
--			wait for 10 ns;
--			if a_ent > b_ent then
--				assert to_integer(- signed(r(3 downto 0))) = -a_ent + b_ent report "fallo magnitud resta b-a a>b"  severity failure; 
--				assert r(4)='1' report "fallo signo resta a > b" severity failure;
--			else 
--				assert to_integer(unsigned(r(3 downto 0))) = -a_ent + b_ent report "fallo magnitud resta b-a a < b" severity failure;
--				assert r(4)='0' report "fallo signo resta b-a a < b" severity failure;
--			end if;
--		
--			
--		end loop;
--	end loop;
--	
	
	assert false report "BOKEEEE" severity failure;
      wait;
   end process;

END;
