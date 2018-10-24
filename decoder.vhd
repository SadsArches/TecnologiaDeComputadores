library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity decod is
    Port(
        Entries : in  STD_LOGIC_VECTOR (2 downto 0);
        Exits   : out STD_LOGIC_VECTOR (7 downto 0)
    );
end decod;

architecture Behavioral of decod is
    
begin
    Exits(0) <= (not Entries(2)) and (not Entries(1)) and (not Entries(0)); 
    Exits(1) <= (not Entries(2)) and (not Entries(1)) and Entries(0);
    Exits(2) <= (not Entries(2)) and Entries(1) and (not Entries(0));
    Exits(3) <= (not Entries(2)) and Entries(1) and Entries(0);
    Exits(4) <= Entries(2) and (not Entries(1)) and (not Entries(0)); 
    Exits(5) <= Entries(2) and (not Entries(1)) and Entries(0); 
    Exits(6) <= Entries(2) and Entries(1) and (not Entries(0)); 
    Exits(7) <= Entries(2) and Entries(1) and Entries(0); 
end Behavioral;