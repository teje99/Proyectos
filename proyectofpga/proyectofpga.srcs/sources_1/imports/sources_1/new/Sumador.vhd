----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 21.05.2023 16:29:03
-- Design Name: 
-- Module Name: Sumador - Behavioral
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

entity Sumador is
 Port (a, b : IN std_logic_vector(16 downto 0);
 salida : OUT std_logic_vector(16 downto 0)
  );
end Sumador;

architecture Behavioral of Sumador is



function sumar (Sum1: std_logic_vector; Sum2:std_logic_vector) return std_logic_vector is
variable acarreo : std_logic_vector(16 downto 0);
variable total : std_logic_vector(16 downto 0);
begin
total(0):= Sum1(0) xor Sum2(0);
acarreo(0) := Sum1(0) and Sum2(0);
for k in 1 to 16 loop
total(k):= ((Sum1(k) xor Sum2(k)) xor acarreo(k-1));
acarreo(k) := (((Sum1(k) and Sum2(k)) or (Sum1(k) and acarreo(k-1))) or (acarreo(k-1) and Sum2(k)));
end loop;
return total;
end sumar;
begin
salida<=sumar(a,b);
 end Behavioral;
