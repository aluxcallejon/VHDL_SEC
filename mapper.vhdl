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
entity mapper is
  GENERIC(

  Nbpc: integer := 3

  );
  port (
  clk:     in STD_LOGIC;
  reset:   in STD_LOGIC;
  Entrada: in STD_LOGIC;
  Ready:   in STD_LOGIC;
  RFS:     in STD_LOGIC;
  Xn_re:   out std_logic_vector (7 DOWNTO 0);
  Xn_im:   out std_logic_vector (7 DOWNTO 0);
  TX:      out STD_LOGIC; --start del ifft
  dir_interleaver: out STD_LOGIC_VECTOR(8 downto 0)
  );
end entity;



architecture arch of mapper is

---------SIGNALS---------------------------------------------------------------

  type status is (Reposo, Agrupar, Calcula_symb, Calcula_datos, escribe_RAM, Transmite);
  signal estado,  p_estado   : status;
  signal p_xn_im, p_xn_re : std_logic_vector (7 downto 0);
  signal p_xn_im_RAM, p_xn_re_RAM : std_logic_vector (7 downto 0);
  signal xn_im_RAM, xn_re_RAM : std_logic_vector (7 downto 0);
  signal aux_xn_im,aux_xn_re : std_logic_vector(7 downto 0);
  signal simbolo, p_simbolo : std_logic_vector(2 downto 0):="000";
  signal group_cont,p_group_cont:integer range 0 to 2;
  signal wea,p_wea: STD_LOGIC_VECTOR (0 DOWNTO 0);
  signal dina,p_dina:STD_LOGIC_VECTOR(15 DOWNTO 0);
  signal addra,p_addra:STD_LOGIC_VECTOR(6 DOWNTO 0):= "0001111";
  signal douta: STD_LOGIC_VECTOR (15 downto 0);
  signal p_dir_interleaver, dir_interleaver_aux: std_logic_vector (8 downto 0);
  signal phase, p_phase: std_logic_vector (2 downto 0);
  signal phase_ant, p_phase_ant: std_logic_vector (2 downto 0);
  signal Abk, p_Abk: std_logic_vector (2 downto 0);
  signal p_tx: STD_LOGIC;




-------------------------------------------------------------------------------



  COMPONENT RAM_mapper
 PORT (
   clka : IN STD_LOGIC;
   wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
   addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0); -- 128 direcciones que le llegaran a la IFFT
   dina : IN STD_LOGIC_VECTOR(15 DOWNTO 0); -- fase codificada que viene de rom_grande
   douta : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- 16 bits que se envian a la IFFT
 );
END COMPONENT;


-------------------------------------------------------------------------------

begin

 dir_interleaver <= dir_interleaver_aux;
 xn_re<=aux_xn_re;
 xn_im<=aux_xn_im;
  ------------- Begin Cut here for INSTANTIATION Template ----- INST_TAG
  ROM : RAM_mapper
    PORT MAP (
      clka => clk,
      wea => wea,
      addra => addra,
      dina => dina,
      douta => douta
    );


