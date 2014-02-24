library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity design2 is
	 port(
		 clk : in STD_LOGIC;
		 reset : in STD_LOGIC;
		 a : in STD_LOGIC;
		 b : in STD_LOGIC;
		 y : out STD_LOGIC
	     );
end design2;

architecture design2 of design2 is
begin
process (clk, reset) is
variable t : std_ulogic;
begin
if (reset = '1') then
t := '0';
y <= '0';
elsif (rising_edge(clk)) then
t := a xor b;
y <= t;
end if;
end process;
end architecture;