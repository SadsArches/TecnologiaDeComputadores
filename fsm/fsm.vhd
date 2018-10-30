library IEEE;
USE IEEE.STD_LOGIC_1164.all;

entity fsm is
	port(
		Y : out STD_LOGIC_VECTOR(1 downto 0);
		CLK, RST , A : in STD_LOGIC
	);
	
end;

architecture Behavior of fsm is
	type state_type is (S0, S1, S2, S3);
	signal current_state, next_state : state_type;
	begin
	process(CLK, RST) begin
		if rising_edge(CLK) then
			if (RST = '1') then
				current_state <= S0;
			else
				current_state <= next_state;
			end if;
		end if;
	end process;
	
	process(current_state) begin
		case current_state is
			when S0 =>
				Y <= "00";
				if (A = '1') then
					next_state <= S1;
				else	
					next_state <= S0;
				end if;
			when S1 =>
				Y <= "00";
				if (A = '1') then
					next_state <= S2;
				else
					next_state <= S0;
				end if;
			when S2=>
				Y <= "10";
				if (A = '1') then
					next_state <= S3;
				else
					next_state <= S0;
				end if;
			when S3 =>
				Y <= "11";
				if(A='1') then
					next_state <= S3;
				else
					next_state <= S0;
				end if;
			when others =>
				Y <= "00";
				next_state <= S0;
		end case;
	end process;
end;