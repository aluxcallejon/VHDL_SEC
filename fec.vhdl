
----------------------------------------------------------------------------------
-- Company:
-- Engineer: Luis   Callejon  Reche
--				 Maria  Jaramillo Sojo
--				 Adrian Sanchez   Garcia
--
-- Create Date:    21:39:36 05/07/2020
-- Design Name:
-- Module Name:    FEC - FEC_ARQ
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

entity fec is
  port (
  clk:        in STD_LOGIC;
  reset:      in STD_LOGIC;
  data_valido:in STD_LOGIC;
  fin_tx:     in STD_LOGIC;
  data:       in  STD_LOGIC;
  o1:         out STD_LOGIC;
  o2:         out STD_LOGIC;
  dout_val:   out STD_LOGIC
  );
end entity;

architecture fec_arq of fec is

--------SIGNALS----------------------------------------------------------------

  signal registro, p_registro: std_logic_vector (6 downto 0);
  type estados is (reposo, desplaza, tx);
  signal estado, p_estado: estados;
  signal p_dout_val: STD_LOGIC;
  signal p_o1, p_o2, o1_aux, o2_aux: STD_LOGIC;
  --signal contador,p_contador: unsigned (9 downto 0);


-------------------------------------------------------------------------------

begin

	o1	<=	o1_aux;	--Asignacion en paralelo auxiliar
	o2 <= o2_aux;

---------PROCESO SINCRONO------------------------------------------------------

  sinc : process(clk,reset)
  begin

    if (reset = '1') then
      estado   	<= reposo;
      registro 	<= (others => '0');
      o1_aux      <= '0';
      o2_aux      <= '0';
      dout_val 	<= '0';
	--	contador		<= (others => '0');

    elsif (clk'event and clk = '1') then
      registro <= p_registro;
      estado   <= p_estado;
      o1_aux   <= p_o1;
      o2_aux   <= p_o2;
      dout_val <= p_dout_val;
		--contador	<= p_contador;

    end if;


  end process;

---------PROCESO COMBINACIONAL: MAQUINA DE ESTADOS--------------------------------

  fsm : process(registro, estado, o1_aux, o2_aux,fin_tx, data,data_valido)
  begin

---------POR DEFECTO---------

    p_estado 	<= estado;
    p_o1 		<= o1_aux;
    p_o2 		<= o2_aux;
    p_registro <= registro;
    p_dout_val <= '0';
	-- p_contador	<= contador;

-----------------------------

    case( estado ) is

      when reposo =>-------------------REPOSO------------------------

        if (data_valido = '1' and fin_tx = '0') then
          p_estado <= desplaza;

        END if;

      when desplaza =>-----------------DESPLAZA----------------------

          p_registro <= data & registro (6 downto 1);
          p_estado 	<= tx;

      when tx =>-----------------------TRANSMISION-------------------
			 --p_contador	<= contador+1;
          p_o1 		<= registro(0) xor registro (1) xor registro (3) xor registro (5) xor registro (6);
          p_o2 		<= registro(0) xor registro (3) xor registro (2) xor registro (6);
          p_dout_val <= '1';
          p_estado 	<= reposo;

    end case;

  end process;

-------------------------------------------------------------------------------

end architecture;
