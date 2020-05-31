
-- VHDL Instantiation Created from source file interleaver.vhd -- 18:53:02 05/30/2020
--
-- Notes: 
-- 1) This instantiation template has been automatically generated using types
-- std_logic and std_logic_vector for the ports of the instantiated module
-- 2) To use this template to instantiate this entity, cut-and-paste and then edit

	COMPONENT interleaver
	PORT(
		clk : IN std_logic;
		reset : IN std_logic;
		data : IN std_logic;
		data_valid : IN std_logic;
		addrb : IN std_logic_vector(8 downto 0);          
		Ready : OUT std_logic;
		data_out : OUT std_logic_vector(0 to 0);
		dir_que_escribo : OUT std_logic_vector(8 downto 0)
		);
	END COMPONENT;

	Inst_interleaver: interleaver PORT MAP(
		clk => ,
		reset => ,
		data => ,
		data_valid => ,
		addrb => ,
		Ready => ,
		data_out => ,
		dir_que_escribo => 
	);


