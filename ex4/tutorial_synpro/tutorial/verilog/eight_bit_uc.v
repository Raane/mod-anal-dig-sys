module eight_bit_uc ( clock, resetn, porta, portb, portc );


input clock, resetn;

inout [7:0] porta, portb, portc;

reg [7:0] alua_tmp2;
wire resetn, aluz;
wire [11:0] inst;
wire f_we, w_we, status_z_we, status_c_we, tris_we, skip;
wire [7:0] k;
wire [4:0] fsel;
wire [8:0] longk;
wire [3:0] aluop;
wire [1:0] alua_sel, alub_sel;
wire bdpol;
wire opcode_call, opcode_goto, opcode_retlw;
wire [2:0] b_mux;
wire  [7:0] fin;
wire [10:0] pc;
wire [7:0] regfile_out;
wire [7:0] fsr, rtcc;
wire [7:0] status, porta, portb, portc, w;
wire [7:0] alua, alub;
wire alu_cout;
wire [7:0] aluout;
wire [11:0] romdata;				
wire [7:0] port_int_a;
wire [7:0] port_int_b;
wire [7:0] port_int_c;
wire [7:0] trisa;
wire [7:0] trisb;
wire [7:0] trisc;
wire clk1, clk2, clk3, clk4;
wire [7:0] alua_tmp;
assign clk1 = clock;
assign clk2 = clock;
assign clk3 = clock;
assign clk4 = clock;
assign rtcc = 0;
assign b_mux = 0;
// instantiating prep4 block
prep4 p1 (alua_tmp, alua, clk3, resetn);

// instantiating decode block
ins_decode decode (clk2, resetn, aluz, inst, f_we, w_we,
                    status_z_we, status_c_we, tris_we,
					skip, k, fsel, longk, aluop, 
					alua_sel, alub_sel, bdpol, opcode_goto, opcode_call, opcode_retlw );


// instantiating program counter block
prgm_cntr prgmcntr ( clk4, resetn, f_we, longk, fsel,
                     opcode_goto, opcode_call, opcode_retlw, fin, pc );


// instantiating regs block 
reg_file regs (clk1, f_we, fsel, fin, regfile_out);


// instantiating data mux block

data_mux  dmux  ( clk2, resetn, fsr, rtcc, pc[7:0], status, porta,
                  portb, portc, regfile_out, w,
 				  k, fsel, aluout, alua_sel, alub_sel,
				  b_mux, bdpol, alua, alub, fin );


// instantiating alu block
always @(posedge clk3)
alua_tmp2 = alua_tmp;

alu uc_alu ( clk3, resetn, status, aluop, alua_tmp2, alub, 
             alu_cout, aluz, aluout) ;

// instantiating instruction rom block

INS_ROM rom (pc, romdata);

// instantiating special registers block

spcl_regs special_regs ( clk1, clk4, resetn, aluz, alu_cout, skip,
                         w_we, status_c_we, status_z_we,
						 tris_we, f_we, aluout, romdata,
						 fsel, fin, port_int_a, port_int_b, 
						 port_int_c, trisa, trisb, trisc,
						 status, w, fsr, inst );

// instantiating  io blocks

io io_buff ( porta, portb, portc,
             port_int_a, port_int_b, port_int_c, 
		     trisa, trisb, trisc );


endmodule
