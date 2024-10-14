----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2023 19:50:44
-- Design Name: 
-- Module Name: main - Behavioral
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

entity sensorMotor is
  Port ( v_in1 : in std_logic;
         v_in2 : in std_logic;
         clk : in std_logic;
         v_out : out std_logic_vector(15 downto 0);
         GPIO_1: out std_logic_vector(3 downto 0)
         );
end sensorMotor;

architecture Behavioral of sensorMotor is

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
PORT(a,b : in std_logic_vector(15 downto 0);
    menor,igual,mayor : out std_logic);
end component;


for all: comparador use entity WORK.Comparador(Behavioral);
for all: mt use entity WORK.Motor(Behavioral);

signal out_ADC : std_logic_vector(15 downto 0);
signal ig,men,may : std_logic;

begin

conversor : conv port map(v_in1, v_in2, clk, out_ADC);
motor : mt port map(clk, GPIO_1, men);
c1 : comparador port map(out_ADC,"0000111111111111",men,ig,may);


v_out<=out_ADC;

end Behavioral;
