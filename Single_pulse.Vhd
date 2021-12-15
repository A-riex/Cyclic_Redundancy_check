

    library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_signed.all;
    use IEEE.std_logic_arith.all;


entity Single_pulse is
port
(
clk:    in std_logic;       -- main clock input
button:    in std_logic;    -- input from a button
pulse_out:   out std_logic  -- single pulse output
);
end Single_pulse;

architecture arch of Single_pulse is
    signal d0,d1: std_logic;
    signal inverted:  std_logic;
begin
inverted <= not button;
process (clk)
begin
     if rising_edge(clk) then
        d0 <= inverted;

        d1 <= d0;

     end if;
end process;

pulse_out <= d0 and not d1;
 
end arch;
