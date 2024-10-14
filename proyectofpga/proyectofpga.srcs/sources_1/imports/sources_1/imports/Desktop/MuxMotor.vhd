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

 ENTITY MuxM IS
        PORT(a,b : in integer;
             sel    : IN std_logic; 
             salida : OUT integer);
     END MuxM;

     ARCHITECTURE Behavioral OF MuxM IS
     BEGIN

       PROCESS (sel, a,b) IS
       BEGIN
         CASE sel IS
           WHEN '0' => salida<=a;
           WHEN '1' => salida<=b;
           WHEN OTHERS => salida <=0;
         END CASE;
       END PROCESS;
     END Behavioral;
