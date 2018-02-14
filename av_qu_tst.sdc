## Generated SDC file "av_qu_tst.sdc"

## Copyright (C) 2017  Intel Corporation. All rights reserved.
## Your use of Intel Corporation's design tools, logic functions 
## and other software and tools, and its AMPP partner logic 
## functions, and any output files from any of the foregoing 
## (including device programming or simulation files), and any 
## associated documentation or information are expressly subject 
## to the terms and conditions of the Intel Program License 
## Subscription Agreement, the Intel Quartus Prime License Agreement,
## the Intel FPGA IP License Agreement, or other applicable license
## agreement, including, without limitation, that your use is for
## the sole purpose of programming logic devices manufactured by
## Intel and sold by Intel or its authorized distributors.  Please
## refer to the applicable agreement for further details.


## VENDOR  "Altera"
## PROGRAM "Quartus Prime"
## VERSION "Version 17.1.0 Build 590 10/25/2017 SJ Standard Edition"

## DATE    "Wed Feb 14 12:22:21 2018"

##
## DEVICE  "5AGXFB3H4F35C5"
##


#**************************************************************
# Time Information
#**************************************************************

set_time_format -unit ns -decimal_places 3



#**************************************************************
# Create Clock
#**************************************************************

create_clock -name {altera_reserved_tck} -period 33.333 -waveform { 0.000 16.666 } [get_ports {altera_reserved_tck}]
create_clock -name {clk_100} -period 10.000 -waveform { 0.000 5.000 } [get_ports {i_100m_clk}]
create_clock -name {ref_clk} -period 6.400 -waveform { 0.000 3.200 } [get_ports {i_phy_ref_clk}]


#**************************************************************
# Create Generated Clock
#**************************************************************



#**************************************************************
# Set Clock Latency
#**************************************************************



#**************************************************************
# Set Clock Uncertainty
#**************************************************************

set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -setup 0.050  
set_clock_uncertainty -rise_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -setup 0.050  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -rise_to [get_clocks {altera_reserved_tck}] -setup 0.050  
set_clock_uncertainty -fall_from [get_clocks {altera_reserved_tck}] -fall_to [get_clocks {altera_reserved_tck}] -setup 0.050  
set_clock_uncertainty -rise_from [get_clocks {ref_clk}] -rise_to [get_clocks {ref_clk}] -setup 0.110  
set_clock_uncertainty -rise_from [get_clocks {ref_clk}] -rise_to [get_clocks {ref_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {ref_clk}] -fall_to [get_clocks {ref_clk}] -setup 0.110  
set_clock_uncertainty -rise_from [get_clocks {ref_clk}] -fall_to [get_clocks {ref_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {ref_clk}] -rise_to [get_clocks {ref_clk}] -setup 0.110  
set_clock_uncertainty -fall_from [get_clocks {ref_clk}] -rise_to [get_clocks {ref_clk}] -hold 0.060  
set_clock_uncertainty -fall_from [get_clocks {ref_clk}] -fall_to [get_clocks {ref_clk}] -setup 0.110  
set_clock_uncertainty -fall_from [get_clocks {ref_clk}] -fall_to [get_clocks {ref_clk}] -hold 0.060  
set_clock_uncertainty -rise_from [get_clocks {clk_100}] -rise_to [get_clocks {ref_clk}]  0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_100}] -fall_to [get_clocks {ref_clk}]  0.100  
set_clock_uncertainty -rise_from [get_clocks {clk_100}] -rise_to [get_clocks {clk_100}] -setup 0.050  
set_clock_uncertainty -rise_from [get_clocks {clk_100}] -fall_to [get_clocks {clk_100}] -setup 0.050  
set_clock_uncertainty -fall_from [get_clocks {clk_100}] -rise_to [get_clocks {ref_clk}]  0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_100}] -fall_to [get_clocks {ref_clk}]  0.100  
set_clock_uncertainty -fall_from [get_clocks {clk_100}] -rise_to [get_clocks {clk_100}] -setup 0.050  
set_clock_uncertainty -fall_from [get_clocks {clk_100}] -fall_to [get_clocks {clk_100}] -setup 0.050  


