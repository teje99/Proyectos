----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2023 18:54:16
-- Design Name: 
-- Module Name: SalidaComp - Behavioral
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

entity SalidaComp is
port (reloj, entrada, rst : in std_logic;
       salida : out std_logic
     );
end SalidaComp;

architecture Behavioral of SalidaComp is

component seg
port (clk1, clr : in std_logic;
       clk : out std_logic
     );
end component;

for all: seg use entity work.digi_clk(Behavioral);

component seg15 
port (clk, din, clr : in std_logic;
       sout : out std_logic
     );
end component;

for all: seg15 use entity work.Cont15sg(Behavioral);

signal Clk: std_logic;


begin
S0: seg port map(reloj, rst, Clk);
C0: seg15 port map(Clk, entrada, rst, salida);


end Behavioral;
