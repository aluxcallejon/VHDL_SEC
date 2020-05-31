
-- VHDL Instantiation Created from source file mapper.vhd -- 03:50:45 05/31/2020
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

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

	Inst_mapper: mapper PORT MAP(
		clk => ,
		reset => ,
		Entrada => ,
		Ready => ,
		RFS => ,
		Xn_re => ,
		Xn_im => ,
		TX => ,
		dir_interleaver => 
	);


