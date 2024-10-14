----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.05.2023 16:34:15
-- Design Name: 
-- Module Name: mainn - Behavioral
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

entity mainn is
  Port (
        p : in std_logic; -- entrada señal movil
        v_in1 : in std_logic; -- entradas s
        v_in2 : in std_logic;
        clk : in std_logic;
        v_out : out std_logic_vector(15 downto 0);
        GPIO_1: out std_logic_vector(3 downto 0); --motor
        btnC : in std_logic;
        swt : in std_logic_vector(15 downto 0)
        );
end mainn;

architecture Behavioral of mainn is

component conv
port(
v_in1: in std_logic;
v_in2: in std_logic;
clk: in std_logic;
v_out: out std_logic_vector(15 downto 0)
);
end component;

component mt is
PORT(clk	: in std_logic; -- 50 MHz
--  SW	: in std_logic_vector(2 downto 0); -- switches
  -- output
  GPIO_1: out std_logic_vector(3 downto 0);
--  entrada : in integer;
  p : in std_logic);
     END component;
     
component comparador is
PORT(a,b : in std_logic_vector(16 downto 0);
    menor,igual,mayor : out std_logic);
end component;

component SelectorHyM is
Port (sel :IN std_logic_vector (10 downto 0);
      Total : OUT std_logic_vector(16 downto 0)
);
end component;

component contador
port(
        clk : in STD_LOGIC;
		rst: in STD_LOGIC;
		hora: IN std_logic_vector (16 downto 0);
		sel : in STD_LOGIC_VECTOR(1 downto 0);
--		led : out STD_LOGIC_VECTOR(3 downto 0)
        sCont : out STD_LOGIC_VECTOR(16 downto 0)
);
end component;

component SalidaComp 
port (reloj, entrada, rst : in std_logic;
       salida : out std_logic
     );
end component;

for all: SelectorHyM use entity WORK.SelectorHyM(Behavioral);
for all: SalidaComp use entity WORK.SalidaComp(Behavioral);
for all: comparador use entity WORK.Comparador(Behavioral);
for all: mt use entity WORK.Motor(Behavioral);
for all: conv use entity WORK.conv(Behavioral);

signal out_ADC : std_logic_vector(15 downto 0);
signal ig,men,may : std_logic;

signal igD,menD,mayD : std_logic;
signal igA,menA,mayA : std_logic;
signal igC,menC,mayC : std_logic;

signal movilSensorHora : std_logic;
signal registroHora : std_logic; -- OR de contador y regsitros
signal sensorHora : std_logic; -- AND senial sensor y horas
signal Comparacion : std_logic;

signal salidaCont : std_logic_vector(16 downto 0);
signal hora : std_logic_vector(16 downto 0);

begin

conversor : conv port map(v_in1, v_in2, clk, out_ADC);
c1 : comparador port map("0"&out_ADC,"00000111111111111",men,ig,may);

selector: SelectorHyM port map (swt(10 downto 0), hora);
cont : contador port map(clk,salidaCont(16) and salidaCont(14) and salidaCont(12) and salidaCont(8) and salidaCont(7) ,hora, swt(12 downto 11), salidaCont);
                                         
desayuno : comparador port map(salidaCont,"00111000010000000",menD,igD,mayD); --08h 17 bits
comida : comparador port map(salidaCont,"01100010011100000",menA,igA,mayA); --14h
cena : comparador port map(salidaCont,"10010011101010000",menC,igC,mayC); --21h

motor : mt port map(clk, GPIO_1, movilSensorHora);


registroHora<=igD or igA or igC;
retenedor : SalidaComp port map(clk, registroHora, not btnC,Comparacion); 
sensorHora<=men and Comparacion;

--sensorHora<=men and hora;
movilSensorHora<=p or sensorHora;



v_out<=out_ADC;

end Behavioral;
