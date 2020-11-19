library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity eRest is
	port(	
	--BANCA INIT IN TOP LEVEL
	clk, reset: in std_logic; --INTROD ACUM
	restul_binar: out std_logic_vector(11 downto 0);
	banca_50, banca_20, banca_10, banca_5, banca_2, banca_1: in std_logic_vector(3 downto 0);
	
	suma_introd, dist_introd: in std_logic_vector(9 downto 0);
	
	rest_50, rest_20, rest_10, rest_5, rest_2, rest_1: out std_logic_vector(3 downto 0);
	succes: out std_logic
	);
end eRest;


architecture aRest of eRest is 

component eConversieFin is
	port(
	  suma_introd, dist_introd: in std_logic_vector(9 downto 0);
	  in_50, in_20, in_10, in_5, in_2, in_1: in std_logic_vector(3 downto 0);
	  rest: out integer;
	  in_50_int, in_20_int, in_10_int, in_5_int, in_2_int, in_1_int: out integer
	);
end component;


type STARE_T is (ST0, ST1, ST2, ST3, ST4, ST5, st6, st7);
signal stare, nxstare: stare_t;

signal in_50_copy,in_20_copy,in_10_copy,in_5_copy,in_2_copy,in_1_copy: integer;


signal rest: integer:=0; 
signal rest_copy: integer:=0;
signal enable_rest:std_logic;

signal bank_50_c,bank_20_c,bank_10_c,bank_5_c,bank_2_c,bank_1_c: integer:=0;
signal temp: integer:=-1;

signal bank_50, bank_20, bank_10, bank_5, bank_2, bank_1: integer:=0;

signal out_50, out_20, out_10, out_5, out_2, out_1: std_logic_vector(3 downto 0);
signal int_out_50,int_out_20,int_out_10,int_out_5,int_out_2,int_out_1: integer:=0;
signal copy_succes: std_logic;

signal total_50, total_20, total_10, total_5, total_2, total_1: integer;

begin

introd_conv: eConversieFin port map(suma_introd=>suma_introd, dist_introd=>dist_introd, in_50=>banca_50, 
in_20=>banca_20, in_10=>banca_10, in_5=>banca_5, in_2=>banca_2, in_1=>banca_1, rest=>rest, in_50_int=>bank_50, 
in_20_int=>bank_20, in_10_int=>bank_10, in_5_int=>bank_5, in_2_int=>bank_2, in_1_int=>bank_1); 	

restul_binar<=std_logic_vector(to_unsigned(rest, 12));
	
process(enable_rest, rest)
begin
	if rest>=0 then 
		enable_rest<='1';
	else enable_rest<='0';
	end if;
end process;

process(clk, reset)
begin
	if reset='1' then
		stare<=st0;
	elsif clk'event and clk='1' then
		stare<=nxstare;
	end if;
		
end process;


process(stare, enable_rest)

begin
	if enable_rest='1' then
	case stare is
		when st0=>
		if temp=-1 then
			temp<=rest;
			
			bank_50_c<=bank_50;
			bank_20_c<=bank_20;
			bank_10_c<=bank_10;
			bank_5_c<=bank_5;
			bank_2_c<=bank_2;
			bank_1_c<=bank_1;
			
			nxstare<=st1;
		
		elsif reset='1' then
			temp<=rest;
			
			bank_50_c<=bank_50;
			bank_20_c<=bank_20;
			bank_10_c<=bank_10;
			bank_5_c<=bank_5;
			bank_2_c<=bank_2;
			bank_1_c<=bank_1;
			
			succes<='0';
			nxstare<=st1;
		
		else 
		    nxstare<=st1;
		end if;
		
		when st1=>
		if temp>49 and bank_50_c>0 then 
			temp<=temp-50;
			bank_50_c<=bank_50_c-1;
			int_out_50<=bank_50-bank_50_c;
			nxstare<=st0;
		else 
		     nxstare<=st2;     
		end if;
		
		when st2=>
		if temp>19 and bank_20_c>0 then 
			temp<=temp-20;
			bank_20_c<=bank_20_c-1;
			int_out_20<=bank_20-bank_20_c;
			nxstare<=st0;
		else 
			nxstare<=st3;
		end if;
		
		when st3=>
		if temp>9 and bank_10_c>0 then 
			temp<=temp-10;
			bank_10_c<=bank_10_c-1;
			int_out_10<=bank_10-bank_10_c;
			
			nxstare<=st0;
		else 
			nxstare<=st4;
		end if;
		
		when st4=>
		if temp>4 and bank_5_c>0 then 
			temp<=temp-5;
			bank_5_c<=bank_5_c-1;
			int_out_5<=bank_5-bank_5_c;
			
			nxstare<=st0;
		else 
			nxstare<=st5;
		end if;
		
		when st5=>
		if temp>1 and bank_2_c>0 then 
			temp<=temp-2;
			bank_2_c<=bank_2_c-1;
			int_out_2<=bank_2-bank_2_c;
			
			nxstare<=st0;
		else 
			nxstare<=st6;
		end if;
		
		when st6=>
		if temp>0 and bank_1_c>0 then 
			temp<=temp-1;
			bank_1_c<=bank_1_c-1;
			int_out_1<=bank_1-bank_1_c;
			
			nxstare<=st0;
		else 
			nxstare<=st7;
		end if;
		
		when st7=>
		if temp=0 then succes<='1';
		copy_succes<='1';
		else succes<='0';
		copy_succes<='0';
		end if;
		end case;
		
		
		else 
			succes<='0';
			copy_succes<='0';
		end if;
end process;
		
		process(bank_50_c, bank_20_c, bank_10_c, bank_5_c, bank_2_c, bank_1_c)
		begin
		rest_50<=std_logic_vector(to_unsigned(bank_50_c, 4));
		rest_20<=std_logic_vector(to_unsigned(bank_20_c, 4));
		rest_10<=std_logic_vector(to_unsigned(bank_10_c, 4));
		rest_5<=std_logic_vector(to_unsigned(bank_5_c, 4));
		rest_2<=std_logic_vector(to_unsigned(bank_2_c, 4));
		rest_1<=std_logic_vector(to_unsigned(bank_1_c, 4));
		end process;

	
	
end aRest;