library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity interleave is
	generic (
		N : natural := 4
	);
	
	port(
		-- 2s N-bit inputs
		A	 : in	 std_logic_vector((N-1) downto 0);
		B	 : in	 std_logic_vector((N-1) downto 0);		
		-- 2N bit output
		Y	 : out std_logic_vector((2*N-1) downto 0)
	);


end entity;

architecture v1 of interleave is -- archetecture block

begin -- begin archetecture
	process (A,B) is -- process with sensitivity list
		begin -- start process
			for count in N downto 1 loop -- for loop to filter though all of the output combinations
			
			Y((2*count)-1) <= A(count-1); -- setting A to a output
			Y((2*count)-2) <= B(count-1); -- setting B to a output
			
			end loop; -- end for loop
	end process; -- end process
end v1; -- end architecture
