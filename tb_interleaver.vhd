--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:32:12 05/18/2020
-- Design Name:   
-- Module Name:   C:/Users/marij/OneDrive/Universidad/SEC/Trabajo de SEC/TRANSMISOR_OFDM_V1.2/TRANSMISOR_OFDM/tb_interleaver.vhd
-- Project Name:  TRANSMISOR_OFDM
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ppd_fec_scrambler_interleaver
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
USE ieee.std_logic_1164.ALL; --define std_logic y std_logic_vector entre otras
-- USE IEEE.STD_LOGIC_TEXTIO.ALL; -- proporciona las funciones para trabajar con ficheros

LIBRARY STD; 
use std.TEXTIO.all; -- libreria para trabajar con ficheros
USE ieee.numeric_std.ALL; -- proporciona unsigned y signed entre otros
use ieee.std_logic_unsigned.all; -- permite sumar grupos de bits con significado numerico

 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_interleaver IS
END tb_interleaver;
 
ARCHITECTURE behavior OF tb_interleaver IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT ppd_fec_scrambler_interleaver
    PORT(
         clk : IN  std_logic;
         reset : IN  std_logic;
         modulacion : IN  std_logic_vector(1 downto 0);
         addrb : IN  std_logic_vector(8 downto 0);
         ready : OUT  std_logic;
         dout : OUT  std_logic_vector(0 downto 0);
			dir_que_escribo: out std_logic_vector (8 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal clk : std_logic := '0';
   signal reset : std_logic := '0';
   signal modulacion : std_logic_vector(1 downto 0) := (others => '0');
   signal addrb : std_logic_vector(8 downto 0) := (others => '0');

 	--Outputs
   signal ready : std_logic;
   signal dout : std_logic_vector(0 downto 0);
	signal dir_que_escribo: std_logic_vector(8 downto 0);

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: ppd_fec_scrambler_interleaver PORT MAP (
          clk => clk,
          reset => reset,
          modulacion => modulacion,
          addrb => addrb,
          ready => ready,
          dout => dout,
			 dir_que_escribo => dir_que_escribo
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
	
	escribe_indice: process
	
		variable linea: line;
		variable indice_integer: integer;
		variable bit_direccion: std_logic_vector (8 downto 0);
		FILE fout: text open write_mode is "indices.txt"; -- el fichero donde escribamos los indices sera indices.txt
		variable cuenta_bucle: integer;
		
	begin
	
		case modulacion is 
		
			when "00" => cuenta_bucle:= 96;
			when "01" => cuenta_bucle := 192;
			when others => cuenta_bucle := 288;
			
		end case;
	
		wait until reset = '0';
		
		for j in 0 to cuenta_bucle loop
		
			for i in 0 to 8 loop -- la direccion que leo es de 9 bits
			
				bit_direccion (i) := dir_que_escribo (i);
							
			end loop;
		
			indice_integer := To_integer(Unsigned(bit_direccion));
			
			write (linea, indice_integer); -- escribimos el indice integer en linea
			writeline (fout, linea); --escribimos el indice_integer en el fichero de salida
			
			wait until dir_que_escribo'event; -- esperamos a que la seal de direccion cambie para leerla
		
		
		end loop;
	end process;
	
	escribe_salida: process
	
		variable linea: line;
		variable valor_integer: integer;
		variable bit_direccion: std_logic_vector (8 downto 0);
		FILE fout2: text open write_mode is "ram_interleaver.txt"; -- el fichero donde escribamos los valores sera ram_interleaver.txt
		variable cuenta_bucle: integer;
		
	begin
	
		case modulacion is 
		
			when "00" => cuenta_bucle:= 96;
			when "01" => cuenta_bucle := 192;
			when others => cuenta_bucle := 288;
			
		end case;
		
		addrb <= (others => '0');
		wait until ready = '1';
		
			for j in 1 to cuenta_bucle loop
			
				wait for clk_period;
				
				valor_integer := to_integer(unsigned(dout));
            addrb <= (addrb + '1');				
				write(linea, valor_integer);
				writeline(fout2, linea);
		
		end loop;
	end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      reset <= '1';
      wait for 100 ns;
		reset <='0';

      wait for clk_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
