library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity eConvertor_bani is
	port(
	int_50: in std_logic_vector(3 downto 0);
	int_20: in std_logic_vector(3 downto 0);
	int_10: in std_logic_vector(3 downto 0);
	int_5: in std_logic_vector(3 downto 0);
	int_2: in std_logic_vector(3 downto 0);
	int_1: in std_logic_vector(3 downto 0);
	out_money: out std_logic_vector(9 downto 0)
	);
end eConvertor_bani;

architecture aConvertor_bani of eConvertor_bani is 

signal b_50, b_20, b_10, b_5, b_2, b_1: integer:=0;
signal rezultat: integer:=0;

begin
	
  b_50<=to_integer(unsigned(int_50));
  b_20<=to_integer(unsigned(int_20));
  b_10<=to_integer(unsigned(int_10));
  b_5<=to_integer(unsigned(int_5));
  b_2<=to_integer(unsigned(int_2));
  b_1<=to_integer(unsigned(int_1));
  rezultat<=b_50*50+b_20*20+b_10*10+b_5*5+b_2*2+b_1;
  out_money<=std_logic_vector(to_unsigned(rezultat, 10));

end aConvertor_bani;

