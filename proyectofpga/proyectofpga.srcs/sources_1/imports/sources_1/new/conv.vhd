----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.05.2023 19:49:22
-- Design Name: 
-- Module Name: conv - Behavioral
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
entity conv is
port(
v_in1: in std_logic;
v_in2: in std_logic;
clk: in std_logic;
v_out: out std_logic_vector(15 downto 0)
);
end conv;

architecture Behavioral of conv is

component xadc_wiz_0
port (
daddr_in : in STD_LOGIC_VECTOR (6 downto 0); -- Address bus for the dynamic reconfiguration port
den_in : in STD_LOGIC; -- Enable Signal for the dynamic reconfiguration port
di_in : in STD_LOGIC_VECTOR (15 downto 0); -- Input data bus for the dynamic reconfiguration port
dwe_in : in STD_LOGIC; -- Write Enable for the dynamic reconfiguration port
do_out : out STD_LOGIC_VECTOR (15 downto 0); -- Output data bus for dynamic reconfiguration port
drdy_out : out STD_LOGIC; -- Data ready signal for the dynamic reconfiguration port
dclk_in : in STD_LOGIC; -- Clock input for the dynamic reconfiguration port
reset_in : in STD_LOGIC; -- Reset signal for the System Monitor control logic
vauxp5 : in STD_LOGIC; -- Auxiliary Channel 5
vauxn5 : in STD_LOGIC;
busy_out : out STD_LOGIC; -- ADC Busy signal
channel_out : out STD_LOGIC_VECTOR (4 downto 0); -- Channel Selection Outputs
eoc_out : out STD_LOGIC; -- End of Conversion Signal
eos_out : out STD_LOGIC; -- End of Sequence Signal
alarm_out : out STD_LOGIC; -- OR'ed output of all the Alarms
vp_in : in STD_LOGIC; -- Dedicated Analog Input Pair
vn_in : in STD_LOGIC
);
end component;

signal eoc_outAUX :STD_LOGIC;
signal channel_outAUX :STD_LOGIC_VECTOR(4 downto 0);

begin

com1: xadc_wiz_0 port map(
"00"&channel_outAUX,eoc_outAUX,"0000000000000000",'0',v_out,open,clk,'0',v_in2,'0',open,channel_outAUX,eoc_outAUX,open,open,'0','0'

);
end Behavioral;