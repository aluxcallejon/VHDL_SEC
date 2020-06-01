----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:10:13 05/17/2020 
-- Design Name: 
-- Module Name:    Transmisor - Transmisor_ARQ 
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

entity PPDU_fec is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           modulacion : in  STD_LOGIC_VECTOR(1 DOWNTO 0);
           salida1 : out  STD_LOGIC;
			  salida2 : out  STD_LOGIC;
			  dato_valido : out  STD_LOGIC);
end PPDU_fec;

architecture PPDU_fec_arq of PPDU_fec is

component PPDU 
    Port ( clk 			: in   STD_LOGIC;
           reset 			: in   STD_LOGIC;
           modulacion 	: in   STD_LOGIC_VECTOR(1 DOWNTO 0);
           data_valido 	: out  STD_LOGIC;
           data 			: out  STD_LOGIC;
           fin_tx 		: out  STD_LOGIC);
end component;

component fec 
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
end component;



signal datavalido, dataout, fintx : STD_LOGIC;

begin

	Inst_PPDU: PPDU PORT MAP(
		clk => clk,
		reset => reset,
		modulacion => modulacion,
		data_valido => datavalido,
		data => dataout,
		fin_tx => fintx
	);
	
	Inst_fec: fec PORT MAP(
		clk => clk,
		reset => reset,
		data_valido =>datavalido ,
		fin_tx => fintx,
		data => dataout,
		o1 => salida1,
		o2 => salida2,
		dout_val => dato_valido 
	);


end PPDU_fec_arq;


