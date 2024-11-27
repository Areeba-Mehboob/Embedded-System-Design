##Switches

set_property -dict { PACKAGE_PIN M20   IOSTANDARD LVCMOS33 } [get_ports { reset }]; #IO_L7N_T1_AD2N_35 Sch=sw[0]
## Clock signal 125 MHz
set_property -dict { PACKAGE_PIN H16   IOSTANDARD LVCMOS33 } [get_ports { clk_in }]; #IO_L13P_T2_MRCC_35 Sch=sysclk
#create_clock -add -name sys_clk_pin -period 8.00 -waveform {0 4} [get_ports { sysclk }];
##Arduino Digital I/O On Outer Analog Header
##NOTE: These pins should be used when using the analog header signals A0-A5 as digital I/O 

set_property -dict { PACKAGE_PIN Y11   IOSTANDARD LVCMOS33 } [get_ports { clk_tx }]; #IO_L18N_T2_13 Sch=a[0]
set_property -dict { PACKAGE_PIN Y12   IOSTANDARD LVCMOS33 } [get_ports { cs_tx }]; #IO_L20P_T3_13 Sch=a[1]
set_property -dict { PACKAGE_PIN W11   IOSTANDARD LVCMOS33 } [get_ports { s_d_tx }]; #IO_L18P_T2_13 Sch=a[2]
set_property -dict { PACKAGE_PIN V11   IOSTANDARD LVCMOS33 } [get_ports { clk_rx }]; #IO_L21P_T3_DQS_13 Sch=a[3]
set_property -dict { PACKAGE_PIN T5    IOSTANDARD LVCMOS33 } [get_ports { cs_rx }]; #IO_L19P_T3_13 Sch=a[4]
set_property -dict { PACKAGE_PIN U10   IOSTANDARD LVCMOS33 } [get_ports { s_d_rx }]; #IO_L12N_T1_MRCC_13 Sch=a[5]