library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity generic_adder is

	generic (
		DATA_WIDTH : natural := 4
	);

	port (
		A	 : in  std_logic_vector ((DATA_WIDTH-1) downto 0);
		B	 : in  std_logic_vector	((DATA_WIDTH-1) downto 0);
		SUM : out std_logic_vector ((DATA_WIDTH-1) downto 0);
		OVERF : out std_logic;
		CARRY : out std_logic
	);

end entity;

architecture v1 of generic_adder is -- architecture

-- setting signal and variables
	signal un_SUM  	 : unsigned ((DATA_WIDTH) downto 0); -- producing a temperary signal to store the unsigned SUM
	signal sign_SUM  	 : signed	((DATA_WIDTH) downto 0); -- producing a temperary signal to store the signed SUM
	
begin -- begin architecture
	process (A,B) is -- process block with sensitivity list
			begin	-- begin process

				un_SUM <= ('0' & unsigned(A) + unsigned(B)); -- producing the signed SUM and with 0 to make a 5 bit output with carry
				
				SUM <= std_logic_vector(un_SUM((DATA_WIDTH-1) downto 0)); -- puts the bottom 4 bits as the SUM output
				
				CARRY <= std_logic(un_SUM(DATA_WIDTH)); -- carry using the unsigned sum
				
				if (A(DATA_WIDTH-1) = '0' and B(DATA_WIDTH-1) = '0') or (A(DATA_WIDTH-1) = '1' and B(DATA_WIDTH-1) = '1') then
					OVERF <= '1'; -- if MSB of A and B are both high or low then OVERF is high
				end if;
				
	end process; -- end process
end v1; -- end architecture
