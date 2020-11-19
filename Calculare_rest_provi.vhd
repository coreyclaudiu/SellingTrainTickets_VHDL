library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;


entity eCalc_rest is
    port(
    distanta_calculata, suma_calculata: in std_logic_vector(9 downto 0);
--    bank_50: in std_logic_vector(3 downto 0);
--	bank_20: in std_logic_vector(3 downto 0);
--	bank_10: in std_logic_vector(3 downto 0);
--	bank_5: in std_logic_vector(3 downto 0);
--	bank_2: in std_logic_vector(3 downto 0);
--	bank_1: in std_logic_vector(3 downto 0);
--	in_50, in_20, in_10, in_5, in_2, in_1: in std_logic_vector(3 downto 0);
    succes: out std_logic
    );
end eCalc_rest;

architecture aCalc_rest of eCalc_rest is

--signal rest_ppzis: std_logic_vector(6 downto 0):="0000000";

--signal fin_50, fin_20, fin_10, fin_5, fin_2, fin_1: std_logic_vector(6 downto 0);

--signal integ_50_1, integ_20_1, integ_10_1, integ_5_1, integ_2_1, integ_1_1: integer:=0;
--signal integ_50_2, integ_20_2, integ_10_2, integ_5_2, integ_2_2, integ_1_2: integer:=0;
--signal integ_50_3, integ_20_3, integ_10_3, integ_5_3, integ_2_3, integ_1_3: integer:=0;

--signal total: integer:=0;
--signal total_bits: std_logic_vector(6 downto 0);
--signal vec_zero: std_logic_vector(6 downto 0):="0000000";

begin

--integ_50_1<=to_integer(unsigned(bank_50));
--integ_20_1<=to_integer(unsigned(bank_20));
--integ_10_1<=to_integer(unsigned(bank_10));
--integ_5_1<=to_integer(unsigned(bank_5));
--integ_2_1<=to_integer(unsigned(bank_2));
--integ_1_1<=to_integer(unsigned(bank_1));

--integ_50_2<=to_integer(unsigned(in_50));
--integ_20_2<=to_integer(unsigned(in_20));
--integ_10_2<=to_integer(unsigned(in_10));
--integ_5_2<=to_integer(unsigned(in_5));
--integ_2_2<=to_integer(unsigned(in_2));
--integ_1_2<=to_integer(unsigned(in_1));

--integ_50_3<=integ_50_1 + integ_50_2;
--integ_20_3<=integ_20_1 + integ_20_2;
--integ_10_3<=integ_10_1 + integ_10_2;
--integ_5_3<=integ_5_1 + integ_5_2;
--integ_2_3<=integ_2_1 + integ_2_2;
--integ_1_3<=integ_1_1 + integ_1_2;

--total<=integ_50_3 + integ_20_3 + integ_10_3 + integ_5_3 + integ_2_3 + integ_1_3;
--total_bits<=std_logic_vector(to_unsigned(total, 7));

--fin_50<=std_logic_vector(to_unsigned(integ_50_3, 7));
--fin_20<=std_logic_vector(to_unsigned(integ_20_3, 7));
--fin_10<=std_logic_vector(to_unsigned(integ_10_3, 7));
--fin_5<=std_logic_vector(to_unsigned(integ_5_3, 7));
--fin_2<=std_logic_vector(to_unsigned(integ_2_3, 7));
--fin_1<=std_logic_vector(to_unsigned(integ_1_3, 7));

--rest_ppzis<=suma_calculata-distanta_calculata;

process(suma_calculata, distanta_calculata)
begin 
if suma_calculata>=distanta_calculata then
succes<='1';
else 
succes<='0';
end if;
end process;


end aCalc_rest;
