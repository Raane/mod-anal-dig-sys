LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY tb_assignment1 IS
END tb_assignment1;

ARCHITECTURE behavior OF tb_assignment1 IS 
	
	-- Component Declaration for the Unit Under Test (UUT)
	
	COMPONENT assignment1
		PORT(
			A : IN  std_logic;
			B : IN  std_logic;
			Q : INOUT  std_logic;
			QN : INOUT  std_logic
			);
	END COMPONENT;
	
	--Inputs
	signal A : std_logic := '0';
	signal B : std_logic := '0';
	
	--BiDirs
	signal Q : std_logic;
	signal QN : std_logic;
	
BEGIN
	
	-- Instantiate the Unit Under Test (UUT)
	uut: assignment1 PORT MAP (
		A => A,
		B => B,
		Q => Q,
		QN => QN
		);
	
	
	-- Stimulus process
	STIMULUS: process
	begin		
		-- hold reset state for 100 ns.
		wait for 100 ns;	
		
		A <= '1' ; B <= '0' ; 
		wait for 10 ns ; 
		A <= '0' ; 
		wait for 10 ns ; 
		B <= '1' ; 
		wait for 10 ns ; 
		B <= '0' ; 
		wait for 10 ns ; 
		B <= '1' ; A <= '1' ;
		
		-- insert stimulus here 
		
		wait;
	end process;
	
END;
