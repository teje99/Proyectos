----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.04.2023 17:33:17
-- Design Name: 
-- Module Name: tutorial - Behavioral
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

library UNISIM;
use UNISIM.VComponents.all;

Entity contador Is
port (  clk : in STD_LOGIC;
		rst: in STD_LOGIC;
		hora: IN std_logic_vector (16 downto 0);
		sel : in STD_LOGIC_VECTOR(1 downto 0);-- dos entradas de seleccion una para elegir si contar o cargar una hora inical en la que empezar a contar, la otra la usamos como reloj asincrono.
        sCont : out STD_LOGIC_VECTOR(16 downto 0)
        );
end contador;

Architecture behavior of contador Is
   

component Mult 
        PORT(a, b: IN std_logic;
             sel    : IN std_logic; 
             salida : OUT std_logic);
END component;

FOR ALL: Mult USE ENTITY WORK.Mux2(Behavioral);

COMPONENT BiestD
    Port (Clear, Ck, D: IN STD_LOGIC; Q,Qn: OUT STD_LOGIC);
end COMPONENT;

FOR ALL: BiestD USE ENTITY WORK.FF_D(Behavioral);

COMPONENT Div_1HZ
port (clk1, clr : in std_logic; clk : out std_logic);
end COMPONENT;

FOR ALL: Div_1HZ USE ENTITY WORK.digi_clk(Behavioral);


Signal salidaQ : STD_LOGIC_VECTOR(16 downto 0);
Signal salidaQn : STD_LOGIC_VECTOR(16 downto 0);
Signal reset : STD_LOGIC:= not rst;
Signal HoraIni : STD_LOGIC_VECTOR(16 downto 0);
signal relojAux : STD_LOGIC_VECTOR(15 downto 0);
signal Din : STD_LOGIC_VECTOR(15 downto 0);
--Signal led_int : STD_LOGIC_VECTOR(3 downto 0);
signal selec: std_logic;
begin

selec<= sel(0);
--led<=led_int;
--Este es el contador de segundos que usamos para contalizar las horas del dia. Tenemos un divisor a 1Hz para el reloj de 100Mhz de la placa que luego añadimos sucesivos biestables D para hacer el contador. 
--El contador tiene varios multiplexores dos por cada biestable, uno para elegir si la entrada del biestable d es en paralelo para cargar una hora o para que siga en funcion contador, 
--el otro multiplexor es para que el reloj de todos los biestables sean sincronos a la hora de contar es decir el reloj del siguiente sea la salida negada del anterior, o que para cargar la hora elegida sea asincronos y funcione con un switch que tenemos elegido.
HoraIni<=hora;
D1Hz: Div_1HZ PORT MAP (clk, reset, salidaQ(0));
M0: Mult PORT MAP (salidaQ(0), HoraIni(0),selec, sCont(0));
salidaQn(0)<=not salidaQ(0);

M1: Mult PORT MAP (salidaQn(0), sel(1),selec, relojAux(0));
M2: Mult PORT MAP (salidaQn(1), HoraIni(1),selec, Din(0));
B0: BiestD PORT MAP (reset, relojAux(0), Din(0), salidaQ(1), salidaQn(1));
sCont(1)<= salidaQ(1);

M3: Mult PORT MAP (salidaQn(1), sel(1),selec, relojAux(1));
M4: Mult PORT MAP (salidaQn(2), HoraIni(2),selec, Din(1));
B1: BiestD PORT MAP (reset, relojAux(1), Din(1), salidaQ(2), salidaQn(2));
sCont(2)<= salidaQ(2);

M5: Mult PORT MAP (salidaQn(2), sel(1),selec, relojAux(2));
M6: Mult PORT MAP (salidaQn(3), HoraIni(3),selec, Din(2));
B2: BiestD PORT MAP (reset, relojAux(2), Din(2), salidaQ(3), salidaQn(3));
sCont(3)<= salidaQ(3);

M7: Mult PORT MAP (salidaQn(3), sel(1),selec, relojAux(3));
M8: Mult PORT MAP (salidaQn(4), HoraIni(4),selec, Din(3));
B3: BiestD PORT MAP (reset, relojAux(3), Din(3), salidaQ(4), salidaQn(4));
sCont(4)<= salidaQ(4);

