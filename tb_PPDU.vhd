--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:16:56 05/08/2020
-- Design Name:   
-- Module Name:   /home/ise/Xilinx/TRANSMISOR_OFDM/tb_PPDU.vhd
-- Project Name:  TRANSMISOR_OFDM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PPDU
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
 
ENTITY tb_PPDU IS
END tb_PPDU;
 
ARCHITECTURE behavior OF tb_PPDU IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PPDU
    PORT(
         clk 			: IN   std_logic;
         reset 		: IN   std_logic;
         modulacion 	: IN   std_logic_vector(1 downto 0);
         data_valido : OUT  std_logic;
         data 			: OUT  std_logic;
         fin_tx 		: OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk 			: std_logic := '0';
   signal reset 		: std_logic := '0';
   signal modulacion : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal data_valido 	: std_logic;
   signal data 			: std_logic;
   signal fin_tx 			: std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PPDU PORT MAP (
          clk 				=> clk,
          reset 			=> reset,
          modulacion 	=> modulacion,
          data_valido 	=> data_valido,
          data 			=> data,
          fin_tx 			=> fin_tx
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

      wait for clk_period*10;
		
		modulacion <= "11";

      -- insert stimulus here 

      wait;
   end process;

END;
