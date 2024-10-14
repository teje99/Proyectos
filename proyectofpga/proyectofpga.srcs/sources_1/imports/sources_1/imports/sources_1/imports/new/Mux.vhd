----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2023 15:42:50
-- Design Name: 
-- Module Name: Mux - Behavioral
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

 ENTITY MuxH IS
        PORT(sel    : IN std_logic_vector(4 DOWNTO 0); 
             salida : OUT std_logic_vector(16 downto 0));
     END MuxH;

     ARCHITECTURE Behavioral OF MuxH IS
     BEGIN

       PROCESS (sel) IS
       BEGIN
         CASE sel IS
           WHEN "00000" => salida<="00000000000000000";--las 00 am
           WHEN "00001" => salida<="00000111000010000";
           WHEN "00010" => salida<="00001110000100000";
           WHEN "00011" => salida<="00010101000110000";
           WHEN "00100" => salida<="00011100001000000";
           WHEN "00101" => salida<="00100011001010000";
           WHEN "00110" => salida<="00101010001100000";
           WHEN "00111" => salida<="00110001001110000";
           WHEN "01000" => salida<="00111000010000000";
           WHEN "01001" => salida<="00111111010010000";
           WHEN "01010" => salida<="01000110010100000";
           WHEN "01011" => salida<="01001101010110000";--las 11 am
           WHEN "10000" => salida<="01010100011000000";--las 00 pm es decir las 12
           WHEN "10001" => salida<="01011011011010000";
           WHEN "10010" => salida<="01100010011100000";
           WHEN "10011" => salida<="01101001011110000";
           WHEN "10100" => salida<="01110000100000000";
           WHEN "10101" => salida<="01110111100010000";
           WHEN "10110" => salida<="01111110100100000";
           WHEN "10111" => salida<="10000101100110000";
           WHEN "11000" => salida<="10001100101000000";
           WHEN "11001" => salida<="10010011101010000";
           WHEN "11010" => salida<="10011010101100000";
           WHEN "11011" => salida<="10100001101110000";--las 11 pm es decir las 23
           WHEN OTHERS => salida <="11111111111111111";
         END CASE;
       END PROCESS;
     END Behavioral;
