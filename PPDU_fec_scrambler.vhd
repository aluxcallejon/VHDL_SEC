----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:56:01 05/17/2020 
-- Design Name: 
-- Module Name:    PPDU_fec_scrambler - PPDU_fec_scrambler_arq 
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

entity PPDU_fec_scrambler is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           modulacion : in  STD_LOGIC_VECTOR(1 downto 0);
           data_scrambler : out  STD_LOGIC;
           data_valido_scrambler : out  STD_LOGIC);
end PPDU_fec_scrambler;

architecture PPDU_fec_scrambler_arq of PPDU_fec_scrambler is

COMPONENT PPDU_fec
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		modulacion : IN std_logic_vector(1 downto 0);          
		salida1 : OUT std_logic;
		salida2 : OUT std_logic;
		dato_valido : OUT std_logic
		);
	END COMPONENT;
	
	COMPONENT scrambler
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		o1 : IN std_logic;
		o2 : IN std_logic;
		data_valid : IN std_logic;          
		salida : OUT std_logic;
		dout_val : OUT std_logic
		);
	END COMPONENT;
	
	signal s1_fec, s2_fec,d_valido_fec : STD_LOGIC;

begin

Inst_PPDU_fec: PPDU_fec PORT MAP(
		clk => clk,
		reset => reset,
		modulacion => modulacion,
		salida1 => s1_fec,
		salida2 => s2_fec,
		dato_valido => d_valido_fec
	);
Inst_scrambler: scrambler PORT MAP(
	clk => clk,
	reset => reset,
	o1 => s1_fec,
	o2 => s2_fec,
	data_valid => d_valido_fec,
	salida => data_scrambler,
	dout_val => data_valido_scrambler
	);



end PPDU_fec_scrambler_arq;

