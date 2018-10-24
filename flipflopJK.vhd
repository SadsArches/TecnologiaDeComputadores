library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity flip_flop_jk is
    Port (
        J, K, CLK : in STD_LOGIC;
        Q : out STD_LOGIC
    );
end flip_flop_jk;

architecture Behavioral of flip_flop_jk is
    signal temp : STD_LOGIC;
begin
    
    process (CLK) begin 
        if (rising_edge(CLK)) then
            if (J = '0' and K = '0') then
                temp <= temp;
            elsif (J = '1' and K = '0') then
                temp <= '1';
            elsif (J = '0' and K = '1') then
                temp <= '0';
            else
                temp <= not temp;
            end if;
        else
            temp <= temp;
        end if;
    end process;
    Q <= temp;
end Behavioral;