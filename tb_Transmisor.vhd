--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   05:41:25 05/31/2020
-- Design Name:   
-- Module Name:   /home/ise/SEC/TRANSMISOR_OFDM/Tb_Transmisor.vhd
-- Project Name:  TRANSMISOR_OFDM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Transmisor
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
LIBRARY STD; 
use std.TEXTIO.all; -- libreria para trabajar con ficheros
USE ieee.numeric_std.ALL; -- proporciona unsigned y signed entre otros
use ieee.std_logic_unsigned.all;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY Tb_Transmisor IS
END Tb_Transmisor;
 
ARCHITECTURE behavior OF Tb_Transmisor IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Transmisor
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         Modulacion : IN  std_logic_vector(1 downto 0);
			Entrada_ifft_re: out std_logic_vector (7 DOWNTO 0);
		   Entrada_ifft_im: out std_logic_vector (7 DOWNTO 0);
			Entrada_RAM_im: out std_logic_vector(7 downto 0);
			Entrada_RAM_re:out std_logic_vector(7 downto 0);
			Dir_mapper:out std_logic_vector(6 downto 0);
         xk_im : OUT  std_logic_vector(15 downto 0);
         xk_re : OUT  std_logic_vector(15 downto 0);
         xk_index : OUT  std_logic_vector(6 downto 0);
			xn_index : OUT  std_logic_vector(6 downto 0);
         dataValid : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal Modulacion : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal xk_im : std_logic_vector(15 downto 0);
   signal xk_re : std_logic_vector(15 downto 0);
   signal xk_index : std_logic_vector(6 downto 0);
	signal xn_index : std_logic_vector(6 downto 0);
	signal entrada_ifft_re: std_logic_vector(7 downto 0);
   signal entrada_ifft_im: std_logic_vector(7 downto 0);
	signal entrada_RAM_re: std_logic_vector(7 downto 0);		
	signal entrada_RAM_im: std_logic_vector(7 downto 0);
	signal dir_mapper: std_logic_vector(6 downto 0);
   signal dataValid : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Transmisor PORT MAP (
          clk => clk,
          reset => reset,
          Modulacion => Modulacion,
          xk_im => xk_im,
          xk_re => xk_re,
          xk_index => xk_index,
			 xn_index=> xn_index,
			 entrada_ifft_re=>entrada_ifft_re,
			 entrada_ifft_im=>entrada_ifft_im,
			 entrada_RAM_re=>entrada_RAM_re,
			 entrada_RAM_im=>entrada_RAM_im,
			 dir_mapper=>dir_mapper,
          dataValid => dataValid
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
		modulacion<="00";
		reset<='1';
      wait for 100 ns;	
		reset<='0';
      -- insert stimulus here 

      wait;
   end process;
	
	escribe_ifft: process
	
		variable linea: line;
		variable valor_integer: integer;
		FILE fout2: text open write_mode is "Salida_IFFT_Vhdl.txt"; -- el fichero donde escribamos los valores sera ram_interleaver.txt
		
	begin
	
		
		
		wait until datavalid = '1';	

		for j in 0 to 127 loop 
				valor_integer := to_integer(signed(xk_re));				
				write(linea, valor_integer);
				write(linea," ");
				valor_integer := to_integer(signed(xk_im));
				write(linea,valor_integer);
				writeline(fout2, linea);
				wait for clk_period;
				
		end loop;
	end process;
	
	
	escribe_entrada_ifft: process
	
		variable linea: line;
		variable valor_integer: integer;
		FILE fout2: text open write_mode is "Entrada_IFFT_Vhdl.txt"; -- el fichero donde escribamos los valores sera ram_interleaver.txt
		
		
	begin
	
		
		
		wait until xn_index="0000011";	

		for j in 0 to 127 loop 
				valor_integer := to_integer(signed(Entrada_IFFT_re));				
				write(linea, valor_integer);
				write(linea," ");
				valor_integer := to_integer(signed(Entrada_IFFT_im));
				write(linea,valor_integer);
				writeline(fout2, linea);
				wait for clk_period;
				
		end loop;
	end process;

escribe_RAM_mapper: process
	
		variable linea: line;
		variable valor_integer: integer;
		FILE fout2: text open write_mode is "RAM_Mapper_Vhdl.txt"; -- el fichero donde escribamos los valores sera ram_interleaver.txt
		
		
	begin
		for j in 0 to 95 loop 
				wait until dir_mapper'event ;	
				valor_integer := to_integer(signed(Entrada_RAM_re));				
				write(linea, valor_integer);
				write(linea," ");
				valor_integer := to_integer(signed(Entrada_IFFT_im));
				write(linea,valor_integer);
				writeline(fout2, linea);
				wait for clk_period;
				
		end loop;
	end process;

END;
