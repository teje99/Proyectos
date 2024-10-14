library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity Comparador is
    Port (a,b : in std_logic_vector(16 downto 0);
    menor,igual,mayor : out std_logic);
end Comparador;

architecture Behavioral of Comparador is

begin
    igual <= '1' when (a = b) else '0';
    mayor <= '1' when (a > b) else '0';
    menor <= '1' when (a < b) else '0';


end Behavioral;