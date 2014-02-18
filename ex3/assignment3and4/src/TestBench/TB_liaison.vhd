library ieee;
use ieee.NUMERIC_STD.all;
use ieee.std_logic_1164.all;

	-- Add your library and packages declaration here ...

entity tb_liaison is
end tb_liaison;

architecture TB_ARCHITECTURE of tb_liaison is
	-- Component declaration of the tested unit
	component liaison
	port(
		clk : in STD_LOGIC := '0';
		reset : in STD_LOGIC;
		a : in STD_LOGIC;
		b : in STD_LOGIC;
		c : in STD_LOGIC;
		d : in STD_LOGIC;
		status : out STD_LOGIC_VECTOR(2 downto 0);
		y : out STD_LOGIC );
	end component;

	-- Stimulus signals - signals mapped to the input and inout ports of tested entity
	signal clk : STD_LOGIC;
	signal reset : STD_LOGIC;
	signal a : STD_LOGIC := '1';
	signal b : STD_LOGIC := '1';
	signal c : STD_LOGIC := '1';
	signal d : STD_LOGIC := '1';
	-- Observed signals - signals mapped to the output ports of tested entity
	signal status : STD_LOGIC_VECTOR(2 downto 0);
	signal y : STD_LOGIC;

	-- Add your code here ...

begin

	-- Unit Under Test port map
	UUT : liaison
		port map (
			clk => clk,
			reset => reset,
			a => a,
			b => b,
			c => c,
			d => d,
			status => status,
			y => y
		);

	-- Stimulus process
   stim_proc: process
   begin		
    	-- Reset before testing		  
		wait for 10 ns;
    	reset <= '1';	
		wait for 10 ns;
		reset <= '0';  
		wait for 10 ns;
		-- Check that setting the inputs high change the output
		a <= '1';
		b <= '1';
		c <= '1';
		d <= '1';
		wait for 10 ns;
		-- Check that setting the inputs low change the output
		a <= '0';
		b <= '0';
		c <= '0';
		d <= '0';
		wait for 10 ns;						 
		-- Check that the state machine changes state when a micro controller give wrong input
		a <= '1';
		b <= '0';
		c <= '0';
		d <= '0';
		wait for 10 ns;
		-- Check that the state machine changes state when another micro controller give wrong input
		a <= '0';
		b <= '0';
		c <= '1';
		d <= '1';
		wait for 10 ns;
		-- Check that the state machine changes state when a thrid micro controller give wrong input
		a <= '1';
		b <= '1';
		c <= '1';
		d <= '0';
		wait for 10 ns;
		-- Reset to check a special case
		reset <= '1';
		a <= '1';
		b <= '1';
		c <= '1';
		d <= '1';
		wait for 10 ns;
		reset <= '0';
		wait for 10 ns;
		-- Check that the state machine changes to the correct state even with to wrong inputs at the same time
		a <= '1';
		b <= '1';
		c <= '0';
		d <= '0';
      wait;
   end process;
   
   -- This drive the clock
   clk_process :process
   begin
        clk <= '0';
        wait for 5 ns;
        clk <= '1';
        wait for 5 ns;
   end process;

end TB_ARCHITECTURE;

configuration TESTBENCH_FOR_liaison of tb_liaison is
	for TB_ARCHITECTURE
		for UUT : liaison
			use entity work.liaison(behavioral);
		end for;
	end for;
end TESTBENCH_FOR_liaison;

