library IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

entity fsm_tb is
end;

architecture behavioral of fsm_tb is
	component fsm is
		port(
			Y : out STD_LOGIC_VECTOR(1 downto 0);
			CLK, RST , A : in STD_LOGIC
		);
	end component;
	
	signal CLK, RST , A : STD_LOGIC;
	signal Y : STD_LOGIC_VECTOR(1 downto 0);
	
	begin
	DUT : fsm port map(
		CLK => CLK,
		RST => RST,
		A => A,
		Y => Y
	);
	
	process begin
		CLK <= '0';
		wait for 5ns;
		CLK <= '1';
		wait for 5ns;
	end process;
	

	process begin
	    A <= '1';
	    RST <= '1';
	    wait for 10ns;
	    RST <='0';
	    wait for 10ns;
		A <= '0';
		wait for 10ns;
		A <= '1';
		wait for 20ns;
		A <= '0';
		wait for 10ns;
		A <= '1';
		wait for 60ns;
		A <= '0';
		wait;
	end process;
	
	
end behavioral;