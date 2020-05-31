
-- VHDL Instantiation Created from source file ppd_fec_scrambler_interleaver.vhd -- 02:50:23 05/31/2020
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_ppd_fec_scrambler_interleaver: ppd_fec_scrambler_interleaver PORT MAP(
		clk => ,
		reset => ,
		modulacion => ,
		addrb => ,
		ready => ,
		dout => ,
		dir_que_escribo => 
	);