M9: Mult PORT MAP (salidaQn(4), sel(1),selec, relojAux(4));
M10: Mult PORT MAP (salidaQn(5), HoraIni(5),selec, Din(4));
B4: BiestD PORT MAP (reset, relojAux(4), Din(4), salidaQ(5), salidaQn(5));
sCont(5)<= salidaQ(5);

M11: Mult PORT MAP (salidaQn(5),sel(1),selec, relojAux(5));
M12: Mult PORT MAP (salidaQn(6), HoraIni(6),selec, Din(5));
B5: BiestD PORT MAP (reset, relojAux(5), Din(5), salidaQ(6), salidaQn(6));
sCont(6)<= salidaQ(6);

M13: Mult PORT MAP (salidaQn(6), sel(1),selec, relojAux(6));
M14: Mult PORT MAP (salidaQn(7), HoraIni(7),selec, Din(6));
B6: BiestD PORT MAP (reset, relojAux(6), Din(6), salidaQ(7), salidaQn(7));
sCont(7)<= salidaQ(7);

M15: Mult PORT MAP (salidaQn(7), sel(1),selec, relojAux(7));
M16: Mult PORT MAP (salidaQn(8), HoraIni(8),selec, Din(7));
B7: BiestD PORT MAP (reset, relojAux(7), Din(7), salidaQ(8), salidaQn(8));
sCont(8)<= salidaQ(8);

M17: Mult PORT MAP (salidaQn(8), sel(1),selec, relojAux(8));
M18: Mult PORT MAP (salidaQn(9), HoraIni(9),selec, Din(8));
B8: BiestD PORT MAP (reset, relojAux(8), Din(8), salidaQ(9), salidaQn(9));
sCont(9)<= salidaQ(9);

M19: Mult PORT MAP (salidaQn(9), sel(1),selec, relojAux(9));
M20: Mult PORT MAP (salidaQn(10), HoraIni(10),selec, Din(9));
B9: BiestD PORT MAP (reset, relojAux(9), Din(9), salidaQ(10), salidaQn(10));
sCont(10)<= salidaQ(10);

M21: Mult PORT MAP (salidaQn(10), sel(1),selec, relojAux(10));
M22: Mult PORT MAP (salidaQn(11), HoraIni(11),selec, Din(10));
B10: BiestD PORT MAP (reset, relojAux(10), Din(10), salidaQ(11), salidaQn(11));
sCont(11)<= salidaQ(11);

M23: Mult PORT MAP (salidaQn(11), sel(1),selec, relojAux(11));
M24: Mult PORT MAP (salidaQn(12), HoraIni(12),selec, Din(11));
B11: BiestD PORT MAP (reset, relojAux(11), Din(11), salidaQ(12), salidaQn(12));
sCont(12)<= salidaQ(12);

M25: Mult PORT MAP (salidaQn(12), sel(1),selec, relojAux(12));
M26: Mult PORT MAP (salidaQn(13), HoraIni(13),selec, Din(12));
B12: BiestD PORT MAP (reset, relojAux(12), Din(12), salidaQ(13), salidaQn(13));
sCont(13)<= salidaQ(13);

M27: Mult PORT MAP (salidaQn(13), sel(1),selec, relojAux(13));
M28: Mult PORT MAP (salidaQn(14), HoraIni(14),selec, Din(13));
B13: BiestD PORT MAP (reset, relojAux(13), Din(13), salidaQ(14), salidaQn(14));
sCont(14)<= salidaQ(14);

M29: Mult PORT MAP (salidaQn(14), sel(1),selec, relojAux(14));
M30: Mult PORT MAP (salidaQn(15), HoraIni(15),selec, Din(14));
B14: BiestD PORT MAP (reset, relojAux(14), Din(14), salidaQ(15), salidaQn(15));
sCont(15)<= salidaQ(15);

M31: Mult PORT MAP (salidaQn(15), sel(1),selec, relojAux(15));
M32: Mult PORT MAP (salidaQn(16), HoraIni(16),selec, Din(15));
B15: BiestD PORT MAP (reset, relojAux(15), Din(15), salidaQ(16), salidaQn(16));
sCont(16)<= salidaQ(16);

end behavior;
		