#**************************************************************
# Set Input Delay
#**************************************************************



#**************************************************************
# Set Output Delay
#**************************************************************



#**************************************************************
# Set Clock Groups
#**************************************************************

set_clock_groups -asynchronous -group [get_clocks {altera_reserved_tck}] 


#**************************************************************
# Set False Path
#**************************************************************

set_false_path -to [get_registers {*alt_xcvr_resync*sync_r[0]}]
set_false_path -from [get_keepers {altera_reserved_tdi}] -to [get_keepers {pzdyqx*}]
set_false_path -to [get_pins -nocase -compatibility_mode {*|alt_mge16_pcs_reset_synchronizer:*|alt_mge16_pcs_reset_synchronizer_chain*|clrn}]


#**************************************************************
# Set Multicycle Path
#**************************************************************



#**************************************************************
# Set Maximum Delay
#**************************************************************

set_max_delay -from [get_registers *] -to [get_registers {*alt_mge16_pcs_pma:*|alt_mge16_pcs_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1}] 100.000
set_max_delay -from [get_registers {mult_eth_phy:mult_eth_phy_1|mult_eth_phy_alt_mge_phy_0:alt_mge_phy_0|alt_mge_phy_pcs:mge_pcs|alt_mge16_pcs_pma:GMII_PCS.gmii_pcs|alt_mge16_pcs_pma_gige:alt_mge16_pcs_pma_gige_inst|alt_mge16_pcs_top_1000_base_x_strx_gx:alt_mge16_pcs_top_1000_base_x_strx_gx_inst|alt_mge16_pcs_top_sgmii_strx_gx:U_SGMII|alt_mge16_pcs_top_tx_converter:U_TXCV|alt_mge16_pcs_a_fifo_24:U_DSW|alt_mge16_pcs_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*alt_mge16_pcs_pma:*|alt_mge16_pcs_a_fifo_24:*|alt_mge16_pcs_std_synchronizer:*|din_s1*}] 100.000
set_max_delay -from [get_registers {mult_eth_phy:mult_eth_phy_1|mult_eth_phy_alt_mge_phy_0:alt_mge_phy_0|alt_mge_phy_pcs:mge_pcs|alt_mge16_pcs_pma:GMII_PCS.gmii_pcs|alt_mge16_pcs_pma_gige:alt_mge16_pcs_pma_gige_inst|alt_mge16_pcs_top_1000_base_x_strx_gx:alt_mge16_pcs_top_1000_base_x_strx_gx_inst|alt_mge16_pcs_top_sgmii_strx_gx:U_SGMII|alt_mge16_pcs_top_tx_converter:U_TXCV|alt_mge16_pcs_a_fifo_24:U_DSW|alt_mge16_pcs_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*alt_mge16_pcs_pma:*|alt_mge16_pcs_a_fifo_24:*|alt_mge16_pcs_std_synchronizer:*|din_s1*}] 100.000


#**************************************************************
# Set Minimum Delay
#**************************************************************

set_min_delay -from [get_registers *] -to [get_registers {*alt_mge16_pcs_pma:*|alt_mge16_pcs_std_synchronizer:*|altera_std_synchronizer_nocut:*|din_s1}] -100.000
set_min_delay -from [get_registers {mult_eth_phy:mult_eth_phy_1|mult_eth_phy_alt_mge_phy_0:alt_mge_phy_0|alt_mge_phy_pcs:mge_pcs|alt_mge16_pcs_pma:GMII_PCS.gmii_pcs|alt_mge16_pcs_pma_gige:alt_mge16_pcs_pma_gige_inst|alt_mge16_pcs_top_1000_base_x_strx_gx:alt_mge16_pcs_top_1000_base_x_strx_gx_inst|alt_mge16_pcs_top_sgmii_strx_gx:U_SGMII|alt_mge16_pcs_top_tx_converter:U_TXCV|alt_mge16_pcs_a_fifo_24:U_DSW|alt_mge16_pcs_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*alt_mge16_pcs_pma:*|alt_mge16_pcs_a_fifo_24:*|alt_mge16_pcs_std_synchronizer:*|din_s1*}] -100.000
set_min_delay -from [get_registers {mult_eth_phy:mult_eth_phy_1|mult_eth_phy_alt_mge_phy_0:alt_mge_phy_0|alt_mge_phy_pcs:mge_pcs|alt_mge16_pcs_pma:GMII_PCS.gmii_pcs|alt_mge16_pcs_pma_gige:alt_mge16_pcs_pma_gige_inst|alt_mge16_pcs_top_1000_base_x_strx_gx:alt_mge16_pcs_top_1000_base_x_strx_gx_inst|alt_mge16_pcs_top_sgmii_strx_gx:U_SGMII|alt_mge16_pcs_top_tx_converter:U_TXCV|alt_mge16_pcs_a_fifo_24:U_DSW|alt_mge16_pcs_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*alt_mge16_pcs_pma:*|alt_mge16_pcs_a_fifo_24:*|alt_mge16_pcs_std_synchronizer:*|din_s1*}] -100.000


