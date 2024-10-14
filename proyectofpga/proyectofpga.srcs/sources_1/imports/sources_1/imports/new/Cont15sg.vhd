----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2023 17:55:01
-- Design Name: 
-- Module Name: Cont15sg - Behavioral
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

entity Cont15sg is
port (clk, din, clr : in std_logic;
       sout : out std_logic
     );
end Cont15sg;

architecture Behavioral of Cont15sg is


signal salida : std_logic;
signal count : integer :=0;
signal b : std_logic ;

begin
 --clk generation.For 100 MHz clock this generates 1 Hz clock.
process is
begin

b<=din;
sout<=b;
if(clr = '0') then
b<= '0';
count<=0;
elsif(b='1') then
if( rising_edge(clk))then
count <=count+1;
b<='1';
if(count = 15) then
b <=din;
count <=0;
end if;
end if;
end if;
end process;


end Behavioral;
