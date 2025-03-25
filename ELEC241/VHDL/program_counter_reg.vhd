library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity program_counter_reg is

	generic (
		DATA_WIDTH : natural := 8
	);

	port (
		D	 	: in  std_logic_vector ((DATA_WIDTH-1) downto 0);	--Input data
		LD  	: in  std_logic;												--Load
		INC   : in  std_logic;												--Count up by 1 when set high
		CLK 	: in  std_logic;												--Clock
		RESET : in  std_logic;
		Y	 	: out std_logic_vector((DATA_WIDTH-1) downto 0)	--Output (supports tri-state)
	);

end entity;

architecture v1 of program_counter_reg is -- architecture block

-- setting signals are variables
signal Y_in : signed((DATA_WIDTH-1) downto 0); -- signed varaible so I can use arithemtic operators as you cannot with std_logic

begin -- begin architecture
	process(D,LD,INC,CLK,RESET) is -- process block with sensitivity list
	begin -- begin process
		if RESET = '0' then -- if reset is 0
			Y <= (others => '0'); -- set all bits to 0 (full asyncronous reset) if reset is '1'
								  
			elsif rising_edge(CLK) then -- on the raising edge of the clock
				if LD = '1' then -- if load is high
				
					Y <= D; -- set Y to D
				
					elsif INC = '1' then -- if INC is 1 (elsif so LD overides INC)
					
						Y_in <= (signed(Y((DATA_WIDTH-1) downto 0)) + 1); -- sets variable Y_in to Y plus 1 
						Y <= std_logic_vector(Y_in((DATA_WIDTH-1) downto 0)); -- then sets varable Y_in to Y
					
				end if; -- end if
		end if; -- end if
	end process; -- end process
end v1; -- end architecture
