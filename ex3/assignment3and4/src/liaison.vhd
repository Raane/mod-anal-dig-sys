----------------------------------------------------------------------------------
-- Company:
-- Engineer:
-- 
-- Create Date: 23:02:40 02/16/2014
-- Design Name:
-- Module Name: liaison - Behavioral
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Sources:
-- http://www.edaboard.com/thread231379.html
-- http://vhdlguru.blogspot.no/2010/04/how-to-implement-state-machines-in-vhdl.html
-- https://groups.google.com/forum/#!topic/comp.lang.vhdl/Uv5CzwMz9MI
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity liaison is
    Port ( clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           c : in STD_LOGIC;
           d : in STD_LOGIC;
		   y : out STD_LOGIC;
           status : out STD_LOGIC_VECTOR(2 downto 0)
           
       );
    
end liaison;

architecture Behavioral of liaison is
    
    signal state_a: STD_LOGIC := '1';
    signal state_b: STD_LOGIC := '1';
    signal state_c: STD_LOGIC := '1';
    signal state_d: STD_LOGIC := '1';
    signal status_internal: STD_LOGIC_VECTOR(2 downto 0);
	signal last_status: STD_LOGIC_VECTOR(2 downto 0) := "000";
    signal voted_data: STD_LOGIC;
    signal sum_of_inputs: STD_LOGIC_VECTOR(2 downto 0);
	signal number_of_winning_votes: STD_LOGIC_VECTOR(2 downto 0);
    
begin
    
-- Update outputs when the clock tick occur
process (clk)
begin
    if (rising_edge(clk)) then
        if(reset='1') then
            state_a <= '1'; --default state on reset.
            state_b <= '1'; --default state on reset.
            state_c <= '1'; --default state on reset.
            state_d <= '1'; --default state on reset.
			last_status <= "000";
        else
            status <= status_internal;
			last_status <= status_internal;
            y <= voted_data;
            state_a <= state_a and (voted_data xnor a);
            state_b <= state_b and (voted_data xnor b);
            state_c <= state_c and (voted_data xnor c);
            state_d <= state_d and (voted_data xnor d);
        end if;
    end if;
end process;

-- Calculate the sum of the inputs from all the non broken controllers
process (a, b, c, d, state_a, state_b, state_c, state_d)
begin
    sum_of_inputs <= std_logic_vector(
	unsigned(std_logic_vector("00"&(a and state_a))) + 
	unsigned(std_logic_vector("00"&(b and state_b))) + 
	unsigned(std_logic_vector("00"&(c and state_c))) + 
	unsigned(std_logic_vector("00"&(d and state_d))));
end process;

-- Set the voted data based on the status and the sum of the input data
-- This is the core of the state machine driving the system
process (sum_of_inputs)
begin
    case last_status is
        when "000" =>
            case sum_of_inputs is
                when "100" =>
                    voted_data <= '1';
                when "011" =>
                    voted_data <= '1';
                when "010" =>
                    voted_data <= '1'; -- in 2v2 votes the data doesn't matter, we are going to status 111 anyway
                when "001" =>
                    voted_data <= '0';
                when "000" =>
					voted_data <= '0';
				when others =>
            end case;
        when "001" =>
            case sum_of_inputs is
                when "011" =>
                    voted_data <= '1';
                when "010" =>
                    voted_data <= '1';
                when "001" =>
                    voted_data <= '0';
                when "000" =>
					voted_data <= '0';
				when others =>
            end case;
        when "010" =>
            case sum_of_inputs is
                when "011" =>
                    voted_data <= '1';
                when "010" =>
                    voted_data <= '1'; -- in 2v2 votes the data doesn't matter, we are going to status 111 anyway
                when "001" =>
					voted_data <= '0';
				when others =>
            end case;
		when others =>
    end case;
end process;

-- Calculate the number of votes that matched the vote outcome which came from an input with state '1' 
process(voted_data, a, b, c, d)
begin
	number_of_winning_votes <= std_logic_vector(
			unsigned( std_logic_vector("00"&(state_a and (voted_data xnor a)))) +
            unsigned( std_logic_vector("00"&(state_b and (voted_data xnor b)))) +
            unsigned( std_logic_vector("00"&(state_c and (voted_data xnor c)))) +
            unsigned( std_logic_vector("00"&(state_d and (voted_data xnor d))))
			); --Do I need to sub 1?
end process;

-- Calculate the internal status field based on the inputs matched with the voted data
process (number_of_winning_votes)
begin
	if(number_of_winning_votes = "010" and last_status = "000") then
		status_internal <= "111";
	else
    	case number_of_winning_votes is
        	when "100"=>
            	status_internal <= "000";
        	when "011"=>
            	status_internal <= "001";
        	when "010"=>
            	status_internal <= "010";
        	when "001"=>
            	status_internal <= "111";
        	when "000"=>
				status_internal <= "111";
			when others =>
		end case;			  
	end if;
end process;

end Behavioral;