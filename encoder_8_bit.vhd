
--x^8+ x^7 + x^5 + X^2 +X +1

library IEEE; 
use IEEE.NUMERIC_STD.ALL;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity encoder is

port (
	clk 				: in std_logic;
	res 				: in std_logic;
	message 			: in std_logic_vector (0 to 7);
	error_detected : in std_logic;
	debug_lfsr 		: out std_logic_vector(7 downto 0);
	enable 			: out std_logic;
	transmit			: out std_logic_vector(15 downto 0)
	);
end encoder;

architecture rtl of encoder is
signal  r_lfsr : std_logic_vector(7 downto 0);

type state_type is (A, B, C, D, E, F, G, H, I);
signal s : state_type;

begin

process (res, clk)

 
begin
if res = '1' then

	r_lfsr <= (others => '0');
	s<=A;
	transmit <= (others => '0');
	enable <= '0';
	
else

	if clk = '1' and clk'event then
		
		case s is
	
		when A =>
			r_lfsr(7) <= r_lfsr(6) xor message(7) xor r_lfsr(7);
			r_lfsr(6) <= r_lfsr(5);
			r_lfsr(5) <= r_lfsr(4) xor message(7) xor r_lfsr(7);
			r_lfsr(4) <= r_lfsr(3);
			r_lfsr(3) <= r_lfsr(2);
			r_lfsr(2) <= r_lfsr(1) xor message(7) xor r_lfsr(7);
			r_lfsr(1) <= r_lfsr(0) xor message(7) xor r_lfsr(7);
			r_lfsr(0) <= r_lfsr(7) xor message(7);
			s<=B;			
			debug_lfsr <= r_lfsr;
		when B =>
			r_lfsr(7) <= r_lfsr(6) xor message(6) xor r_lfsr(7);
			r_lfsr(6) <= r_lfsr(5);
			r_lfsr(5) <= r_lfsr(4) xor message(6) xor r_lfsr(7);
			r_lfsr(4) <= r_lfsr(3);
			r_lfsr(3) <= r_lfsr(2);
			r_lfsr(2) <= r_lfsr(1) xor message(6) xor r_lfsr(7);
			r_lfsr(1) <= r_lfsr(0) xor message(6) xor r_lfsr(7);
			r_lfsr(0) <= r_lfsr(7) xor message(6);
			s<=C;
			debug_lfsr <= r_lfsr;
		when C =>
			r_lfsr(7) <= r_lfsr(6) xor message(5) xor r_lfsr(7);
			r_lfsr(6) <= r_lfsr(5);
			r_lfsr(5) <= r_lfsr(4) xor message(5) xor r_lfsr(7);
			r_lfsr(4) <= r_lfsr(3);
			r_lfsr(3) <= r_lfsr(2);
			r_lfsr(2) <= r_lfsr(1) xor message(5) xor r_lfsr(7);
			r_lfsr(1) <= r_lfsr(0) xor message(5) xor r_lfsr(7);
			r_lfsr(0) <= r_lfsr(7) xor message(5);
			S<=D;
			debug_lfsr <= r_lfsr;
		when D =>
			r_lfsr(7) <= r_lfsr(6) xor message(4) xor r_lfsr(7);
			r_lfsr(6) <= r_lfsr(5);
			r_lfsr(5) <= r_lfsr(4) xor message(4) xor r_lfsr(7);
			r_lfsr(4) <= r_lfsr(3);
			r_lfsr(3) <= r_lfsr(2);
			r_lfsr(2) <= r_lfsr(1) xor message(4) xor r_lfsr(7);
			r_lfsr(1) <= r_lfsr(0) xor message(4) xor r_lfsr(7);
			r_lfsr(0) <= r_lfsr(7) xor message(4);
			s<=E;
			debug_lfsr <= r_lfsr;
		when E =>
			r_lfsr(7) <= r_lfsr(6) xor message(3) xor r_lfsr(7);
			r_lfsr(6) <= r_lfsr(5);
			r_lfsr(5) <= r_lfsr(4) xor message(3) xor r_lfsr(7);
			r_lfsr(4) <= r_lfsr(3);
			r_lfsr(3) <= r_lfsr(2);
			r_lfsr(2) <= r_lfsr(1) xor message(3) xor r_lfsr(7);
			r_lfsr(1) <= r_lfsr(0) xor message(3) xor r_lfsr(7);
			r_lfsr(0) <= r_lfsr(7) xor message(3);
			s<=F;
			debug_lfsr <= r_lfsr;
		when F =>
			r_lfsr(7) <= r_lfsr(6) xor message(2) xor r_lfsr(7);
			r_lfsr(6) <= r_lfsr(5);
			r_lfsr(5) <= r_lfsr(4) xor message(2) xor r_lfsr(7);
			r_lfsr(4) <= r_lfsr(3);
			r_lfsr(3) <= r_lfsr(2);
			r_lfsr(2) <= r_lfsr(1) xor message(2) xor r_lfsr(7);
			r_lfsr(1) <= r_lfsr(0) xor message(2) xor r_lfsr(7);
			r_lfsr(0) <= r_lfsr(7) xor message(2);
			s<=G;
			debug_lfsr <= r_lfsr;
		when G =>
			r_lfsr(7) <= r_lfsr(6) xor message(1) xor r_lfsr(7);
			r_lfsr(6) <= r_lfsr(5);
			r_lfsr(5) <= r_lfsr(4) xor message(1) xor r_lfsr(7);
			r_lfsr(4) <= r_lfsr(3);
			r_lfsr(3) <= r_lfsr(2);
			r_lfsr(2) <= r_lfsr(1) xor message(1) xor r_lfsr(7);
			r_lfsr(1) <= r_lfsr(0) xor message(1) xor r_lfsr(7);
			r_lfsr(0) <= r_lfsr(7) xor message(1);
			s<=H;
			debug_lfsr <= r_lfsr;
		when H =>
			r_lfsr(7) <= r_lfsr(6) xor message(0) xor r_lfsr(7);
			r_lfsr(6) <= r_lfsr(5);
			r_lfsr(5) <= r_lfsr(4) xor message(0) xor r_lfsr(7);
			r_lfsr(4) <= r_lfsr(3);
			r_lfsr(3) <= r_lfsr(2);
			r_lfsr(2) <= r_lfsr(1) xor message(0) xor r_lfsr(7);
			r_lfsr(1) <= r_lfsr(0) xor message(0) xor r_lfsr(7);
			r_lfsr(0) <= r_lfsr(7) xor message(0);
			s<=I;
			debug_lfsr <= r_lfsr;
		when I =>
		if error_detected = '1' then
			transmit <= r_lfsr & message;
			enable <= '1';
		else
			r_lfsr <= (others => '0');
			s<=A;
			transmit <= (others => '0');
			enable <= '0';
		end if;

		end case;					
	end if;
end if;

end process;


end rtl;
	