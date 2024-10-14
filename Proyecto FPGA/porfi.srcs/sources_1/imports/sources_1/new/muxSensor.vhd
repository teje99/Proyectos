----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2023 11:44:16
-- Design Name: 
-- Module Name: muxSensor - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity muxSensor is
Port ( a,b : in std_logic;
             sel    : IN std_logic_vector(15 downto 0); 
             salida : OUT std_logic);
end muxSensor;

architecture Behavioral of muxSensor is

begin
PROCESS (sel, a,b) IS
       BEGIN
         CASE sel IS
           WHEN "0000111111111111" => salida<=a;
           WHEN OTHERS => salida <=b;
         END CASE;
       END PROCESS;

end Behavioral;
