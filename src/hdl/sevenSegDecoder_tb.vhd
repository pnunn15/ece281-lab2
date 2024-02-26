--+----------------------------------------------------------------------------
--| 
--| COPYRIGHT 2017 United States Air Force Academy All rights reserved.
--| 
--| United States Air Force Academy     __  _______ ___    _________ 
--| Dept of Electrical &               / / / / ___//   |  / ____/   |
--| Computer Engineering              / / / /\__ \/ /| | / /_  / /| |
--| 2354 Fairchild Drive Ste 2F6     / /_/ /___/ / ___ |/ __/ / ___ |
--| USAF Academy, CO 80840           \____//____/_/  |_/_/   /_/  |_|
--| 
--| ---------------------------------------------------------------------------
--|
--| FILENAME      : halfAdder_tb.vhd
--| AUTHOR(S)     : Capt Warner
--| CREATED       : 01/17/2017
--| DESCRIPTION   : This file implements a half adder test bench.
--|
--| DOCUMENTATION : Modified slightly by Capt Johnson
--|
--+----------------------------------------------------------------------------
--|
--| REQUIRED FILES :
--|
--|    Libraries : ieee
--|    Packages  : std_logic_1164, numeric_std, unisim
--|    Files     : halfAdder.vhd
--|
--+----------------------------------------------------------------------------
--|
--| NAMING CONVENSIONS :
--|
--|    xb_<port name>           = off-chip bidirectional port ( _pads file )
--|    xi_<port name>           = off-chip input port         ( _pads file )
--|    xo_<port name>           = off-chip output port        ( _pads file )
--|    b_<port name>            = on-chip bidirectional port
--|    i_<port name>            = on-chip input port
--|    o_<port name>            = on-chip output port
--|    c_<signal name>          = combinatorial signal
--|    f_<signal name>          = synchronous signal
--|    ff_<signal name>         = pipeline stage (ff_, fff_, etc.)
--|    <signal name>_n          = active low signal
--|    w_<signal name>          = top level wiring signal
--|    g_<generic name>         = generic
--|    k_<constant name>        = constant
--|    v_<variable name>        = variable
--|    sm_<state machine type>  = state machine type definition
--|    s_<signal name>          = state name
--|
--+----------------------------------------------------------------------------
library ieee;
  use ieee.std_logic_1164.all;
  use ieee.numeric_std.all;
  
entity sevenSegDecoder_tb is
end sevenSegDecoder_tb;

architecture test_bench of sevenSegDecoder_tb is 

	-- Component Declaration	
  component sevenSegDecoder is
            port (
                i_D : in std_logic_vector(3 downto 0);
                o_S : out std_logic_vector(6 downto 0)
            );
  end component sevenSegDecoder;

  
  signal w_7SD_EN_n : std_logic := '0'; 
  signal w_sw : std_logic_vector(3 downto 0) := "0000";
  signal w_seg : std_logic_vector(6 downto 0) := "0000000";  
begin
	-- PORT MAPS ----------------------------------------
	sevenSegDecoder_inst : sevenSegDecoder port map(
           i_D => w_sw,
           o_S => w_seg
        );
	-----------------------------------------------------
	
	-- PROCESSES ----------------------------------------	
	-- Test plan process
	-- Testing each combination of i_A and i_B (4 total)
	test_process : process 
	begin
	
		w_sw <= x"0"; wait for 10 ns;
		  assert w_seg = "1000000" report "bad x0" severity failure;
		w_sw <= x"1"; wait for 10 ns;
		  assert w_seg = "1111001" report "bad x1" severity failure;
		w_sw <= "0010"; wait for 10 ns;
          assert w_seg = "0100100" report "bad x2" severity failure;
        w_sw <= x"3"; wait for 10 ns;
          assert w_seg = "0110000" report "bad x3" severity failure;
        w_sw <= x"4"; wait for 10 ns;
          assert w_seg = "0011001" report "bad x4" severity failure;
        w_sw <= x"5"; wait for 10 ns;
          assert w_seg = "0010010" report "bad x5" severity failure;
        w_sw <= x"6"; wait for 10 ns;
          assert w_seg = "0000010" report "bad x6" severity failure;
        w_sw <= x"7"; wait for 10 ns;
          assert w_seg = "1111000" report "bad x7" severity failure;
        w_sw <= x"8"; wait for 10 ns;
          assert w_seg = "0000000" report "bad x8" severity failure;
        w_sw <= x"9"; wait for 10 ns;
          assert w_seg = "0011000" report "bad x9" severity failure;
        w_sw <= x"A"; wait for 10 ns;
          assert w_seg = "0001000" report "bad xA" severity failure;
        w_sw <= x"B"; wait for 10 ns;
          assert w_seg = "0000011" report "bad xB" severity failure;
        w_sw <= x"C"; wait for 10 ns;
          assert w_seg = "0100111" report "bad xC" severity failure;
        w_sw <= x"D"; wait for 10 ns;
          assert w_seg = "0100001" report "bad xD" severity failure;
        w_sw <= x"E"; wait for 10 ns;
          assert w_seg = "0000110" report "bad xE" severity failure;
        w_sw <= x"F"; wait for 10 ns;
          assert w_seg = "0001110" report "bad xF" severity failure;
		
		wait; -- wait forever
		
	end process;	
	-----------------------------------------------------	
	
end test_bench;
