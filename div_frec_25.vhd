----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:28:08 05/17/2020 
-- Design Name: 
-- Module Name:    div_frec_25 - div_frec_25_arq 
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity div_frec_25 is
	Generic(
			  MAX_CUENTA: integer := 25000);
    Port ( clk : in  STD_LOGIC;
           reset : in  STD_LOGIC;
           data_v : in  STD_LOGIC;
           sat : out  STD_LOGIC);

end entity;
architecture div_frec_25_arq of div_frec_25 is


--------SIGNALS-------------------------------------------------------------------

signal cuenta, p_cuenta: unsigned (15 downto 0);
signal p_sat: STD_LOGIC;
--constant MAX_CUENTA: integer := 50000;
--constant MAX_CUENTA_TEST: integer := 4096;

----------------------------------------------------------------------------------

begin

--------PROCESO SINCRONO----------------------------------------------------------

sinc: process(clk,reset)
	begin
		if (reset='1') then
			cuenta <= (others =>'0');
			sat	 <= '0';
		elsif (rising_edge(clk)) then
			cuenta <= p_cuenta;
			sat    <= p_sat;
		end if;
end process;

--------PROCESO COMBINACIONAL-----------------------------------------------------

comb: process(cuenta)
	begin
		if(data_v = '1') then
			if(cuenta = MAX_CUENTA) then
				p_cuenta <= (others =>'0');
				p_sat <= '1';
			else
				p_cuenta <= cuenta + 1;
				p_sat <= '0';
			end if;
		end if;
			
----------------------------------------------------------------------------------
		
end process;

end div_frec_25_arq;