---------PROCESO SINCRONONO------------------------------------------------------

 sinc : process(clk, reset)
 begin

   if (reset = '1') then
     estado <= reposo;
     simbolo <= "000"; -- Asi podemos extrapolar la d8psk a las demas. Escribimos siempre desde la direccion mas significativa y
     -- las que quedan se ponen a 0. De esa forma, se puede usar la constelacion de la 8psk para modular las demas.

     group_cont <= 0;
     wea(0)   <= '0';
     dina  <= "0000000000000000";
     addra <= "0001111";
     Xn_im_RAM <= (others => '0');
     Xn_re_RAM <= (others => '0');
	  aux_Xn_im <= (others => '0');
     aux_Xn_re <= (others => '0');
     dir_interleaver_aux <= (others => '0');
     phase <= "100";
     phase_ant <= "100";
     tx <= '0';
     Abk <= (others => '0');


   elsif (clk'event and clk = '1') then

     estado     <= p_estado;
     simbolo    <= p_simbolo; -- que coja los Nbpc ultimos. Es la de referencia
     group_cont <= p_group_cont;
     wea        <= p_wea;
     dina       <= p_dina;
     addra      <= p_addra;
     aux_Xn_im  <= p_xn_im;
     aux_Xn_re  <= p_xn_re;
	  Xn_im_RAM  <= p_xn_im_RAM;
     Xn_re_RAM  <= p_xn_re_RAM;
     TX         <= p_TX;
     dir_interleaver_aux <= p_dir_interleaver;
     phase      <= p_phase;
     phase_ant  <= p_phase_ant;
     Abk        <= p_Abk;



   end if;

 end process;

---------MAQUINA DE ESTADOS----------------------------------------------------

fsm : process(Ready,douta,dir_interleaver_aux,simbolo,Abk,phase,RFS,group_cont,addra,estado,dina,aux_xn_im,aux_xn_re,xn_im_RAM,xn_re_RAM,phase_ant,Entrada)
begin

       p_estado     <= reposo;
       p_simbolo    <= simbolo; -- que coja los Nbpc ultimos. Es la de referencia
       p_group_cont <= group_cont;
       p_wea(0)     <= '0';
       p_dina       <= dina;
       p_addra      <= addra;

       p_Xn_im      <= aux_xn_im;
       p_Xn_re      <= aux_xn_re;
		 p_Xn_im_RAM <= xn_im_RAM;
       p_Xn_re_RAM <= xn_re_RAM;
       p_TX         <= '0';
       p_dir_interleaver <= dir_interleaver_aux;
       p_phase      <= phase;
       p_phase_ant  <= phase_ant;
       p_Abk        <= Abk;


   case estado is

  when Reposo    =>-------------REPOSO-------------------------
  if(Ready='1') THEN
    p_estado<=Agrupar;

  end if;

   when Agrupar   =>------------AGRUPAR-------------------------
   if(dir_interleaver_aux = 96*Nbpc-1) then --Obtenemos los 96 bits
    if(RFS='1') then
           p_group_cont <= 0;
           p_estado     <= Transmite;
           p_addra      <= "0000000";
           p_dir_interleaver <= (others => '0');
    end if;
   else

     p_simbolo(2-p_group_cont)<=Entrada;  -- as lo escribimos desde el mas significativo al menos significativo
     p_group_cont<=group_cont+1;
     p_dir_interleaver <= dir_interleaver_aux + '1';

       if(group_cont=(Nbpc-1))  then --Si hemos terminado de agrupar Nbpc bits,vamos a calcular el valor de la portadora

         p_estado<=Calcula_symb;
         p_group_cont<=0;

       end if;

   end if;


   when Calcula_symb =>------------CALCULA_SYMB-------------------------

   case( Nbpc ) is

          when 1 => ---------------MODULACION DBPSK---------------------

           if (simbolo (2) = '1') then -- si estamos usando una BPSK y hemos escrito un 1
             p_Abk <= "100"; -- el simbolo equivalente a '1' en la 8PSK es '110', que se encuentra en la direccion 4 de la ROM

           elsif (simbolo(2) = '0') then -- en ese caso seria un 0
             p_Abk<= "000"; -- el simbolo equivalente a '0' en la 8PSK es '000' y se encuentra en la diireccion 0 de la ROM

           end if;

         when 2 => ---------------MODULACION DQPSK---------------------

           if (simbolo (2 downto 1) = "00") then
           p_Abk <= "000"; --el equivalente al simbolo '00' en la 8PSK es '000' que se encuentra en la direccion 0 de la ROM

           elsif (simbolo(2 downto 1) = "01") then
           p_Abk <= "010"; --el equivalente al simbolo '01' en la 8PSK es '011' que se encuentra en la direccion 2 de la ROM

           elsif (simbolo(2 downto 1) = "11") then
           p_Abk <= "100"; --el equivalente al simbolo '11' en la 8PSK es '110' que se encuentra en la direccion 4 de la ROM

           else
           p_Abk <= "110"; --el equivalente al simbolo '10' en la 8PSK es '101' que se encuentra en la direccion 6 de la ROM

           end if;


          when others => ---------------MODULACION D8PSK---------------------

          if (simbolo = "000") then
            p_Abk <= "000";

          elsif (simbolo = "001") then
            p_Abk <= "001";

          elsif (simbolo = "011") then
            p_Abk <= "010";

          elsif (simbolo = "010") then
            p_Abk <= "011";

          elsif (simbolo = "110") then
            p_Abk <= "100";

          elsif (simbolo = "111") then
            p_Abk <= "101";

          elsif (simbolo = "101") then
            p_Abk <= "110";

          ELSE
            p_Abk <= "111";

         END IF;



        end case;

          p_phase <= phase_ant + Abk; -- si tiene que desbordar, desborda porque son std_logic_vector
          p_estado <= Calcula_datos;


    when Calcula_datos =>--------------CALCULA_DATOS----------------------------

       case( phase ) is

         when "000" =>
            p_xn_im_RAM<="00000000";-- 0
            p_xn_re_RAM<="01100100";-- 100

         when "001" =>
            p_xn_im_RAM<="01000110";-- 70
            p_xn_re_RAM<="01000110";-- 70

         when "010" =>
            p_xn_im_RAM<="01100100";-- 100
            p_xn_re_RAM<="00000000";-- 0

         when "011" =>
            p_xn_im_RAM<="01000110";--  70
            p_xn_re_RAM<="10111010";-- -70

         when "100" =>
            p_xn_im_RAM<="00000000";--     0
            p_xn_re_RAM<="10011100";--  -100


         when "101" =>
            p_xn_im_RAM<="10111010";--  -70
            p_xn_re_RAM<="10111010";--  -70

         when "110" =>
            p_xn_im_RAM<="10011100";-- -100
            p_xn_re_RAM<="00000000";--    0

         when others =>
            p_xn_im_RAM<="10111010";-- -70
            p_xn_re_RAM<="01000110";--  70


       end case;

      p_phase_ant<=phase;
      p_estado <= escribe_RAM;

  when escribe_RAM =>------------------ESCRIBE_RAM------------------------------
      p_wea(0)   <='1';
      p_dina  <= xn_re_RAM & xn_im_RAM; -- concatenacion
      p_addra <= addra + '1';
      p_estado <= reposo;


    when Transmite =>------------------TRANSMITE--------------------------------

      P_TX<='1';
      p_xn_re <= douta (15 downto 8);
      p_xn_im <= douta (7 downto 0);
      p_addra <= addra +'1';
    if (addra = "1111111") then
      p_addra <= "0001111";
      p_estado <= reposo;


    end if;


  end case;
end process;

----------------------------------------------------------------------------------

end architecture;
