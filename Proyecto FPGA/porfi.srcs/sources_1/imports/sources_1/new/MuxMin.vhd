----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2023 22:26:34
-- Design Name: 
-- Module Name: MuxMin - Behavioral
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

entity MuxMin is
PORT(sel    : IN std_logic_vector(5 DOWNTO 0); 
             salida : OUT std_logic_vector(16 downto 0));
end MuxMin;

architecture Behavioral of MuxMin is

begin
PROCESS (sel) IS
       BEGIN
         CASE sel IS
           WHEN "000000" => salida<="00000000000000000";--0
           WHEN "000001" => salida<="00000000000111100";--1
           WHEN "000010" => salida<="00000000001111000";--2
           WHEN "000011" => salida<="00000000010110100";--3
           WHEN "000100" => salida<="00000000011110000";--4
           WHEN "000101" => salida<="00000000100101100";--5
           WHEN "000110" => salida<="00000000101101000";--6
           WHEN "000111" => salida<="00000000110100100";--7
           WHEN "001000" => salida<="00000000111100000";--8
           WHEN "001001" => salida<="00000001000011100";--9
           WHEN "001010" => salida<="00000001001011000";--10
           WHEN "001011" => salida<="00000001010010100";--11
           WHEN "001100" => salida<="00000001011010000";--12
           WHEN "001101" => salida<="00000001100001100";--13
           WHEN "001110" => salida<="00000001101001000";--14
           WHEN "001111" => salida<="00000001110000100";--15
           WHEN "010000" => salida<="00000001111000000";--16
           WHEN "010001" => salida<="00000001111111100";--17
           WHEN "010010" => salida<="00000010000111000";--18
           WHEN "010011" => salida<="00000010001110100";--19
           WHEN "010100" => salida<="00000010010110000";--20
           WHEN "010101" => salida<="00000010011101100";--21
           WHEN "010110" => salida<="00000010100101000";--22
           WHEN "010111" => salida<="00000010101100100";--23
           WHEN "011000" => salida<="00000010110100000";--24
           WHEN "011001" => salida<="00000010111011100";--25
           WHEN "011010" => salida<="00000011000011000";--26
           WHEN "011011" => salida<="00000011001010100";--27
           WHEN "011100" => salida<="00000011010010000";--28
           WHEN "011101" => salida<="00000011011001100";--29
           WHEN "011110" => salida<="00000011100001000";--30
           WHEN "011111" => salida<="00000011101000100";--31
           WHEN "100000" => salida<="00000011110000000";--32
           WHEN "100001" => salida<="00000011110111100";--33
           WHEN "100010" => salida<="00000011111111000";--34
           WHEN "100011" => salida<="00000100000110100";--35
           WHEN "100100" => salida<="00000100001110000";--36
           WHEN "100101" => salida<="00000100010101100";--37
           WHEN "100110" => salida<="00000100011101000";--38
           WHEN "100111" => salida<="00000100100100100";--39
           WHEN "101000" => salida<="00000100101100000";--40
           WHEN "101001" => salida<="00000100110011100";--41
           WHEN "101010" => salida<="00000100111011000";--42
           WHEN "101011" => salida<="00000101000010100";--43
           WHEN "101100" => salida<="00000101001010000";--44
           WHEN "101101" => salida<="00000101010001100";--45
           WHEN "101110" => salida<="00000101011001000";--46
           WHEN "101111" => salida<="00000101100000100";--47
           WHEN "110000" => salida<="00000101101000000";--48
           WHEN "110001" => salida<="00000101101111100";--49
           WHEN "110010" => salida<="00000101110111000";--50
           WHEN "110011" => salida<="00000101111110100";--51
           WHEN "110100" => salida<="00000110000110000";--52
           WHEN "110101" => salida<="00000110001101100";--53
           WHEN "110110" => salida<="00000110010101000";--54
           WHEN "110111" => salida<="00000110011100100";--55
           WHEN "111000" => salida<="00000110100100000";--56
           WHEN "111001" => salida<="00000110101011100";--57
           WHEN "111010" => salida<="00000110110011000";--58
           WHEN "111011" => salida<="00000110111010100";--59
           WHEN OTHERS => salida <="11111111111111111";
         END CASE;
       END PROCESS;

end Behavioral;
