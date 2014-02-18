
--
-- VHDL
--
-- Entity:	ROM
library ieee;
use ieee.std_logic_1164.all;
--library synth;
--use synth.pack1164.ALL;
use ieee.numeric_std.all;


entity INS_ROM is
  port (
	 Addr    : in   std_logic_vector(10 downto 0);
	 Data    : out  std_logic_vector(11 downto 0));
end INS_ROM;


architecture first of INS_ROM is
begin
	Data <= 
			  "101000000001" When to_integer(unsigned(Addr)) = 00000 Else
			  "000001100011" When to_integer(unsigned(Addr)) = 00001 Else
			  "000001100101" When to_integer(unsigned(Addr)) = 00002 Else
			  "000001100110" When to_integer(unsigned(Addr)) = 00003 Else
			  "110011111000" When to_integer(unsigned(Addr)) = 00004 Else
			  "000000000101" When to_integer(unsigned(Addr)) = 00005 Else
			  "110000000000" When to_integer(unsigned(Addr)) = 00006 Else
			  "000000000110" When to_integer(unsigned(Addr)) = 00007 Else
			  "000001100101" When to_integer(unsigned(Addr)) = 00008 Else
			  "100101001110" When to_integer(unsigned(Addr)) = 00009 Else
			  "110000111000" When to_integer(unsigned(Addr)) = 00010 Else
			  "100101000000" When to_integer(unsigned(Addr)) = 00011 Else
			  "110000000000" When to_integer(unsigned(Addr)) = 00012 Else
			  "111000000111" When to_integer(unsigned(Addr)) = 00013 Else
			  "110100001000" When to_integer(unsigned(Addr)) = 00014 Else
			  "100101000000" When to_integer(unsigned(Addr)) = 00015 Else
			  "110000000001" When to_integer(unsigned(Addr)) = 00016 Else
			  "100101000000" When to_integer(unsigned(Addr)) = 00017 Else
			  "110000000100" When to_integer(unsigned(Addr)) = 00018 Else
			  "111000000111" When to_integer(unsigned(Addr)) = 00019 Else
			  "110100001000" When to_integer(unsigned(Addr)) = 00020 Else
			  "100101000000" When to_integer(unsigned(Addr)) = 00021 Else
			  "110000000010" When to_integer(unsigned(Addr)) = 00022 Else
			  "111000000011" When to_integer(unsigned(Addr)) = 00023 Else
			  "110100000100" When to_integer(unsigned(Addr)) = 00024 Else
			  "100101000000" When to_integer(unsigned(Addr)) = 00025 Else
			  "110000110000" When to_integer(unsigned(Addr)) = 00026 Else
			  "000000110010" When to_integer(unsigned(Addr)) = 00027 Else
			  "110000000000" When to_integer(unsigned(Addr)) = 00028 Else
			  "110110000000" When to_integer(unsigned(Addr)) = 00029 Else
			  "100101000000" When to_integer(unsigned(Addr)) = 00030 Else
			  "110000000000" When to_integer(unsigned(Addr)) = 00031 Else
			  "000000110001" When to_integer(unsigned(Addr)) = 00032 Else
			  "100101010100" When to_integer(unsigned(Addr)) = 00033 Else
			  "111011111111" When to_integer(unsigned(Addr)) = 00034 Else
			  "011001000011" When to_integer(unsigned(Addr)) = 00035 Else
			  "101000101000" When to_integer(unsigned(Addr)) = 00036 Else
			  "100100110111" When to_integer(unsigned(Addr)) = 00037 Else
			  "001010010001" When to_integer(unsigned(Addr)) = 00038 Else
			  "101000100000" When to_integer(unsigned(Addr)) = 00039 Else
			  "101000101000" When to_integer(unsigned(Addr)) = 00040 Else
			  "110011111111" When to_integer(unsigned(Addr)) = 00041 Else
			  "000000000110" When to_integer(unsigned(Addr)) = 00042 Else
			  "010000000101" When to_integer(unsigned(Addr)) = 00043 Else
			  "010100100101" When to_integer(unsigned(Addr)) = 00044 Else
			  "010101000101" When to_integer(unsigned(Addr)) = 00045 Else
			  "001000000110" When to_integer(unsigned(Addr)) = 00046 Else
			  "010001000101" When to_integer(unsigned(Addr)) = 00047 Else
			  "111010000000" When to_integer(unsigned(Addr)) = 00048 Else
			  "011101000011" When to_integer(unsigned(Addr)) = 00049 Else
			  "101000101001" When to_integer(unsigned(Addr)) = 00050 Else
			  "010000100101" When to_integer(unsigned(Addr)) = 00051 Else
			  "110000000000" When to_integer(unsigned(Addr)) = 00052 Else
			  "000000000110" When to_integer(unsigned(Addr)) = 00053 Else
			  "100000000000" When to_integer(unsigned(Addr)) = 00054 Else
			  "000000110000" When to_integer(unsigned(Addr)) = 00055 Else
			  "100100101001" When to_integer(unsigned(Addr)) = 00056 Else
			  "010000100101" When to_integer(unsigned(Addr)) = 00057 Else
			  "010100000101" When to_integer(unsigned(Addr)) = 00058 Else
			  "010101000101" When to_integer(unsigned(Addr)) = 00059 Else
			  "001000010000" When to_integer(unsigned(Addr)) = 00060 Else
			  "000000100110" When to_integer(unsigned(Addr)) = 00061 Else
			  "010001000101" When to_integer(unsigned(Addr)) = 00062 Else
			  "100000000000" When to_integer(unsigned(Addr)) = 00063 Else
			  "000000110000" When to_integer(unsigned(Addr)) = 00064 Else
			  "100100101001" When to_integer(unsigned(Addr)) = 00065 Else
			  "010000100101" When to_integer(unsigned(Addr)) = 00066 Else
			  "010000000101" When to_integer(unsigned(Addr)) = 00067 Else
			  "010101000101" When to_integer(unsigned(Addr)) = 00068 Else
			  "001000010000" When to_integer(unsigned(Addr)) = 00069 Else
			  "000000100110" When to_integer(unsigned(Addr)) = 00070 Else
			  "010001000101" When to_integer(unsigned(Addr)) = 00071 Else
			  "100000000000" When to_integer(unsigned(Addr)) = 00072 Else
			  "110000000001" When to_integer(unsigned(Addr)) = 00073 Else
			  "000000110011" When to_integer(unsigned(Addr)) = 00074 Else
			  "001011110011" When to_integer(unsigned(Addr)) = 00075 Else
			  "101001001011" When to_integer(unsigned(Addr)) = 00076 Else
			  "100000000000" When to_integer(unsigned(Addr)) = 00077 Else
			  "110000000001" When to_integer(unsigned(Addr)) = 00078 Else
			  "000000110100" When to_integer(unsigned(Addr)) = 00079 Else
			  "100101001001" When to_integer(unsigned(Addr)) = 00080 Else
			  "001011110100" When to_integer(unsigned(Addr)) = 00081 Else
			  "101001010000" When to_integer(unsigned(Addr)) = 00082 Else
			  "100000000000" When to_integer(unsigned(Addr)) = 00083 Else
			  "000111100010" When to_integer(unsigned(Addr)) = 00084 Else
			  "100001001000" When to_integer(unsigned(Addr)) = 00085 Else
			  "100001100101" When to_integer(unsigned(Addr)) = 00086 Else
			  "100001101100" When to_integer(unsigned(Addr)) = 00087 Else
			  "100001101100" When to_integer(unsigned(Addr)) = 00088 Else
			  "100001101111" When to_integer(unsigned(Addr)) = 00089 Else
			  "100000100000" When to_integer(unsigned(Addr)) = 00090 Else
			  "100000000000" When to_integer(unsigned(Addr)) = 00091 Else
			  "000000000000";
end first;

