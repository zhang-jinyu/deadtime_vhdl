----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 2020/04/02 20:12:58
-- Design Name: 
-- Module Name: deadtime - Behavioral
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
use IEEE.STD_LOGIC_UNSIGNED.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity deadtime is
    Port ( CLK : in STD_LOGIC;
           GH_IN : in STD_LOGIC_VECTOR (2 downto 0);
           GL_IN : in STD_LOGIC_VECTOR (2 downto 0);
           GH_OUT : out STD_LOGIC_VECTOR (2 downto 0);
           GL_OUT : out STD_LOGIC_VECTOR (2 downto 0));
end deadtime;

architecture Behavioral of deadtime is
    SIGNAL CNT_H0 : STD_LOGIC_VECTOR (5 DOWNTO 0);
    SIGNAL CNT_H1 : STD_LOGIC_VECTOR (5 DOWNTO 0);
    SIGNAL CNT_H2 : STD_LOGIC_VECTOR (5 DOWNTO 0);
    SIGNAL CNT_L0 : STD_LOGIC_VECTOR (5 DOWNTO 0);
    SIGNAL CNT_L1 : STD_LOGIC_VECTOR (5 DOWNTO 0);
    SIGNAL CNT_L2 : STD_LOGIC_VECTOR (5 DOWNTO 0); 
    SIGNAL GH_TMP : STD_LOGIC_VECTOR (2 DOWNTO 0);
    SIGNAL GL_TMP : STD_LOGIC_VECTOR (2 DOWNTO 0);
begin
    PROCESS (CLK) BEGIN
        IF(CLK'EVENT AND CLK='1') THEN
            IF (GH_IN(0)='0')  THEN
            GH_TMP(0)<= '0';
            CNT_H0 <= "000000";
            ELSE 
                IF(CNT_H0 < "110010") THEN
                    CNT_H0 <= CNT_H0 +1;
                ELSE
                    GH_TMP(0)<='1';
                END IF;
            END IF;
        END IF;
    END PROCESS;
    
    PROCESS (CLK) BEGIN
        IF(CLK'EVENT AND CLK='1') THEN
            IF (GH_IN(1)='0')  THEN
            GH_TMP(1)<= '0';
            CNT_H1 <= "000000";
            ELSE 
                IF(CNT_H1 < "110010") THEN
                    CNT_H1 <= CNT_H1 +1;
                ELSE
                    GH_TMP(1)<='1';
                END IF;
            END IF;
        END IF;
    END PROCESS;
    
    PROCESS (CLK) BEGIN
        IF(CLK'EVENT AND CLK='1') THEN
            IF (GH_IN(2)='0')  THEN
            GH_TMP(2)<= '0';
            CNT_H2 <= "000000";
            ELSE 
                IF(CNT_H2 < "110010") THEN
                    CNT_H2 <= CNT_H2 +1;
                ELSE
                    GH_TMP(2)<='1';
                END IF;
            END IF;
        END IF;
    END PROCESS;
    
    PROCESS (CLK) BEGIN
        IF(CLK'EVENT AND CLK='1') THEN
            IF (GL_IN(0)='0')  THEN
            GL_TMP(0)<= '0';
            CNT_L0 <= "000000";
            ELSE 
                IF(CNT_L0 < "110010") THEN
                    CNT_L0 <= CNT_L0 +1;
                ELSE
                    GL_TMP(0)<='1';
                END IF;
            END IF;
        END IF;
    END PROCESS;
    
    PROCESS (CLK) BEGIN
        IF(CLK'EVENT AND CLK='1') THEN
            IF (GL_IN(1)='0')  THEN
            GL_TMP(1)<= '0';
            CNT_L1 <= "000000";
            ELSE 
                IF(CNT_L1 < "110010") THEN
                    CNT_L1 <= CNT_L1 +1;
                ELSE
                    GL_TMP(1)<='1';
                END IF;
            END IF;
        END IF;
    END PROCESS;
    PROCESS (CLK) BEGIN
        IF(CLK'EVENT AND CLK='1') THEN
            IF (GL_IN(2)='0')  THEN
            GL_TMP(2)<= '0';
            CNT_L2 <= "000000";
            ELSE 
                IF(CNT_L2 < "110010") THEN
                    CNT_L2 <= CNT_L2 +1;
                ELSE
                    GL_TMP(2)<='1';
                END IF;
            END IF;
        END IF;
    END PROCESS;
    GH_OUT <= GH_TMP;
    GL_OUT <= GL_TMP;


end Behavioral;
