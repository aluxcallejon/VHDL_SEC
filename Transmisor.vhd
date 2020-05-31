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
Start: in STD_LOGIC;
Modulacion: in STD_LOGIC_VECTOR;
xk_im: out STD_LOGIC_VECTOR(7 downto 0);
xk_re: out STD_LOGIC_VECTOR(7 downto 0);
xk_index: out STD_LOGIC_VECTOR(6 downto 0);
dataValid: out STD_LOGIC
);


end Transmisor;

architecture arquitectura of Transmisor is

COMPONENT ppd_fec_scrambler_interleaver
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		modulacion : IN std_logic_vector(1 downto 0);
		addrb : IN std_logic_vector(8 downto 0);
		ready : OUT std_logic;
		dout : OUT std_logic_vector(0 to 0);
		dir_que_escribo : OUT std_logic_vector(8 downto 0)
		);
	END COMPONENT;

	COMPONENT IFFT
  PORT (
    clk : IN STD_LOGIC;
    start : IN STD_LOGIC;
    unload : IN STD_LOGIC;
    cp_len : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
    cp_len_we : IN STD_LOGIC;
    xn_re : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    xn_im : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
    fwd_inv : IN STD_LOGIC;
    fwd_inv_we : IN STD_LOGIC;
    scale_sch : IN STD_LOGIC_VECTOR(13 DOWNTO 0);
    scale_sch_we : IN STD_LOGIC;
    rfd : OUT STD_LOGIC;
		rfs: OUT STD_LOGIC;
    xn_index : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    busy : OUT STD_LOGIC;
    edone : OUT STD_LOGIC;
    done : OUT STD_LOGIC;
    dv : OUT STD_LOGIC;
    xk_index : OUT STD_LOGIC_VECTOR(6 DOWNTO 0);
    cpv : OUT STD_LOGIC;
    xk_re : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
    xk_im : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
  );
END COMPONENT;




		COMPONENT mapper
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		Entrada : IN std_logic;
		Ready : IN std_logic;
		RFS : IN std_logic;
		Xn_re : OUT std_logic_vector(7 downto 0);
		Xn_im : OUT std_logic_vector(7 downto 0);
		TX : OUT std_logic;
		dir_interleaver : OUT std_logic_vector(8 downto 0)
		);
	END COMPONENT;
	
signal addrb : STD_LOGIC_VECTOR (8 downto 0);
signal xn_re,xn_im: STD_logic_vector(7 downto 0);
signal RFS,ready,tx_mapper,dout: STD_logic;

begin


	Inst_ppd_fec_scrambler_interleaver: ppd_fec_scrambler_interleaver PORT MAP(
		clk => clk,
		reset => reset,
		modulacion => modulacion,
		addrb =>addrb,
		ready => ready,
		dout(0) => dout
	);
	Inst_mapper: mapper PORT MAP(
		clk => clk,
		reset => reset,
		Entrada => dout,
		Ready => Ready,
		RFS => 	RFS,
		Xn_re => Xn_re,
		Xn_im => Xn_im,
		TX => TX_mapper,
		dir_interleaver => addrb --Direccion del Interleaver controlada por mapper
	);

	IFFT_instance : IFFT
  PORT MAP (
    clk => clk,
    start => TX_mapper,
  --  unload => unload,
    cp_len => "010000", --Prefijo ciclico a 16
    cp_len_we => '1',
    xn_re => xn_re,
    xn_im => xn_im,
    fwd_inv => '1', --Indica que vamos a hacer la inversa
    fwd_inv_we => '1',
		rfs=>rfs,
  --  scale_sch => scale_sch,
  --  scale_sch_we => scale_sch_we,
  --  rfd => rfd,
  --  xn_index => xn_index,
  --  busy => busy,
  --  edone => edone,
  --  done => done,
    dv => dataValid, --Salida correcta de IFFT
    xk_index => xk_index,
  --  cpv => cpv,--Nos indica que el bit que estamos transmitiendo es parte del prefijo ciclico
    xk_re => xk_re,
    xk_im => xk_im
  );


end arquitectura;
