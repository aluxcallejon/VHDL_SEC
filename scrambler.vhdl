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

entity scrambler is
  port (
  clk:        in  STD_LOGIC;
  reset:      in  STD_LOGIC;
  o1:         in  STD_LOGIC;
  o2:         in  STD_LOGIC;
  data_valid :in  STD_LOGIC;
  salida:     out STD_LOGIC;
  dout_val:   out STD_LOGIC
  );
end entity;

architecture arch of scrambler is

---------SIGNALS---------------------------------------------------------------

  signal registro,p_registro: std_logic_vector (6 downto 0);
  signal p_salida, p_dout_val: STD_LOGIC;
  type estados is (reposo, desplaza_o1, tx_o1, desplaza_o2, tx_o2);
  signal estado, p_estado: estados;
  signal salida_aux :STD_LOGIC;
  signal contador, p_contador: std_logic_vector (1 downto 0);
  signal contador2,p_contador2: unsigned (9 downto 0);

-------------------------------------------------------------------------------
begin


	salida <= salida_aux;

---------PROCESO SINCRONO------------------------------------------------------

	sinc : process(clk,reset)
		begin
			if (reset = '1') then
				registro 	<= (others => '1');
				salida_aux  <= '0';
				dout_val 	<= '0';
				estado   	<= reposo;
				contador 	<= (others => '0');
				contador2 	<= (others => '0');
			elsif (clk'event and clk='1') then
				registro 	<= p_registro;
				salida_aux  <= p_salida;
				dout_val 	<= p_dout_val;
				estado   	<= p_estado;
				contador 	<= p_contador;
				contador2 	<= p_contador2;
			 end if;
  end process;

---------PROCESO COMBINACIONAL-------------------------------------------------

  fsm : process(registro,estado,salida_aux, data_valid, o1, o2, contador,contador2)
  begin
  
    p_dout_val 	<= '0';
    p_salida   	<= salida_aux;
    p_estado   	<= estado;
    p_registro 	<= registro;
	 p_contador 	<= contador;
	 p_contador2 	<= contador2;


    case( estado ) is

      when reposo =>-------------------REPOSO------------------------

      if (data_valid = '1') then
        p_estado <= tx_o1;
      end if;

      when tx_o1 =>-----------------------TRANSMITE_O1---------------
		
		p_contador2	<= contador2 + 1;
      p_dout_val	<= '1';
      p_salida 	<= o1 xor registro(3) xor registro(6);
      p_estado 	<= desplaza_o1;
		
      when desplaza_o1 =>-----------------DESPLAZA_O1----------------
		
		if (contador = "00") then
			p_registro <= registro(5 downto 0) & (registro(3) xor registro(6)) ;
			p_contador <= contador + '1';
		
		elsif (contador = "11") then -- este contador nos sirve para sincronizar los pulsos de salida con el interleaver
			p_estado   <= tx_o2;
			p_contador <= (others => '0');
			
		else
			p_contador <= contador + '1';
		end if;
		
		

      when tx_o2 =>-----------------------TRANSMITE_O2-------------
		
		p_contador2 <= contador2 + 1;
      p_dout_val  <= '1';
      p_salida		<= o2 xor registro(3) xor registro(6);
      p_estado 	<= desplaza_o2;

      when desplaza_o2 =>-----------------DESPLAZA_O2--------------

      p_registro <= registro(5 downto 0) & (registro(3) xor registro(6));
      p_estado   <= reposo;

    end case;


  end process;

end architecture;
