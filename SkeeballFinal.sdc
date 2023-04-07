create_clock -name "CLOCK_50" -period 250.000ns [get_ports CLOCK_50]
create_clock -name "KEY[0]" -period 400.000ns [get_ports KEY[0]]

create_clock -period 250.000 -name clk50MHzto1Hz:inst13|my_MOD5:div5_1|pstate.E clk50MHzto1Hz:inst13|my_MOD5:div5_1|pstate.E

create_clock -period 250.000 -name clk50MHzto1Hz:inst13|my_MOD10:div10_1|pstate.J clk50MHzto1Hz:inst13|my_MOD10:div10_1|pstate.J
create_clock -period 250.000 -name clk50MHzto1Hz:inst13|my_MOD10:div10_2|pstate.J clk50MHzto1Hz:inst13|my_MOD10:div10_2|pstate.J
create_clock -period 250.000 -name clk50MHzto1Hz:inst13|my_MOD10:div10_3|pstate.J clk50MHzto1Hz:inst13|my_MOD10:div10_3|pstate.J
create_clock -period 250.000 -name clk50MHzto1Hz:inst13|my_MOD10:div10_4|pstate.J clk50MHzto1Hz:inst13|my_MOD10:div10_4|pstate.J
create_clock -period 250.000 -name clk50MHzto1Hz:inst13|my_MOD10:div10_5|pstate.J clk50MHzto1Hz:inst13|my_MOD10:div10_5|pstate.J
create_clock -period 250.000 -name clk50MHzto1Hz:inst13|my_MOD10:div10_6|pstate.J clk50MHzto1Hz:inst13|my_MOD10:div10_6|pstate.J
create_clock -period 250.000 -name clk50MHzto1Hz:inst13|my_MOD10:div10_7|pstate.J clk50MHzto1Hz:inst13|my_MOD10:div10_7|pstate.J

create_clock -period 250.000 -name highforfive:inst14|myCount5:countforfive|laststate.s5 highforfive:inst14|myCount5:countforfive|laststate.s5
create_clock -period 250.000 -name highforfive:inst15|myCount5:countforfive|laststate.s5 highforfive:inst15|myCount5:countforfive|laststate.s5

create_clock -period 500.000 -name skeeballState:inst11|state[1] skeeballState:inst11|state[1]


derive_pll_clocks
derive_clock_uncertainty