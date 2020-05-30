----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:41 05/18/2020 
-- Design Name: 
-- Module Name:    ppd_fec_scrambler_interleaver - Behavioral 
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

entity ppd_fec_scrambler_interleaver is
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           modulacion : in  STD_LOGIC_VECTOR (1 downto 0);
			  addrb: 		in std_logic_vector (8 downto 0);
           ready : out  STD_LOGIC;
           dout : out  std_logic_vector (0 DOWNTO 0);
			  dir_que_escribo: out std_logic_vector (8 downto 0)
			  );
end ppd_fec_scrambler_interleaver;

architecture Behavioral of ppd_fec_scrambler_interleaver is

	COMPONENT PPDU_fec_scrambler
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		modulacion : IN std_logic_vector(1 downto 0);          
		data_scrambler : OUT std_logic;
		data_valido_scrambler : OUT std_logic
		);
	END COMPONENT;
	
		COMPONENT interleaver
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		data : IN std_logic;
		data_valid : IN std_logic;
		addrb : IN std_logic_vector(8 downto 0);          
		Ready : OUT std_logic;
		data_out : OUT std_logic_vector(0 to 0);
		dir_que_escribo: out std_logic_vector (8 downto 0)
		);
	END COMPONENT;
	
	signal data_scrambler, data_valido_scrambler: std_logic;

begin


Inst_PPDU_fec_scrambler: PPDU_fec_scrambler PORT MAP(
		clk => clk,
		reset => reset,
		modulacion => modulacion,
		data_scrambler => data_scrambler,
		data_valido_scrambler => data_valido_scrambler 
	);

	Inst_interleaver: interleaver PORT MAP(
		clk => clk,
		reset => reset,
		data => data_scrambler,
		data_valid => data_valido_scrambler,
		addrb => addrb,
		Ready => Ready,
		data_out => dout,
		dir_que_escribo => dir_que_escribo	
	);

end Behavioral;

