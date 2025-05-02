
####################################################################################
# Constraints
# ----------------------------------------------------------------------------
#
# 0. Design Compiler variables
#
# 1. Master Clock Definitions
#
# 2. Generated Clock Definitions
#
# 3. Clock Uncertainties
#
# 4. Clock Latencies 
#
# 5. Clock Relationships
#
# 6. set input/output delay on ports
#
# 7. Driving cells
#
# 8. Output load

####################################################################################
           #########################################################
                  #### Section 0 : DC Variables ####
           #########################################################
#################################################################################### 

# Prevent assign statements in the generated netlist (must be applied before compile command)
set verilogout_no_tri true
set_fix_multiple_port_nets -all -buffer_constants -feedthroughs

####################################################################################
           #########################################################
                  #### Section 1 : Clock Definition ####
           #########################################################
#################################################################################### 
# 1. Master Clock Definitions 
# 2. Generated Clock Definitions
# 3. Clock Latencies
# 4. Clock Uncertainties
# 4. Clock Transitions
####################################################################################


#################################################################################### 
# 1. Master Clock Definitions 
#################################################################################### 

set CLK_SETUP_SKEW 0.2
set CLK_HOLD_SKEW 0.1
set CLK_RISE 0.1
set CLK_FALL 0.1
set REF_CLK_PER 20
set UART_CLK_PER 271.26736

create_clock -name UART_DOMAIN -period $UART_CLK_PER -waveform "0 [expr $UART_CLK_PER/2]" [get_ports UART_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks UART_DOMAIN]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks UART_DOMAIN]
set_clock_transition -rise $CLK_RISE  [get_clocks UART_DOMAIN]
set_clock_transition -fall $CLK_FALL  [get_clocks UART_DOMAIN]

create_clock -name REF_DOMAIN -period $REF_CLK_PER -waveform "0 [expr $REF_CLK_PER/2]" [get_ports REF_CLK]
set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks REF_DOMAIN]
set_clock_uncertainty -hold $CLK_HOLD_SKEW  [get_clocks REF_DOMAIN]
set_clock_transition -rise $CLK_RISE  [get_clocks REF_DOMAIN]
set_clock_transition -fall $CLK_FALL  [get_clocks REF_DOMAIN]
					   
set_dont_touch_network [get_clocks {UART_DOMAIN REF_DOMAIN}]

#################################################################################### 
# 2. Generated Clock Definitions
#################################################################################### 

create_generated_clock -master_clock UART_DOMAIN  -source [get_ports UART_CLK] -name "TX_CLK"      -divide_by 32 [get_port TX_CLK_DIV/o_div_clk]
create_generated_clock -master_clock UART_DOMAIN  -source [get_ports UART_CLK] -name "RX_CLK"      -divide_by 1 [get_port RX_CLK_DIV/o_div_clk]
create_generated_clock -master_clock REF_DOMAIN   -source [get_ports REF_CLK]  -name "Gated_Clock" -divide_by 1 [get_port ALU_GATING_CLK/GATED_CLK]

#################################################################################### 
# 3. Clock Latencies
#################################################################################### 

#################################################################################### 
# 4. Clock Uncertainties
#################################################################################### 

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks TX_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks TX_CLK]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks RX_CLK]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks RX_CLK]

set_clock_uncertainty -setup $CLK_SETUP_SKEW [get_clocks Gated_Clock]
set_clock_uncertainty -hold $CLK_HOLD_SKEW   [get_clocks Gated_Clock]

#################################################################################### 
# 4. Clock Transitions 
#################################################################################### 

set_clock_transition -rise $CLK_RISE  [get_clocks TX_CLK]
set_clock_transition -fall $CLK_FALL  [get_clocks TX_CLK]

set_clock_transition -rise $CLK_RISE  [get_clocks RX_CLK]
set_clock_transition -fall $CLK_FALL  [get_clocks RX_CLK]

set_clock_transition -rise $CLK_RISE  [get_clocks Gated_Clock]
set_clock_transition -fall $CLK_FALL  [get_clocks Gated_Clock]


####################################################################################
           #########################################################
             #### Section 2 : Clocks Relationship ####
           #########################################################
####################################################################################

set_clock_groups -asynchronous -group [get_clocks "UART_DOMAIN TX_CLK RX_CLK"] -group [get_clocks "REF_DOMAIN Gated_Clock"]
#set_false_path -from REF_DOMAIN    -to UART_DOMAIN
set_dont_touch_network [get_ports  REF_CLK]
set_dont_touch_network [get_ports  UART_CLK]

####################################################################################
           #########################################################
             #### Section 3 : set input/output delay on ports ####
           #########################################################
####################################################################################

set in_delay  [expr 0.2*$UART_CLK_PER]
set out_delay [expr 0.2*$UART_CLK_PER]

#Constrain Input Paths

set_input_delay $in_delay -clock RX_CLK [get_ports UART_RX_IN]



#Constrain Output Paths

set_output_delay $out_delay -clock TX_CLK      [get_ports UART_TX_O]
set_output_delay $out_delay -clock TX_CLK      [get_ports parity_error]
set_output_delay $out_delay -clock TX_CLK      [get_ports framing_error]


####################################################################################
           #########################################################
                  #### Section 4 : Driving cells ####
           #########################################################
####################################################################################

set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port UART_RX_IN]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port REF_CLK]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port UART_CLK]
set_driving_cell -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -lib_cell BUFX2M -pin Y [get_port RST_N]


####################################################################################
           #########################################################
                  #### Section 5 : Output load ####
           #########################################################
####################################################################################

set_load 0.5 [get_ports UART_TX_O]
set_load 0.5 [get_ports parity_error]
set_load 0.5 [get_ports framing_error]

####################################################################################
           #########################################################
                 #### Section 6 : Operating Condition ####
           #########################################################
####################################################################################

# Define the Worst Library for Max(#setup) analysis
# Define the Best Library for Min(hold) analysis

set_operating_conditions -min_library "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c"  -min "scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c"  -max_library "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"  -max "scmetro_tsmc_cl013g_rvt_ss_1p08v_125c"

####################################################################################
           #########################################################
                  #### Section 7 : wireload Model ####
           #########################################################
####################################################################################

#set_wire_load_model -name "tsmc13_wl10"

####################################################################################
           #########################################################
                  #### Section 8 : set_case_analysis ####
           #########################################################
####################################################################################

####################################################################################


