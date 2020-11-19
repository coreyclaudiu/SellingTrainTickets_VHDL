library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity eConversieFin is
	port(
	  suma_introd, dist_introd: in std_logic_vector(9 downto 0);
	  in_50, in_20, in_10, in_5, in_2, in_1: in std_logic_vector(3 downto 0);
	  rest: out integer;
	  in_50_int, in_20_int, in_10_int, in_5_int, in_2_int, in_1_int: out integer
	);
	
end eConversieFin;


architecture aConversieFin of eConversieFin is

signal suma_introd_copy, dist_introd_copy: integer:=0;

begin
	
	in_50_int<=to_integer(unsigned(in_50));
	in_20_int<=to_integer(unsigned(in_20));
	in_10_int<=to_integer(unsigned(in_10));
	in_5_int<=to_integer(unsigned(in_5));
	in_2_int<=to_integer(unsigned(in_2));
	in_1_int<=to_integer(unsigned(in_1));  
	
	suma_introd_copy<=to_integer(unsigned(suma_introd));
	dist_introd_copy<=to_integer(unsigned(dist_introd));
	
	rest<=suma_introd_copy-dist_introd_copy;

end aConversieFin;