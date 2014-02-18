module prgm_cntr ( clk4, resetn, f_we, longk, fsel,
                   opcode_goto, opcode_call, opcode_retlw,
				   aluout, pc );

input clk4, resetn;

input f_we;

input [8:0] longk;

input [4:0] fsel;

input [7:0] aluout;

input opcode_goto, opcode_call, opcode_retlw;

output [10:0] pc;
parameter SDEPTH_ZERO  = 3'd0;
parameter SDEPTH_ONE   = 3'd1;
parameter SDEPTH_TWO   = 3'd2;
parameter SDEPTH_THREE = 3'd3;
parameter SDEPTH_FOUR  = 3'd4;
parameter SDEPTH_FIVE  = 3'd5;
parameter SDEPTH_SIX   = 3'd6;

reg [2:0] c_stacklevel, n_stacklevel;
reg [10:0] stack[0:6];
reg [10:0] stack_r[0:6];
reg [10:0] pc;

reg [10:0] stack2_r, stack2;
integer i, j;
always @(posedge clk4 or negedge resetn)
begin
  if (!resetn)
    pc <= 0;
  else begin
    if (opcode_goto)
	  pc[8:0] <= longk;
	else if (opcode_call)
	  pc[7:0] <= longk[7:0];
	else if (opcode_retlw)
	  pc <= stack2;
	else if (f_we && fsel == 5'd2)
	  pc[7:0] <= aluout;
	else
	  pc <= pc + 1;
  end
end

always @(posedge clk4 or negedge resetn)
begin
  if (!resetn) begin
    c_stacklevel <= SDEPTH_ZERO;
	stack2_r <= 0;
	 for (i = 0; i < 7; i = i+1)
	   stack_r[i] = 0;
  end
  else begin
    c_stacklevel <= n_stacklevel;
    stack2_r <= stack2;
    for (i = 0; i < 7; i = i+1)
	  stack_r[i] = stack[i];
  end
end

always @(n_stacklevel or c_stacklevel or stack_r[0] or stack2_r
         or opcode_goto or opcode_retlw or opcode_call)
begin
  n_stacklevel <= c_stacklevel;
  stack2 <= stack2_r;
  for (j = 0; j < 7; j = j+1)
    stack[j] <= stack_r[j];
  case (c_stacklevel)
  SDEPTH_ZERO : begin
    if (opcode_call) begin
	  stack[SDEPTH_ZERO] <= stack2_r + 1;
	  n_stacklevel <= SDEPTH_ONE;
	end
	else if (opcode_retlw) begin
	  stack2 <= stack_r[SDEPTH_ZERO];
	  n_stacklevel <= SDEPTH_ZERO;
	end
   end
  SDEPTH_ONE : begin
    if (opcode_call) begin
	  stack[SDEPTH_ONE] <= stack2_r + 1;
	  n_stacklevel <= SDEPTH_TWO;
	end
	else if (opcode_retlw) begin
	  stack2 <= stack_r[SDEPTH_ONE];
	  n_stacklevel <= SDEPTH_ZERO;
	end
   end
  SDEPTH_TWO : begin
    if (opcode_call) begin
	  stack[SDEPTH_TWO] <= stack2_r + 1;
	  n_stacklevel <= SDEPTH_THREE;
	end
	else if (opcode_retlw) begin
	  stack2 <= stack_r[SDEPTH_TWO];
	  n_stacklevel <= SDEPTH_ONE;
	end
   end
  SDEPTH_THREE : begin
    if (opcode_call) begin
	  stack[SDEPTH_THREE] <= stack2_r + 1;
	  n_stacklevel <= SDEPTH_FOUR;
	end
	else if (opcode_retlw) begin
	  stack2 <= stack_r[SDEPTH_THREE];
	  n_stacklevel <= SDEPTH_TWO;
	end
   end
  SDEPTH_FOUR : begin
    if (opcode_call) begin
	  stack[SDEPTH_FOUR] <= stack2_r + 1;
	  n_stacklevel <= SDEPTH_FIVE;
	end
	else if (opcode_retlw) begin
	  stack2 <= stack_r[SDEPTH_FOUR];
	  n_stacklevel <= SDEPTH_THREE;
	end
   end  SDEPTH_FIVE : begin
    if (opcode_call) begin
	  stack[SDEPTH_FIVE] <= stack2_r + 1;
	  n_stacklevel <= SDEPTH_SIX;
	end
	else if (opcode_retlw) begin
	  stack2 <= stack_r[SDEPTH_FIVE];
	  n_stacklevel <= SDEPTH_FOUR;
	end
   end
  SDEPTH_SIX : begin
    if (opcode_call) begin
	  stack[SDEPTH_SIX] <= stack2_r + 1;
	  n_stacklevel <= SDEPTH_SIX;
	end
	else if (opcode_retlw) begin
	  stack2 <= stack_r[SDEPTH_SIX];
	  n_stacklevel <= SDEPTH_FIVE;
	end
   end
   default: n_stacklevel <= SDEPTH_ZERO;
  endcase
end

endmodule
