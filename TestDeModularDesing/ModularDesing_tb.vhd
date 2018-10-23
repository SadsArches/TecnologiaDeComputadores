--librerias

entity tb.MEMORY is
end tb.MEMORY;

architecture behavior of tb.MEMORY is
	component MEMORY is
	port(CLK,CLR,: in STD_LOGIC;
	EMPTY:out STD_LOGIC;
	Q : out STD_LOGIC_VECTOR(7 downto 0);
	);
	end component;
	
	signal CLK, ClR, EMPTY : STD_LOGIC;
	signal Q: STD_LOGIC_VECTOR(7 downto 0);
	
	begin
	
	DUT : MEMORY port map(CLK,ClR,EMPTY;Q);
	
	process begin
		CLK <= '0'; wait for 5ns;
		CLK <= '0'; wait for 5ns;
	end process;
	
	
	process begin
		CLR <= '0'; wait for 10ns;
		ClR <= '0'; wait for 10ns;
		ClR <= '0'; wait;
	end process;