--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:42:20 05/17/2020
-- Design Name:   
-- Module Name:   /home/ise/Xilinx/TRANSMISOR_OFDM/tb_fec.vhd
-- Project Name:  TRANSMISOR_OFDM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fec
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_fec IS
END tb_fec;
 
ARCHITECTURE behavior OF tb_fec IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fec
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         data_valido : IN  std_logic;
         fin_tx : IN  std_logic;
         data : IN  std_logic;
         o1 : OUT  std_logic;
         o2 : OUT  std_logic;
         dout_val : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal data_valido : std_logic := '0';
   signal fin_tx : std_logic := '0';
   signal data : std_logic := '0';

 	--Outputs
   signal o1 : std_logic;
   signal o2 : std_logic;
   signal dout_val : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fec PORT MAP (
          clk => clk,
          reset => reset,
          data_valido => data_valido,
          fin_tx => fin_tx,
          data => data,
          o1 => o1,
          o2 => o2,
          dout_val => dout_val
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
		reset <= '1';
		
      wait for 100 ns;	

		reset <= '0';
		
		data_valido<= '1';
		
      wait for clk_period*10;

      data <= '1';
		
		wait for clk_period*5;
		
		data <= '0';
		
		wait for clk_period*5;
		
		data <= '0';
		
		wait for clk_period*5;
		
		data <= '1';
		
		wait for clk_period*5;
		
		data <= '0';
		
		wait for clk_period*5;
		
		data <= '0';
		
		wait for clk_period*5;
		
		fin_tx <= '1';
		
      wait;
   end process;

END;
