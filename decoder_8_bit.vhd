
--x^8+ x^7 + x^5 + X^2 +X +1

library IEEE; 
use IEEE.NUMERIC_STD.ALL;

use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

entity decoder is

port (
	clk 				: in std_logic;
	res 				: in std_logic;
	enable_in		: in std_logic;
	transmit			: in std_logic_vector (0 to 15);
	debug_lfsr		: out std_logic_vector(7 downto 0);
	message  		: out std_logic_vector(7 downto 0);
	lfsr				: out std_logic_vector(7 downto 0);
	status 			: out	std_logic;
	error_detected : out std_logic
	);
end decoder;

architecture rtl of decoder is
signal 	r_lfsr 	: std_logic_vector(7 downto 0);
signal 	recieved	: std_logic_vector(15 downto 0);

type state_type is (buffert, A, B, C, D, E, F, G, H, I, J, K, L, M, N, O, P, Q);
signal s : state_type;

begin

process (res, clk)


begin
if res = '1' then

	message	<= (others => '0');
	lfsr <= (others => '0');
	
	r_lfsr <= (others => '0');
	recieved <= transmit;
	
	s<=buffert;
	
	error_detected <= '1';
	status <= '0'; --LED
	
	recieved <= transmit;
	
else

	if clk = '1' and clk'event then
	
		if enable_in = '1' then
		
			case s is
			--kolla i state 1 om recieved == transmit istället för enable.
			when buffert =>
				message	<= (others => '0');
				lfsr <= (others => '0');
				
				r_lfsr <= (others => '0');
				recieved <= transmit;
				
				status <= '0'; --LED
				
				s<=A;
		
			when A =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(0) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(0) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(0) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(0) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(0);
				s<=B;			
				debug_lfsr <= r_lfsr;
			when B =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(1) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(1) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(1) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(1) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(1);
				s<=C;
				debug_lfsr <= r_lfsr;
			when C =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(2) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(2) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(2) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(2) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(2);
				S<=D;
				debug_lfsr <= r_lfsr;
			when D =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(3) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(3) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(3) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(3) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(3);
				s<=E;
				debug_lfsr <= r_lfsr;
			when E =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(4) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(4) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(4) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(4) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(4);
				s<=F;
				debug_lfsr <= r_lfsr;
			when F =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(5) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(5) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(5) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(5) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(5);
				s<=G;
				debug_lfsr <= r_lfsr;
			when G =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(6) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(6) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(6) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(6) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(6);
				s<=H;
				debug_lfsr <= r_lfsr;
			when H =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(7) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(7) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(7) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(7) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(7);
				s<=I;
				debug_lfsr <= r_lfsr;
			when I =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(15) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(15) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(15) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(15) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(15);
				s<=J;
				debug_lfsr <= r_lfsr;
			when J =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(14) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(14) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(14) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(14) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(14);
				s<=K;
				debug_lfsr <= r_lfsr;
			when K =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(13) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(13) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(13) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(13) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(13);
				s<=L;
				debug_lfsr <= r_lfsr;
			when L =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(12) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(12) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(12) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(12) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(12);
				s<=M;
				debug_lfsr <= r_lfsr;
			when M =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(11) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(11) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(11) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(11) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(11);
				s<=N;
				debug_lfsr <= r_lfsr;
			when N =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(10) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(10) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(10) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(10) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(10);
				s<=O;
				debug_lfsr <= r_lfsr;
			when O =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(9) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(9) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(9) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(9) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(9);
				s<=P;
				debug_lfsr <= r_lfsr;
			when P =>
				r_lfsr(7) <= r_lfsr(6) xor recieved(8) xor r_lfsr(7);
				r_lfsr(6) <= r_lfsr(5);
				r_lfsr(5) <= r_lfsr(4) xor recieved(8) xor r_lfsr(7);
				r_lfsr(4) <= r_lfsr(3);
				r_lfsr(3) <= r_lfsr(2);
				r_lfsr(2) <= r_lfsr(1) xor recieved(8) xor r_lfsr(7);
				r_lfsr(1) <= r_lfsr(0) xor recieved(8) xor r_lfsr(7);
				r_lfsr(0) <= r_lfsr(7) xor recieved(8);
				s<=Q;
				debug_lfsr <= r_lfsr;
				
				
			when Q =>
				-- korrigera fel
				-------------------------------One bit errors
				if r_lfsr = "01010010" then
					message <= recieved(7 downto 0) xor "00000001";
					status <= '1'; --LED
					
				elsif r_lfsr = "00101001" then 
					message <= recieved(7 downto 0) xor "00000010";
					status <= '1'; --LED
					
				elsif r_lfsr = "11000111" then	
					message <= recieved(7 downto 0) xor "00000100";
				   status <= '1'; --LED	
					
				elsif r_lfsr = "10110000" then	
					message <= recieved(7 downto 0) xor "00001000";
					status <= '1'; --LED
					
				elsif r_lfsr = "01011000" then	
					message <= recieved(7 downto 0) xor "00010000";
					status <= '1'; --LED
					
				elsif r_lfsr = "00101100" then	
					message <= recieved(7 downto 0) xor "00100000";
					status <= '1'; --LED	
				
				elsif r_lfsr = "00010110" then	
					message <= recieved(7 downto 0) xor "01000000"; 
					status <= '1'; --LED
					
				elsif r_lfsr = "00001011" then	
					message <= recieved(7 downto 0) xor "10000000";	
					status <= '1'; --LED
					------------------------------------ 2 bit burst errors
					
				elsif r_lfsr = "00011101" then	
					message <= recieved(7 downto 0) xor "11000000";	
					status <= '1'; --LED
				
				elsif r_lfsr = "00111010" then	
					message <= recieved(7 downto 0) xor "01100000";	
					status <= '1'; --LED
				
				elsif r_lfsr = "01110100" then	
					message <= recieved(7 downto 0) xor "00110000";	
					status <= '1'; --LED
					
				elsif r_lfsr = "11101000" then	
					message <= recieved(7 downto 0) xor "00011000";	
					status <= '1'; --LED
					
				elsif r_lfsr = "01110111" then	
					message <= recieved(7 downto 0) xor "00001100";	
					status <= '1'; --LED
					
				elsif r_lfsr = "11101110" then	
					message <= recieved(7 downto 0) xor "00000110";	
					status <= '1'; --LED
					
				elsif r_lfsr = "01111011" then	
					message <= recieved(7 downto 0) xor "00000011";	
					status <= '1'; --LED
					
					------------------------------------ 8 bit burst error
					
				elsif r_lfsr = "01100101" then	
					message <= recieved(7 downto 0) xor "11111111";	
					status <= '1'; --LED
				
					------------------------------------ no error
				
				elsif r_lfsr = "00000000" then --if remainder = 0
					status <= '1'; --LED
					error_detected <= '0';
					message <= recieved(7 downto 0);
					
				else
					status <= '0'; --LED
					error_detected <= '1';
					message <= recieved(7 downto 0);
				end if;	
				
			--CRC <= recieved(15 downto 8);
			lfsr <= r_lfsr;
				
			s<=buffert;
			
			end case;	

		end if;	
	end if;
end if;

end process;


end rtl;
	