library IEEE;
use IEEE.STD_LOGIC_1164.all;


package constants is
type ALU_SEL_TYPE is (ALU_FOUT, ALU_W, ALU_K, ALU_CNST);

type ALUOP_TYPE is (ALUOP_ADD, ALUOP_SUB, ALUOP_AND, ALUOP_OR, ALUOP_XOR, ALUOP_COM, ALUOP_ROR,
                    ALUOP_ROL, ALUOP_SWAP, ALUOP_BITCLR, ALUOP_BITSET, ALUOP_BITTESTCLR, ALUOP_BITTESTSET, ALUOP_NOP);

constant RESET_VECTOR  : std_logic_vector(10 downto 0) := "11111111111";
constant  TRIS_DEFAULT  : std_logic_vector (7 downto 0) := "11111111";

constant  ONE 			: std_logic_vector (7 downto 0) := "00000001";

constant  ZEROBYTE : std_logic_vector (7 downto 0) := "00000000";
constant NOP     : std_logic_vector (11 downto 0) := "000000000000";
constant MOVWF   : std_logic_vector (6 downto 0)  := "0000001";
constant CLRW    : std_logic_vector (6 downto 0)  := "0000010";
constant CLRF    : std_logic_vector (6 downto 0)  := "0000011";
constant SUBWF   : std_logic_vector (5 downto 0)  := "000010";
constant DECF    : std_logic_vector (5 downto 0)  := "000011";
constant IORWF   : std_logic_vector (5 downto 0)  := "000100";

constant ANDWF   : std_logic_vector (5 downto 0) := "000101";
constant XORWF   : std_logic_vector (5 downto 0) := "000110";
constant ADDWF   : std_logic_vector (5 downto 0) := "000111";
constant MOVF    : std_logic_vector (5 downto 0) := "001000";
constant COMF    : std_logic_vector (5 downto 0) := "001001";
constant INCF    : std_logic_vector (5 downto 0) := "001010";
constant DECFSZ  : std_logic_vector (5 downto 0) := "001011";
constant RRF     : std_logic_vector (5 downto 0) := "001100";
constant RLF     : std_logic_vector (5 downto 0) := "001101";
constant SWAPF   : std_logic_vector (5 downto 0) := "001110";
constant INCFSZ  : std_logic_vector (5 downto 0) := "001111";

-- Bit-Oriented File Register Operations
constant BCF    : std_logic_vector (3 downto 0) := "0100";
constant BSF    : std_logic_vector (3 downto 0) := "0101";
constant BTFSC  : std_logic_vector (3 downto 0) := "0110";
constant BTFSS  : std_logic_vector (3 downto 0) := "0111";

-- Literal and Control Operations
constant OPTION : std_logic_vector (11 downto 0) := "000000000010";
constant SLEEP  : std_logic_vector (11 downto 0) := "000000000011";
constant CLRWDT : std_logic_vector (11 downto 0) := "000000000100";
constant TRISA   : std_logic_vector (11 downto 0) := "000000000101";
constant TRISB   : std_logic_vector (11 downto 0) := "000000000110";
constant TRISC   : std_logic_vector (11 downto 0) := "000000000111";
constant RETLW  : std_logic_vector (3 downto 0) := "1000";
constant CALL   : std_logic_vector (3 downto 0) := "1001";
constant GOTO   : std_logic_vector (2 downto 0) := "101";
constant MOVLW  : std_logic_vector (3 downto 0) := "1100";
constant IORLW  : std_logic_vector (3 downto 0) := "1101";
constant ANDLW  : std_logic_vector (3 downto 0) := "1110";
constant XORLW  : std_logic_vector (3 downto 0) := "1111";

end constants;
