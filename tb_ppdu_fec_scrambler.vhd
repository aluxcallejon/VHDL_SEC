--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   11:00:55 05/17/2020
-- Design Name:   
-- Module Name:   /home/ise/Xilinx/TRANSMISOR_OFDM/tb_ppdu_fec_scrambler.vhd
-- Project Name:  TRANSMISOR_OFDM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: PPDU_fec_scrambler
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
use std.TEXTIO.all; -- libreria para trabajar con ficheros
USE ieee.numeric_std.ALL; -- proporciona unsigned y signed entre otros
use ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ppdu_fec_scrambler IS
END tb_ppdu_fec_scrambler;
 
ARCHITECTURE behavior OF tb_ppdu_fec_scrambler IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT PPDU_fec_scrambler
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         modulacion : IN  std_logic_vector(1 downto 0);
         data_scrambler : OUT  std_logic;
         data_valido_scrambler : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal modulacion : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal data_scrambler : std_logic;
   signal data_valido_scrambler : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: PPDU_fec_scrambler PORT MAP (
          clk => clk,
          reset => reset,
          modulacion => modulacion,
          data_scrambler => data_scrambler,
          data_valido_scrambler => data_valido_scrambler
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
		reset<= '1';
      wait for 100 ns;	
		reset <='0';

      wait;
   end process;
	
	escribe_salida: process
	
		variable linea: line;
		variable valor_integer: integer;
		variable bit_direccion: std_logic_vector (8 downto 0);
		FILE fout2: text open write_mode is "Salida_Scrambler.txt"; -- el fichero donde escribamos los valores sera ram_interleaver.txt
		variable cuenta_bucle: integer;
		
	begin
	wait until data_valido_scrambler = '1';
	if(data_scrambler='1') then
	valor_integer := 1; 
	else
	valor_integer := 0; 
	end if;
				write(linea, valor_integer);
				writeline(fout2, linea);
	end process;

END;
