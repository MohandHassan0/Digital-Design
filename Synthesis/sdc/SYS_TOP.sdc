###################################################################

# Created by write_sdc on Wed Oct 23 21:52:22 2024

###################################################################
set sdc_version 2.0

set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA
set_operating_conditions -max scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -max_library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -min scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c -min_library scmetro_tsmc_cl013g_rvt_ff_1p32v_m40c
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports RST_N]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports UART_CLK]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports REF_CLK]
set_driving_cell -lib_cell BUFX2M -library scmetro_tsmc_cl013g_rvt_ss_1p08v_125c -pin Y [get_ports UART_RX_IN]
set_load -pin_load 0.5 [get_ports UART_TX_O]
set_load -pin_load 0.5 [get_ports parity_error]
set_load -pin_load 0.5 [get_ports framing_error]
create_clock [get_ports UART_CLK]  -name UART_DOMAIN  -period 271.267  -waveform {0 135.634}
set_clock_uncertainty -setup 0.2  [get_clocks UART_DOMAIN]
set_clock_uncertainty -hold 0.1  [get_clocks UART_DOMAIN]
set_clock_transition -max -rise 0.1 [get_clocks UART_DOMAIN]
set_clock_transition -min -rise 0.1 [get_clocks UART_DOMAIN]
set_clock_transition -max -fall 0.1 [get_clocks UART_DOMAIN]
set_clock_transition -min -fall 0.1 [get_clocks UART_DOMAIN]
create_clock [get_ports REF_CLK]  -name REF_DOMAIN  -period 20  -waveform {0 10}
set_clock_uncertainty -setup 0.2  [get_clocks REF_DOMAIN]
set_clock_uncertainty -hold 0.1  [get_clocks REF_DOMAIN]
set_clock_transition -max -rise 0.1 [get_clocks REF_DOMAIN]
set_clock_transition -min -rise 0.1 [get_clocks REF_DOMAIN]
set_clock_transition -max -fall 0.1 [get_clocks REF_DOMAIN]
set_clock_transition -min -fall 0.1 [get_clocks REF_DOMAIN]
create_generated_clock [get_pins TX_CLK_DIV/o_div_clk]  -name TX_CLK  -source [get_ports UART_CLK]  -master_clock UART_DOMAIN  -divide_by 32  -add
set_clock_uncertainty -setup 0.2  [get_clocks TX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks TX_CLK]
set_clock_transition -max -rise 0.1 [get_clocks TX_CLK]
set_clock_transition -min -rise 0.1 [get_clocks TX_CLK]
set_clock_transition -max -fall 0.1 [get_clocks TX_CLK]
set_clock_transition -min -fall 0.1 [get_clocks TX_CLK]
create_generated_clock [get_pins RX_CLK_DIV/o_div_clk]  -name RX_CLK  -source [get_ports UART_CLK]  -master_clock UART_DOMAIN  -divide_by 1  -add
set_clock_uncertainty -setup 0.2  [get_clocks RX_CLK]
set_clock_uncertainty -hold 0.1  [get_clocks RX_CLK]
set_clock_transition -max -rise 0.1 [get_clocks RX_CLK]
set_clock_transition -min -rise 0.1 [get_clocks RX_CLK]
set_clock_transition -max -fall 0.1 [get_clocks RX_CLK]
set_clock_transition -min -fall 0.1 [get_clocks RX_CLK]
create_generated_clock [get_pins ALU_GATING_CLK/GATED_CLK]  -name Gated_Clock  -source [get_ports REF_CLK]  -master_clock REF_DOMAIN  -divide_by 1  -add
set_clock_uncertainty -setup 0.2  [get_clocks Gated_Clock]
set_clock_uncertainty -hold 0.1  [get_clocks Gated_Clock]
set_clock_transition -max -rise 0.1 [get_clocks Gated_Clock]
set_clock_transition -min -rise 0.1 [get_clocks Gated_Clock]
set_clock_transition -max -fall 0.1 [get_clocks Gated_Clock]
set_clock_transition -min -fall 0.1 [get_clocks Gated_Clock]
set_input_delay -clock RX_CLK  54.2535  [get_ports UART_RX_IN]
set_output_delay -clock TX_CLK  54.2535  [get_ports UART_TX_O]
set_output_delay -clock TX_CLK  54.2535  [get_ports parity_error]
set_output_delay -clock TX_CLK  54.2535  [get_ports framing_error]
set_clock_groups -asynchronous -name UART_DOMAIN_1 -group [list [get_clocks UART_DOMAIN] [get_clocks TX_CLK] [get_clocks RX_CLK]] -group [list [get_clocks REF_DOMAIN] [get_clocks Gated_Clock]]
