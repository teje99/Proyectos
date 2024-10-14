----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 23.05.2023 23:46:44
-- Design Name: 
-- Module Name: porfi_porfi - Behavioral
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

entity porfi_porfi is
--  Port ( );
end porfi_porfi;

architecture Behavioral of porfi_porfi is
component comedero
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
end component;

FOR ALL: comedero USE ENTITY WORK.mainn(Behavioral);


signal pt : std_logic; -- entrada señal movil
    signal    v_in1t : std_logic; -- entradas s
    signal    v_in2t : std_logic;
    signal    clkt : std_logic;
    signal    v_outt : std_logic_vector(15 downto 0);
    signal    GPIO_1t: std_logic_vector(3 downto 0); --motor
    signal    btnCt : std_logic;
    signal    swtt : std_logic_vector(15 downto 0);
begin
T1: comedero PORT MAP (pt, v_in1t, v_in2t, clkt, v_outt, GPIO_1t, btnCt, swtt(15 downto 0));
btnCt <='0','1' AFTER 8000000000 ns;
Reloj: PROCESS
    BEGIN
        WAIT FOR 5 ns; clkt<='1';
        WAIT FOR 5 ns; clkt<='0';
    END PROCESS Reloj;
 pt<='0','1' AFTER 20 ns, '0' AFTER 40ns, '1' AFTER 7040ms;
 v_in1t<='0','1' AFTER 10 ns, '0' AFTER 30ns;
 v_in2t<='0' AFTER 0ns;
swtt(15 downto 0)<="0000000000000000";
swtt(8 downto 3)<="111111" AFTER 3600ms;
swtt(1 downto 0)<="11" AFTER 3600ms;
swtt(10)<='0','1' AFTER 9000ms;
swtt(11)<='1' AFTER 7200ms, '0' AFTER 7204ms, '1' AFTER 9000ms, '0' AFTER 9004ms;
swtt(12)<='0','1' AFTER 7202ms, '0' AFTER 7204ms, '1' AFTER 9001ms, '0' AFTER 9004ms;

end Behavioral;
