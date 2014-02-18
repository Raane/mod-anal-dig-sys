library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity assignment1 is
    Port ( A : in  STD_LOGIC;
           B : in  STD_LOGIC;
           Q : inout  STD_LOGIC;
           QN : inout  STD_LOGIC);
end assignment1;

architecture Behavioral of assignment1 is

begin

    process(A,B,Q,QN)
    begin
        Q <= A nor QN; 
        QN <= B nor Q; 
    end process;
end Behavioral;

