# Synplicity, Inc. constraint file
# C:\synplify_pro\tutorial\tutorial.sdc
# Written on Thu Sep 18 14:49:27 2007
# by Synplify Pro, Synplify Pro 8.8.0.4 Scope Editor

#
# Collections
#

#
# Clocks
#
define_clock            {clock} -name {clock}  -freq 125 -clockgroup default_clkgroup_0

#
# Clock to Clock
#

#
# Inputs/Outputs
#
define_input_delay -disable      -default -improve 0.00 -route 0.00
define_output_delay -disable     -default -improve 0.00 -route 0.00
define_input_delay -disable      {porta[7:0]} -improve 0.00 -route 0.00
define_output_delay -disable     {porta[7:0]} -improve 0.00 -route 0.00
define_input_delay -disable      {portb[7:0]} -improve 0.00 -route 0.00
define_output_delay -disable     {portb[7:0]} -improve 0.00 -route 0.00
define_input_delay -disable      {portc[7:0]} -improve 0.00 -route 0.00
define_output_delay -disable     {portc[7:0]} -improve 0.00 -route 0.00
define_input_delay -disable      {resetn} -improve 0.00 -route 0.00

#
# Registers
#

#
# False Path
#
define_false_path           -from {i:special_regs.status[7:0]} 

#
# Path Delay
#

#
# Attributes
#
define_global_attribute          syn_forward_io_constraints {1}
define_global_attribute          syn_dspstyle {logic}
define_global_attribute          syn_ramstyle {registers}

#
# I/O standards
#

#
# Compile Points
#

#
# Other Constraints
#
