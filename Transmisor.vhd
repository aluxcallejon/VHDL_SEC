----------------------------------------------------------------------------------
-- Company:
-- Engineer:
--
-- Create Date:    02:47:44 05/31/2020
-- Design Name:
-- Module Name:    Transmisor - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Transmisor is
port(
clk: in std_logic;
reset : IN std_logic;
Modulacion: in STD_LOGIC_VECTOR(1 downto 0);
Entrada_ifft_re: out std_logic_vector (7 DOWNTO 0);
Entrada_ifft_im: out std_logic_vector (7 DOWNTO 0);
Entrada_RAM_im: out std_logic_vector(7 downto 0);
Entrada_RAM_re:out std_logic_vector(7 downto 0);
Dir_mapper:out std_logic_vector(6 downto 0);
Xn_index:out STD_LOGIC_VECTOR(6 downto 0);
xk_im: out STD_LOGIC_VECTOR(15 downto 0);
xk_re: out STD_LOGIC_VECTOR(15 downto 0);
xk_index: out STD_LOGIC_VECTOR(6 downto 0);
dataValid: out STD_LOGIC
);


end Transmisor;

architecture arquitectura of Transmisor is

-------------------COMPONENTES----------------------------------------------------

-------------------PPDU_FEC_SCRAMBLER_INTERLEAVER----------

COMPONENT ppd_fec_scrambler_interleaver
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		modulacion : IN std_logic_vector(1 downto 0);
		addrb : IN std_logic_vector(8 downto 0);
		ready : OUT std_logic;
		dout : OUT std_logic_vector(0 downto 0)
		);
	END COMPONENT;
	
-------------------IFFT------------------------------------

	COMPONENT IFFT  
  PORT (          
    clk : IN STD_LOGIC;
    start : IN STD_LOGIC;
    unload : IN STD_LOGIC; --Decide que podemos sacar el valor ya por la salida(lo vamos a conectar a edone)
    cp_len : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    cp_len_we : IN STD_LOGIC;
    xn_re : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    xn_im : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    fwd_inv : IN STD_LOGIC; --Elegimos si FFT/IFFT
    fwd_inv_we : IN STD_LOGIC; --Permite que escribamos si FFT/IFFT  
    rfd : OUT STD_LOGIC;
    xn_index : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    edone : OUT STD_LOGIC;-- Nos indica un ciclo antes de terminar que ha terminado
 --  done : OUT STD_LOGIC; Nos indica que ha terminado justo en ese ciclo
    dv : OUT STD_LOGIC;   --El valor de salida es valido
    xk_index : OUT STD_LOGIC_VECTOR(6 DOWNTO 0); --Indice para los valores de salida
   --cpv : OUT STD_LOGIC;
    xk_re : OUT STD_LOGIC_VECTOR(15 DOWNTO 0); --Salida parte real
    xk_im : OUT STD_LOGIC_VECTOR(15 DOWNTO 0) -- Salida parte imaginaria
  );
END COMPONENT;

-------------------MAPPER----------------------------------

		COMPONENT mapper
	PORT(
		clk:     in STD_LOGIC;
  reset:   in STD_LOGIC;
  Entrada: in STD_LOGIC;
  Ready:   in STD_LOGIC;
  RFD:     in STD_LOGIC;
  modulacion: in STD_logic_vector(1 downto 0);
  Xn_re:   out std_logic_vector (7 DOWNTO 0);
  Xn_im:   out std_logic_vector (7 DOWNTO 0);
  TX:      out STD_LOGIC; --start del ifft
  Entrada_RAM_re: out STD_logic_vector(7 downto 0);
  Entrada_RAM_im: out STD_logic_vector(7 downto 0);
  dir_mapper: out STD_LOGIC_VECTOR(6 downto 0);
  dir_interleaver: out STD_LOGIC_VECTOR(8 downto 0)
		);
	END COMPONENT;

-----------------------------------------------------------
	
-------------------SIGNALS---------------------------------

signal addrb : STD_LOGIC_VECTOR (8 downto 0);
signal xn_re,xn_im: STD_logic_vector(7 downto 0);
signal RFD_IFFT,ready,tx_mapper,entrada_Mapper,unload: STD_logic;
signal Dato_out :STD_LOGIC_VECTOR(0 downto 0);

-----------------------------------------------------------

attribute box_type : string; 
attribute box_type of IFFT : component is "black_box"; 

begin
	Entrada_ifft_re<=xn_re;
		Entrada_ifft_im<=xn_im;
	entrada_Mapper<=dato_out(0);
	
-------------------INSTANCIACION PPDU_FEC_SCRAMBLER--------

	Inst_ppd_fec_scrambler_interleaver: ppd_fec_scrambler_interleaver PORT MAP(
		clk => clk,
		reset => reset,
		modulacion => modulacion,
		addrb =>addrb,
		ready => ready,
		dout => dato_out
	);
	
-------------------INSTANCIACION MAPPER--------------------
	
	Inst_mapper: mapper 
	PORT MAP(
		clk => clk,
		reset => reset,
		Entrada =>Entrada_mapper ,
		Ready => Ready,
		RFD => RFD_IFFT,
		Xn_re => Xn_re,
		Xn_im => Xn_im,
		modulacion=>modulacion,
		Entrada_RAM_re=>Entrada_RAM_re,
      Entrada_RAM_im=>Entrada_RAM_im,
      dir_mapper=>Dir_mapper,
		TX => TX_mapper,
		dir_interleaver => addrb --Direccion del Interleaver controlada por mapper
	);
	
-------------------INSTANCIACION IFFT----------------------

	IFFT_instance : IFFT
  PORT MAP (
    clk => clk,
    start => TX_mapper,
    unload => unload, --entrada con la que controlamos la salida,no saca valores hasta que este a 1
    cp_len => "0010000", --Prefijo ciclico a 16
    cp_len_we => '1',
    xn_re => xn_re,
    xn_im => xn_im,
    fwd_inv => '1', --Indica que vamos a hacer la inversa
    fwd_inv_we => '1',
    rfd => rfd_IFFT,
    xn_index => xn_index,
    edone =>unload , --Nos aseguramos que justo al terminar,el siguiente ciclo mandamos a sacar los datos
  --  done => done,
    dv => dataValid, --Salida correcta de IFFT
    xk_index => xk_index,
  --  cpv => cpv,--Nos indica que el bit que estamos transmitiendo es parte del prefijo ciclico
    xk_re => xk_re,
    xk_im => xk_im
  );


end arquitectura;
