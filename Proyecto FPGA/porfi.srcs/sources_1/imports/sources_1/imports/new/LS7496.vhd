----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 27.03.2023 17:51:07
-- Design Name: 
-- Module Name: LS7496 - Behavioral
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

entity LS7496 is
 Port (Ck : in std_logic; Load: IN std_logic_vector (16 downto 0); Load_out: OUT std_logic_vector (16 downto 0));
end LS7496;

architecture Behavioral of LS7496 is

COMPONENT Biest_D
   Port (Ck, D: IN STD_LOGIC; Q: OUT STD_LOGIC);
END COMPONENT;

FOR ALL: Biest_D USE ENTITY WORK.FF_D(Behavioral);

begin
B0: Biest_D PORT MAP (Ck, Load(0), Load_out(0));
B1: Biest_D PORT MAP (Ck, Load(1), Load_out(1));
B2: Biest_D PORT MAP (Ck, Load(2), Load_out(2));
B3: Biest_D PORT MAP (Ck, Load(3), Load_out(3));
B4: Biest_D PORT MAP (Ck, Load(4), Load_out(4));
B5: Biest_D PORT MAP (Ck, Load(5), Load_out(5));
B6: Biest_D PORT MAP (Ck, Load(6), Load_out(6));
B7: Biest_D PORT MAP (Ck, Load(7), Load_out(7));
B8: Biest_D PORT MAP (Ck, Load(8), Load_out(8));
B9: Biest_D PORT MAP (Ck, Load(9), Load_out(9));
B10: Biest_D PORT MAP (Ck, Load(10), Load_out(10));
B11: Biest_D PORT MAP (Ck, Load(11), Load_out(11));
B12: Biest_D PORT MAP (Ck, Load(12), Load_out(12));
B13: Biest_D PORT MAP (Ck, Load(13), Load_out(13));
B14: Biest_D PORT MAP (Ck, Load(14), Load_out(14));
B15: Biest_D PORT MAP (Ck, Load(15), Load_out(15));
B16: Biest_D PORT MAP (Ck, Load(16), Load_out(16));

end Behavioral;