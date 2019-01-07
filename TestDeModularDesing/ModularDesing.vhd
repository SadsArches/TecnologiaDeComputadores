library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MEMORY is
	port(
		CLR, CLK : in STD_LOGIC;
		Q : out STD_LOGIC_VECTOR(7 downto 0);
		EMPTY : out STD_LOGIC
	);		
end MEMORY;

architecture structural of MEMORY is
	component SENDER is
		port(
			ENABLE, CLR, CLK : in STD_LOGIC;
			DATA : out STD_LOGIC_VECTOR(7 downto 0);
			VALID : out STD_LOGIC
		);
	end component;
	component STORAGE is
		port(
			CLR, WE CLK : in STD_LOGIC;
			DATA : in STD_LOGIC_VECTOR(7 downto 0);
			FULL, EMPTY : out STD_LOGIC;
			Q : out STD_LOGIC_VECTOR(7 downto 0)
		);
	end component;
	signal INT_DATA : STD_LOGIC_VECTOR(7 downto 0);
	signal INT_VALID, INT_FULL : STD_LOGIC;
begin
	SENDER1 : SENDER port map(
		ENABLE => not INT_FULL,
		CLR => CLR,
		CLK => CLK,
		DATA => INT_DATA,
		VALID => INT_VALID
	);
		
	STORAGE1 : STORAGE port map(
		CLR => CLR,
		WE => INT_VALID,
		CLK => CLK,
		DATA =>INT_DATA,
		FULL=>INT_FULL,
		EMPTY=>EMPTY,
		Q=>Q
	);

	
	
end structural;
