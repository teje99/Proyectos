----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2023 14:20:47
-- Design Name: 
-- Module Name: digi_clk - Behavioral
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

entity digi_clk is
port (clk1, clr : in std_logic;
       clk : out std_logic
     );
end digi_clk;

architecture Behavioral of digi_clk is

signal count : integer :=0;
signal b : std_logic :='0';
begin

 --clk generation.For 100 MHz clock this generates 1 Hz clock.
process(clr ,clk1) 
begin
if(clr = '0') then
b<= '0';
count<=0;
elsif(rising_edge(clk1)) then
count <=count+1;
if(count = 50000000-1) then
b <= not b;
count <=0;

end if;
end if;
clk<=b;
end process;

end Behavioral;
