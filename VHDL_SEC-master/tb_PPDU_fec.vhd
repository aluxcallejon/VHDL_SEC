--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:10:07 05/17/2020
-- Design Name:   
-- Module Name:   /home/ise/Xilinx/TRANSMISOR_OFDM/tb_PPDU_fec.vhd
-- Project Name:  TRANSMISOR_OFDM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PPDU_fec
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
use std.TEXTIO.all;
USE ieee.numeric_std.ALL; -- proporciona unsigned y signed entre otros
use ieee.std_logic_unsigned.all; 
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_PPDU_fec IS
END tb_PPDU_fec;
 
ARCHITECTURE behavior OF tb_PPDU_fec IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PPDU_fec
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         modulacion : IN  std_logic_vector(1 downto 0);
         salida1 : OUT  std_logic;
         salida2 : OUT  std_logic;
         dato_valido : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal modulacion : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal salida1 : std_logic;
   signal salida2 : std_logic;
   signal dato_valido : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PPDU_fec PORT MAP (
          clk => clk,
          reset => reset,
          modulacion => modulacion,
          salida1 => salida1,
          salida2 => salida2,
          dato_valido => dato_valido
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
		reset<='1';
      wait for 100 ns;	
		reset<='0';
      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;
	

END;
