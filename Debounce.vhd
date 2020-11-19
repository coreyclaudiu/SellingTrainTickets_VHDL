library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity edebouncer is
    Port (btn: in std_logic;
          clk: in std_logic;
          enable: out std_logic );
end edebouncer;

architecture adebouncer of edebouncer is

signal cnt: std_logic_vector(15 downto 0):=x"0000";
signal Q1: std_logic;
signal Q2: std_logic;
signal Q3: std_logic;
begin

enable<=Q2 and (not Q3);

process(clk)
    begin
        if rising_edge(clk) then
        cnt <= cnt+1;
        end if;
end process;

process(clk) 
    begin 
        if rising_edge(clk) then 
            if cnt(15 downto 0)="1111111111111111" then 
                Q1 <= btn;
            end if;
        end if;   
end process;       
 
 process(clk)
    begin 
          if rising_edge(clk) then 
          Q2 <= Q1;
          Q3 <= Q2;
          end if;
  end process;                   

end adebouncer;
