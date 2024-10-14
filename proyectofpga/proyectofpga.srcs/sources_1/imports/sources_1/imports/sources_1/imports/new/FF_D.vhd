----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2023 14:37:38
-- Design Name: 
-- Module Name: FF_D - Behavioral
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

entity FF_D is
 Port (Clear, Ck, D: IN STD_LOGIC; Q,Qn: OUT STD_LOGIC);
end FF_D;

architecture Behavioral of FF_D is
begin
    PROCESS(Clear, Ck)
    begin  
        IF Clear = '0' THEN 
            Q<='0';
            Qn<='0';
        ELSIF Ck'EVENT and Ck ='1' THEN 
            Q<= D;
            Qn<= not D; 
        END IF;
    END PROCESS;
end Behavioral;