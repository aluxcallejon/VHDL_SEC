
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

entity PPDU is
    Port ( clk 			: in   STD_LOGIC;
           reset 			: in   STD_LOGIC;
           modulacion 	: in   STD_LOGIC_VECTOR(1 DOWNTO 0);
           data_valido 	: out  STD_LOGIC;
           data 			: out  STD_LOGIC;
           fin_tx 		: out  STD_LOGIC);
end PPDU;

architecture PPDU_ARQ of PPDU is

---------SIGNALS------------------------------------------------------------------

	 signal sat,p_sat				: STD_LOGIC;									--Variable de saturacion
    signal p_data, data_aux	: STD_LOGIC;									--Proximo dato a transmitir
    signal p_dat_valid			: STD_LOGIC;									--Indica si es valido el siguiente dato
    signal douta					: std_logic_vector(7 downto 0);			--Salida
    signal addra,p_addra		: std_logic_vector(6 downto 0);			--Direcciones
    signal cuenta, p_cuenta	: integer range 0 to 7; --2^3 - 1		--Variable que nos llevara la cuenta
    signal p_fin_tx				: STD_LOGIC;									--Signal que indica fin de transmision
    constant SAT_CUENTA			: integer :=7;									--Constante de saturaciom
    signal n_ceros,p_n_ceros	: integer range 0 to 255 := 0;								--Variable en la que almacenaremos el n ceros
	 signal cuenta_direccion	: STD_LOGIC_VECTOR(6 DOWNTO 0);			--Variable en la que llevaremos la direccion a leer
    type estados is (reposo,reset_ceros,cuenta_ceros,TX,TX_ceros);
    signal estado, p_estado: estados;
	 signal flag,p_flag			:STD_LOGIC := '0';


---------COMPONENTES--------------------------------------------------------------

-------------------ROM------------------------------

	COMPONENT ROM
	PORT (
		clka 	: IN  STD_LOGIC;
		addra : IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
		douta : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
	END COMPONENT;

-------------------DIV_FREC-------------------------

	COMPONENT div_frec is
	GENERIC(
	MAX_CUENTA:integer:=50000);
	PORT(
		clk 	: IN  STD_LOGIC;
		reset	: IN  STD_LOGIC;
		sat 	: OUT STD_LOGIC
	);
	END COMPONENT;

---------END_COMPONENTS-----------------------------------------------------------

begin

---------INSTANCIACIONES----------------------------------------------------------

-------------------ROM------------------------------
  ROM1 : ROM
  PORT MAP (
    clka  => clk,
    addra => cuenta_direccion,
    douta => douta
  );

 -------------------DIV_FREC-------------------------

  DIV : div_frec
  GENERIC MAP(
  MAX_CUENTA => 10
  )
  PORT MAP (
    clk   => clk,
    reset => reset,
    sat   => sat
  );

---------END_INSTANCIACIONES------------------------------------------------------

---------PROCESOS-----------------------------------------------------------------

data 	<= data_aux;	--Proceso en paralelo y nos ahorramos los errores de lectura de data
cuenta_direccion <= addra;

---------PROCESO SINCRONO---------------------------

tx_sinc : process(clk,reset)
  begin

    if (reset = '1') then
      data_aux   	<= '0';
      cuenta    	<=  0;
      addra     	<= (others => '0');
      data_valido <= '0';
      fin_tx    	<= '0';
      estado      <= reposo;
		flag        <= '0'; 		--Sirve para ver si hemos llegado al final de la transmision

		case modulacion is
			when "00"	=> n_ceros <= 42;
			when "01"	=> n_ceros <= 90;
			when "11"	=> n_ceros <= 138;
			when others => n_ceros <= 0;
		end case;

    elsif (rising_edge(clk)) then
      data_aux   	<= p_data;
      cuenta    	<= p_cuenta;
      addra     	<= p_addra;
      data_valido <= p_dat_valid;
      fin_tx    	<= p_fin_tx;
      n_ceros   	<= p_n_ceros;
      estado      <= p_estado;
		flag        <= p_flag;
	 end if;
end process;

---------MAQUINA DE ESTADOS----------------------

fsm : process(estado,n_ceros,cuenta,sat,douta,flag)
begin

  p_estado    <= estado;
  p_data      <= data_aux;
  p_cuenta    <= cuenta;
  p_dat_valid <= '0';
  p_fin_tx    <= '0';
  p_n_ceros   <= n_ceros;
  p_addra     <= addra;
  p_flag 	  <= flag;


case( estado ) is

  when reposo =>-------------------REPOSO--------------

  if (sat='1' and douta/="00000000") then

    p_estado<=reset_ceros;

  end if;

  if (sat='1' and douta="00000000" and flag = '0') then

    p_estado<=TX_ceros;

end if;

when reset_ceros =>-------------------RESET_CEROS--------------

  p_estado<=cuenta_ceros;
  if (n_ceros = 0 ) then
    case modulacion is
      when "00"	=>   p_n_ceros<= 48;
      when "01"	=>   p_n_ceros<= 96;
      when "11"	=>   p_n_ceros<= 144;
      when others =>   p_n_ceros<= 0;
    end case;
      
  end if;


when  cuenta_ceros=>-------------------CUENTA_CEROS--------------

  	p_n_ceros <= n_ceros - 1; --Decremento en uno el numero de ceros para rellenar
    p_estado <= TX;

  when  TX=>-------------------TX------------------

    p_dat_valid <= '1';
    p_estado <= reposo;

    if (cuenta /= 7) then
      p_data   <= douta(cuenta);
      p_cuenta <= cuenta + 1;

    else
      p_data   <= douta(cuenta);
      p_cuenta <= 0;
      p_addra  <= addra + '1';
    end if;


  when TX_ceros =>-------------------TX_CEROS--------------
	
	 p_estado <= reposo;
    if(n_ceros /= 0) then --Tenemos que rellenar con n_ceros
      p_n_ceros <= n_ceros - 1; --Decremento en uno
      p_dat_valid <= '1'; --El siguiente data es valido, aunque sea un cero
      p_data <= '0';
    else --n_ceros es 0 por lo que reiniciamos el contador para la proxima y salimos
      p_fin_tx <= '1';  --Hemos terminado la retransmision por lo que activamos senal.
		p_flag <= '1';
	 end if;
end case;

end process;

----------------------------------------------------------------------------------

end PPDU_ARQ;