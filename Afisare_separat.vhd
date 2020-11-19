library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity eAfisareDistanta is
 Port (
       --enable_afisare_pay: in std_logic;
       digit0: in std_logic_vector(3 downto 0);
       digit1: in std_logic_vector(3 downto 0);
       digit2: in std_logic_vector(3 downto 0);
       digit3: in std_logic_vector(3 downto 0);  
       clk: in std_logic;
       cat: out std_logic_vector(6 downto 0);
       an: out std_logic_vector(3 downto 0));
 end eAfisareDistanta;

architecture aAfisareDistanta of eAfisareDistanta is

signal i0: std_logic_vector(3 downto 0):="1110";
signal i1: std_logic_vector(3 downto 0):="1101";
signal i2: std_logic_vector(3 downto 0):="1011";
signal i3: std_logic_vector(3 downto 0):="1111";
signal count: std_logic_vector(15 downto 0):=x"0000";
signal m1: std_logic_vector(3 downto 0);

begin

--PENTRU INTROD DISTANTA
process(i3)
begin
if digit3>"0000" then
i3<="0111";
else 
i3<="1111";
end if;
end process;

--PENTRU CAND SE AFISEAZA SUMA
process(i3, i2, i1, i0)
begin
if digit2="1101" then
i2<="1111";
else i2<="1011";
end if;
if digit1="1101" then
i1<="1111";
else i1<="1101";
end if;
end process;

process(clk)
      begin
      if rising_edge(clk) then
        count <= count +1;
      end if;
end process;

process(digit0, digit1, digit2, digit3, count(15 downto 14))
    begin 
    case count(15 downto 14) is
        when "00" => m1 <= digit0;
        when "01" => m1 <= digit1;
        when "10" => m1 <= digit2;
        when others => m1<=digit3;
    end case;

end process;

process(i0, i1,i2,i3, count(15 downto 14))
    begin 
    case count(15 downto 14) is 
        when "00" => an<=i0; 
        when "01" => an<=i1;
        when "10" => an<=i2;
        when others => an<=i3;
     end case;
 end process;
 
 process(m1)
 begin 
  case m1 is
          when "0000" => cat <= "1000000";   --0
          when "0001" => cat <= "1111001";   --1
          when "0010" => cat <= "0100100";   --2
          when "0011" => cat <= "0110000";   --3
          when "0100" => cat <= "0011001";   --4
          when "0101" => cat <= "0010010";   --5
          when "0110" => cat <= "0000010";   --6
          when "0111" => cat <= "1111000";   --7
          when "1000" => cat <= "0000000";   --8
          when "1001" => cat <= "0010000";   --9
          when "1010" => cat <= "0001000";   --A
          when "1011" => cat <= "0001110";   --F
          when "1100" => cat <= "1000110";  --C
          when "1101" => cat <= "0100001";   --d
          when "1110" => cat <= "1001000";   --M
          when others => cat <= "1000001";   --U
     end case;
  end process;
         
end aAfisareDistanta;
