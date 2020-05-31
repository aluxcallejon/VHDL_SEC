----------------------------------------------------------------------------------
-- Company:
-- Engineer: Luis   Callejon  Reche
--				 Maria  Jaramillo Sojo
--				 Adrian Sanchez   Garcia
--
-- Create Date:    21:39:36 05/07/2020
-- Design Name:
-- Module Name:    PPDU - PPDU_ARQ
-- Project Name:
-- Target Devices:
-- Tool versions:
-- Description:
--
-- Dependencies:
--
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;
use ieee.std_logic_unsigned.all;
-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity interleaver is
  GENERIC (
	 n_filas : integer :=7;
	 n_columnas : integer :=12
  );

  port (
  clk:         in  STD_LOGIC;
  reset:       in  STD_LOGIC;
  data:        in  STD_LOGIC;
  data_valid:  in  STD_LOGIC;
  addrb:			in  STD_LOGIC_VECTOR(8 downto 0);
  Ready     :  out STD_LOGIC;
  data_out  :  out std_logic_VECTOR(0 DOWNTO 0);
  dir_que_escribo: out std_logic_vector (8 DOWNTO 0) -- necesitamos ponerla como salida porque el tb la necesitara para sacarla en un fichero
  );
end entity;
architecture arch of interleaver is

COMPONENT RAM_INTERLEAVER
  PORT (
    clka : IN STD_LOGIC;
    wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    addra : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    dina : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
    clkb : IN STD_LOGIC;
    rstb : IN STD_LOGIC;
    addrb : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
    doutb : OUT STD_LOGIC_VECTOR(0 DOWNTO 0)
  );
END COMPONENT;

---------SIGNALS---------------------------------------------------------------

  signal p_ready: STD_LOGIC;
  type status is (Reposo, Desordena,Escribe, Transmite);
  signal estado,  p_estado   : status;
  signal cuenta_filas, p_cuenta_filas: integer range 0 to n_filas; 
  signal cuenta_columnas, p_cuenta_columnas: integer range 0 to n_columnas; 
  signal entrada_ram, p_entrada_ram :STD_LOGIC_VECTOR(0 DOWNTO 0);
  signal dir,p_dir :STD_LOGIC_VECTOR(8 DOWNTO 0);
  signal write_enable, p_write_enable: STD_LOGIC_VECTOR (0 downto 0);

  

-------------------------------------------------------------------------------



begin

	dir_que_escribo <= dir;
	entrada_ram(0)<=data;

MI_Ram_Interleaver : RAM_INTERLEAVER
  PORT MAP (
    clka => clk,
    wea => write_enable,
    addra => dir,
    dina => entrada_ram,
    clkb => clk,
    rstb => reset,
    addrb => addrb,
    doutb => data_out
  );

--

	
	
---------PROCESO SINCRONO------------------------------------------------------

  sinc : process(reset, clk)
  begin

    if (reset = '1') then
      estado <= Reposo;
      cuenta_columnas <= 0;
      cuenta_filas <= 0;
      Ready <= '0';
		dir <= (others=> '0');
		write_enable <= "0";
		--entrada_ram<="0";
		-- data_out <= "0";
		
		
  elsif (clk'event and clk= '1') then
    Ready <= p_ready;
    estado <= p_estado;
    cuenta_columnas <= p_cuenta_columnas;
    cuenta_filas <= p_cuenta_filas;
	-- entrada_ram <= p_entrada_ram;
	 dir <= p_dir;
	 write_enable <= p_write_enable;
	end if;

  end process;


---------MAQUINA DE ESTADOS----------------------------------------------------

  fsm:process(entrada_ram, data_valid, estado, cuenta_filas, cuenta_columnas, data,dir)
  begin

    p_estado <= estado;
    p_ready <= '0';
    p_cuenta_filas <= cuenta_filas;
    p_cuenta_columnas <= cuenta_columnas;
	-- p_entrada_ram <= entrada_ram;
	 p_dir <= dir;
	 p_write_enable <= "0";
	  
	 

    case estado is

      when Reposo   =>------------REPOSO-----------------------------

        if(data_valid = '1') then  --Valor valido -> comenzamos
          p_estado <= Escribe;
        end if;
		  
		when Escribe =>-------------ESCRIBE---------------------------
			
			--p_entrada_ram(0) <= data;
			p_write_enable <= "1";
			p_estado <= Desordena;

      when Desordena=>------------DESORDENA--------------------------
			
			
			
				if(cuenta_filas < n_filas)then
					p_cuenta_filas <= cuenta_filas + 1;
					-- p_dir <= dir + n_columnas; como es posible que funcione??
					p_dir <= std_logic_vector(unsigned(to_signed(n_columnas,9)) + Unsigned(dir));
					p_estado <= reposo;
				
				elsif (cuenta_columnas /= 11) then
				
					p_cuenta_filas <= 0;
					p_cuenta_columnas <= cuenta_columnas + 1 ;					
					p_estado <= reposo;
					p_dir <= std_logic_vector(unsigned(to_signed(cuenta_columnas,9)) + 1); --no se pone unsigned("000000001") porque ya es unsigned
					
				else
					p_estado <= Transmite;							
					
					
				end if;
							
				
      when Transmite =>-----------TRANSMITE--------------------------


        p_ready<='1';
        p_estado<=reposo;
		  p_dir <= (others=> '0');
	     p_cuenta_columnas <= 0;
		  p_cuenta_filas <= 0;

    end case;

  end process;

-------------------------------------------------------------------------------

end architecture;

