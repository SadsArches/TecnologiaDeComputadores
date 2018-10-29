library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flipflopD is
	port(
		CLK, RST, D : in STD_LOGIC;
		Q : out STD_LOGIC;
	);
end flipflopD;

architecture Behavioral of flipflopD is
	signal count : integer range 0 to 1000000000;
begin
	process (CLK) begin
		if (rising_edge(CLK)) then
			if (RST = '1') then
				Q <= '0';
			elsif (count = 1000000000) then
				count <= 0;
				Q <= D;
			else
				count <= count + 1;
			end if;
		end if;
	end process;
end Behavioral;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsm is
	port (
		CLK, RST, X : in STD_LOGIC;
		Y : out STD_LOGIC;
	);
end fsm;

architecture Behavioral of fsm is
	component flipflopD is
		port(
			CLK, RST, D : in STD_LOGIC;
			Q : out STD_LOGIC;
		);
	end component;
	signal CLK, RST : STD_LOGIC;
	signal Q, D : STD_LOGIC_VECTOR(1 downto 0);
begin
	flipflop0 : flipflopD port map (CLK => CLK, RST => RST, D => D(0), Q => Q(0));
	flipflop1 : flipflopD port map (CLK => CLK, RST => RST, D => D(1), Q => Q(1));
	process (CLK, RST, X) begin
		case (Q) is
			when "00" =>
				Y <= '0';
				if (X = '0') then
					D <= "10";
				else 
					D <= "01";
				end if;
			when "01" =>
				Y <= '1';
				if (X = '0') then
					D <= "10";
				else
					D <= "01";
				end if;
			when "10" =>
				Y <= '0';
				if (X = '0') then 
					D <= "10";
				else	
					D <= "01";
				end if;
			when others =>
				Y <= '0';
				D <= "00";
		end case;
	end process;
end Behavioral;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsmm is
	port (
		clk, rst, x : in STD_LOGIC;
		y : out STD_LOGIC;
	);
end fsmm;

architecture behavioral of fsmm is
	component flipflopD is
		port(
			CLK, RST, D : in STD_LOGIC;
			Q : out STD_LOGIC;
		);
	end component;
	signal clk, rst : std_logic;
	signal d , q : std_logic_vector(1 downto 0);
begin
	flipflop0 : flipflopD port map(CLK => clk, RST => rst, D => d(0), Q => q(0));
	flipflop1 : flipflopD port map(CLK => clk, RST => rst, D => d(1), Q => q(1));
	process (clk, rst, x) begin
		case (q) is
			when "00" =>
				if(x = '0') then
					y <= '1';
					d <= "01";
				else
					y <= '1';
					d <= "10";
				end if;
			when "01" =>
				if(x = '0') then
					y <= '0';
					d <= "01";
				else
					y <= '0';
					d <= "10";
				end if;
			when "10" =>
				if(x = '0') then
					y <= '1';
					d <= "00";
				else
					y <= '1';
					d <= "01";
				end if;
			when others =>
				y <= '0';
				d <= "00";
		end case;
	end process;
end behavioral;

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity fsmM is
	port (
		clk, rst, x : in STD_LOGIC;
		y : out STD_LOGIC;
	);
end fsmM;

architecture behavioral of fsmM is
	type state_type is(A, B, C);
	signal AS, NS : state_type;
begin
	process (clk) begin
		if(rising_edge(clk)) then
			if(rst = '1') then
				AS <= A;
			else
				AS <= NS;
			end if;
		end if;
	end process;
	process(clk, rst, x) begin
		case (AS) is
			when A =>
				if(x = '0') then 
					NS <= B;
					y <= '1';
				else
					NS <= C;
					y <= '1';
				end if;
			when B =>
				if(x = '0') then 
					NS <= B;
					y <= '0';
				else
					NS <= C;
					y <= '0';
				end if;
			when C =>
				if(x = '0') then 
					NS <= A;
					y <= '1';
				else
					NS <= B;
					y <= '1';
				end if;
			when others =>
				y <= '0';
				NS <= A;
		end case;
	end process;
end behavioral;