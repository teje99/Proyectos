----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.05.2023 20:26:45
-- Design Name: 
-- Module Name: SelectorHyM - Behavioral
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

entity SelectorHyM is
Port (sel :IN std_logic_vector (10 downto 0);-- necesitas 11 switches para elegir la hora y minuto a poner, los 6 primeros los minutos los cuato siguientes para la hora y el ultimo para decir si es am o pm.
      Total : OUT std_logic_vector(16 downto 0)
);
end SelectorHyM;

architecture Behavioral of SelectorHyM is

 component Horas
        PORT(sel    : IN std_logic_vector(4 DOWNTO 0); 
             salida : OUT std_logic_vector(16 downto 0));
     END component;

for all: Horas use entity work.MuxH(Behavioral);

component Minutos
PORT(sel    : IN std_logic_vector(5 DOWNTO 0); 
             salida : OUT std_logic_vector(16 downto 0));
end component;

for all: Minutos use entity work.MuxMin(Behavioral);

component Sum
 Port (a, b : IN std_logic_vector(16 downto 0);
 salida : OUT std_logic_vector(16 downto 0)
  );
end component;

for all: sum use entity work.Sumador(Behavioral);

signal SaHoras: std_logic_vector(16 downto 0);
signal SaMinutos: std_logic_vector(16 downto 0);

begin

H0: Horas port map (sel(10 downto 6), SaHoras);-- este es un multiplexor de 5 entradas de seleccion y dependiendo de ello te saca una hora de 1 a 12 con los cuatro primeros switches y el 5º es para elegir si la hora es am o pm.
M0: Minutos port map (sel(5 downto 0), SaMinutos);-- este es un multiplexor de 6 entradas de seleccion y dependiendo de ello te saca minutos de 0 a 59 dependiendo de los seis switches que elijas.
S0: Sum port map(SaHoras, SaMinutos,Total);-- sumador que suma la hora elegida con los minutos y te da la hora total
end Behavioral;
