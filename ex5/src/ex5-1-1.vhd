library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity ex511 is
	 port(
		 condition1 : in STD_LOGIC;
		 condition2 : in STD_LOGIC;
		 output : out STD_LOGIC
	     );
end ex511;

architecture ex511 of ex511 is
begin
	
	process(condition1, condition2)
	begin
		if condition1 = '1' then
			output <= '1';
		elsif condition2 = '1' then
			output <= '0';
		else
		end if;
	end process;

end ex511;