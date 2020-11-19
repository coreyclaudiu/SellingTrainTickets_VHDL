library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
--use ieee.std_logic_arith.all;
use ieee.numeric_std.all;

entity eConvertor_dist is 
	port(
	int_zeci: in std_logic_vector(3 downto 0);
	int_sute: in std_logic_vector(3 downto 0);
	int_mii: in std_logic_vector(3 downto 0);
	out_to_pay: out std_logic_vector(9 downto 0)	
	);
end eConvertor_dist;

architecture aConvertor_dist of eConvertor_dist is 


signal contor_zeci, contor_sute, contor_mii: integer:=0;
signal rezultat: integer:=0;
begin

	contor_mii<=to_integer(unsigned(int_mii));
	contor_sute<=to_integer(unsigned(int_sute));
	contor_zeci<=to_integer(unsigned(int_zeci));
	rezultat<=contor_mii*100+contor_sute*10+contor_zeci;
	out_to_pay<=std_logic_vector(to_unsigned(rezultat, 10));
	
end aConvertor_dist;