#**************************************************************
# Set Input Transition
#**************************************************************



#**************************************************************
# Set Max Skew
#**************************************************************

set_max_skew -from [get_registers {mult_eth_phy:mult_eth_phy_1|mult_eth_phy_alt_mge_phy_0:alt_mge_phy_0|alt_mge_phy_pcs:mge_pcs|alt_mge16_pcs_pma:GMII_PCS.gmii_pcs|alt_mge16_pcs_pma_gige:alt_mge16_pcs_pma_gige_inst|alt_mge16_pcs_top_1000_base_x_strx_gx:alt_mge16_pcs_top_1000_base_x_strx_gx_inst|alt_mge16_pcs_top_sgmii_strx_gx:U_SGMII|alt_mge16_pcs_top_tx_converter:U_TXCV|alt_mge16_pcs_a_fifo_24:U_DSW|alt_mge16_pcs_gray_cnt:U_RD|g_out[*]}] -to [get_registers {*alt_mge16_pcs_pma:*|alt_mge16_pcs_a_fifo_24:*|alt_mge16_pcs_std_synchronizer:*|din_s1*}] 6.000 
set_max_skew -from [get_registers {mult_eth_phy:mult_eth_phy_1|mult_eth_phy_alt_mge_phy_0:alt_mge_phy_0|alt_mge_phy_pcs:mge_pcs|alt_mge16_pcs_pma:GMII_PCS.gmii_pcs|alt_mge16_pcs_pma_gige:alt_mge16_pcs_pma_gige_inst|alt_mge16_pcs_top_1000_base_x_strx_gx:alt_mge16_pcs_top_1000_base_x_strx_gx_inst|alt_mge16_pcs_top_sgmii_strx_gx:U_SGMII|alt_mge16_pcs_top_tx_converter:U_TXCV|alt_mge16_pcs_a_fifo_24:U_DSW|alt_mge16_pcs_gray_cnt:U_WRT|g_out[*]}] -to [get_registers {*alt_mge16_pcs_pma:*|alt_mge16_pcs_a_fifo_24:*|alt_mge16_pcs_std_synchronizer:*|din_s1*}] 6.000 


#**************************************************************
# Set Disable Timing
#**************************************************************

set_disable_timing -from * -to * [get_cells -hierarchical {AMGP4450_0}]
set_disable_timing -from * -to * [get_cells -hierarchical {TPOO7242_0}]
set_disable_timing -from * -to * [get_cells -hierarchical {TPOO7242_1}]
set_disable_timing -from * -to * [get_cells -hierarchical {TPOO7242_2}]
set_disable_timing -from * -to * [get_cells -hierarchical {TPOO7242_3}]
set_disable_timing -from * -to * [get_cells -hierarchical {TPOO7242_4}]
set_disable_timing -from * -to * [get_cells -hierarchical {TPOO7242_5}]
set_disable_timing -from * -to * [get_cells -hierarchical {TPOO7242_6}]
set_disable_timing -from * -to * [get_cells -hierarchical {TPOO7242_7}]
set_disable_timing -from * -to * [get_cells -hierarchical {ZNXJ5711_0}]
