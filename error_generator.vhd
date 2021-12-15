
--x^8+ x^7 + x^5 + X^2 +X +1

library IEEE; 
use IEEE.NUMERIC_STD.ALL;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity error_generator is

port (
	enable_in		: in std_logic;
	error_sw 		: in std_logic_vector (7 downto 0);
	transmit_in		: in std_logic_vector (15 downto 0);
	transmit_out	: out std_logic_vector (15 downto 0);
	enable_out		: out	std_logic
	);
end error_generator;

architecture rtl of error_generator is


begin

process (transmit_in)


begin
if enable_in = '0' then

	transmit_out <= (others => '0');
	enable_out <= '0';
	
else
	
	if error_sw(0) = '1' then
		transmit_out(0) <= transmit_in(0) xor '1';
		else
		transmit_out(0) <= transmit_in(0);
	end if;
	
		if error_sw(1) = '1' then
		transmit_out(1) <= transmit_in(1) xor '1';
		else
		transmit_out(1) <= transmit_in(1);
	end if;
	
	
		if error_sw(2) = '1' then
		transmit_out(2) <= transmit_in(2) xor '1';
		else
		transmit_out(2) <= transmit_in(2);
	end if;
	
	
		if error_sw(3) = '1' then
		transmit_out(3) <= transmit_in(3) xor '1';
		else
		transmit_out(3) <= transmit_in(3);
	end if;
	
	
		if error_sw(4) = '1' then
		transmit_out(4) <= transmit_in(4) xor '1';
		else
		transmit_out(4) <= transmit_in(4);
	end if;
	
	
		if error_sw(5) = '1' then
		transmit_out(5) <= transmit_in(5) xor '1';
		else
		transmit_out(5) <= transmit_in(5);
		
	end if;
	
	
		if error_sw(6) = '1' then
		transmit_out(6) <= transmit_in(6) xor '1';
		else
		transmit_out(6) <= transmit_in(6);
	end if;
	
	
		if error_sw(7) = '1' then
		transmit_out(7) <= transmit_in(7) xor '1';
		else
		transmit_out(7) <= transmit_in(7);
	end if;		
	
	transmit_out(15 downto 8) <= transmit_in(15 downto 8);
	enable_out <= '1';
		
	end if;

end process;

end rtl;
	