module alu ( clk3, resetn, status, aluop, alua, alub, alu_cout, aluz, aluout) ;

input clk3, resetn;
input[7:0] status;
input [3:0] aluop;
input [7:0] alua, alub;

output alu_cout, aluz;
output [7:0] aluout;

wire reset = ~resetn;
wire alu_cout_int, aluz_int;
wire [7:0] mult_result;
wire [7:0] mult_result_c, alu_b;

// register definition for outputs
reg [7:0] aluout_int;
reg alu_cout;
reg aluz;
reg [7:0] aluout;
reg [7:0]  adder_result;
reg adder_cout;


parameter [3:0] ALUOP_ADD        = 4'b0000;
parameter [3:0] ALUOP_SUB        = 4'b1000;
parameter [3:0] ALUOP_AND        = 4'b0001;
parameter [3:0] ALUOP_MULT	     = 4'b0111;
parameter [3:0] ALUOP_OR         = 4'b0010;
parameter [3:0] ALUOP_XOR        = 4'b0011;
parameter [3:0] ALUOP_COM        = 4'b0100;
parameter [3:0] ALUOP_ROR        = 4'b0101;
parameter [3:0] ALUOP_ROL        = 4'b0110;



assign mult_result[7:1] = mult_result_c[7:1];
assign mult_result[0] = mult_result_c[0] ^ aluop[3] ^ status[7];
assign alu_b[7:1] = alub[7:1];
assign alu_b[0] = alub[0] ^ status[7] ^ status [6] ^ status[5] ^ status[4] ^ status[3] ^ status[2] ^ status[1];

mult U1(.a(alua), .b(alu_b), .c(mult_result_c));


// Wires to the ADDER
wire       adder_cin;
wire [7:0] adder_b;

// Wires that are the results of individual
// ALU operations.  All results feed into our
// big mux, which we will specifically build.
//
wire [7:0] and_result;
wire [7:0] or_result;
wire [7:0] xor_result;
wire [7:0] not_result;
wire [7:0] ror_result;
wire [7:0] rol_result;
wire [7:0] swap_result;

assign and_result = alua & alub;
assign or_result  = alua | alub;
assign xor_result = alua ^ alub;
assign not_result = ~alua;
assign ror_result  = {status[0], alua[7:1]};
assign rol_result  = {alua[6:0], status[0]};
assign swap_result = {alua[3:0], alua[7:4]};

assign aluz_int = ~| aluout_int;

assign alu_cout_int =
	 adder_cout & (aluop == ALUOP_ADD) |
	~adder_cout & (aluop == ALUOP_SUB) |
	 alua[0]       & (aluop == ALUOP_ROL);

assign adder_cin = (aluop[3]);  // e.g. ALUOP_SUB

assign adder_b = (aluop[3]) ? ~alub : alub;


// 8-bit adder
always @ ( alua or adder_b or adder_cin)
  begin

{adder_cout, adder_result} = alua[4:0] + adder_b[4:0] + adder_cin;

  end

always @(aluop[2:0] or adder_result or and_result or mult_result or
         or_result or xor_result or not_result or
		 ror_result or swap_result or aluout_int)
  begin
	case (aluop[2:0])// synthesis full_case
		3'd0:  aluout_int <= adder_result;
		3'd1:  aluout_int <= and_result;
		3'd2:  aluout_int <= or_result;
		3'd3:  aluout_int <= xor_result;
		3'd4:  aluout_int <= not_result;
		3'd5:  aluout_int <= ror_result;
		3'd6:  aluout_int <= swap_result;
		3'd7:  aluout_int <= mult_result;

	endcase
  end


always @(posedge clk3 or posedge reset)
  begin
     if (reset)
	    begin
		    aluout = 8'b00000000;
			aluz = 1'b0;
			alu_cout = 1'b0;
		end
	 else
	    begin
		    aluout = aluout_int;
			aluz = aluz_int;
			alu_cout = alu_cout_int;
		end
   end

endmodule


