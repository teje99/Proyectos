----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 16.05.2023 19:12:02
-- Design Name: 
-- Module Name: mt - Behavioral
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
USE ieee.numeric_std.all;


entity Motor is 
port (
  clk	: in std_logic; -- 50 MHz
--  SW	: in std_logic_vector(2 downto 0); -- switches
  -- output
  GPIO_1: out std_logic_vector(3 downto 0);
--  entrada : in integer;
  p : in std_logic
);
end Motor;

architecture Behavioral of Motor is

component mux is
PORT(a,b : in integer;
             sel    : IN std_logic; 
             salida : OUT integer);
     END component;

for all: mux use entity WORK.MuxM(Behavioral);

  signal count	: integer;

begin

m1 : mux port map(0,720_000,p, count);

--pwm_speed_gen : process(SW) 
--begin

--  if (SW = " 000") then -- degree 1
--  	count	<= 0;        --300_000 when stepper motor is used.  4 8 16 ...
--  elsif (SW = "001") then -- degree 2
--  	count	<= 5_760_000;
--  elsif (SW = "010") then -- degree 3
--  	count	<= 2_880_000;
--  elsif (SW = "011") then -- degree 4
--  	count	<= 1_440_000;
--  elsif (SW = "100") then -- degree 5
--  	count	<= 720_000;
--  elsif (SW = "101") then -- degree 6
--  	count	<= 360_000;
--  end if;

--end process;

pwm_gen	: process(clk)
  variable cntr : integer := 0;
begin
  if (clk'event and clk = '1') then 
  	
  	cntr	:= cntr + 1;
  	
  	if (cntr < count*1/4) then
  		GPIO_1	<= "0001";
  	elsif (cntr < count*2/4) then
  		GPIO_1	<= "0010";
  	elsif (cntr < count*3/4) then
  		GPIO_1	<= "0100";
  	elsif (cntr < count*4/4) then
  		GPIO_1	<= "1000";
  	else
  		cntr	:= 0;
  	end if;
  
  end if;
end process;
	
end Behavioral;
