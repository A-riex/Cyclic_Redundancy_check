
             library ieee;
    use ieee.std_logic_1164.all;
    use ieee.std_logic_unsigned.all;

entity clock_divider is
    port (
        CLK_REF  : in  std_logic;        -- 50 MHz
        CLK_OUT : out std_logic
    );
end entity;

architecture RTL of clock_divider is
begin
    process(CLK_REF)
        variable i : integer range 0 to 9999999;
    begin
        if rising_edge(CLK_REF) then
            if i = 0 then
                CLK_OUT <= '1';
                i := 499999;  -- CLK_REF/500000 = 100 Hz, cycle period = 10 ms
            else
                CLK_OUT <= '0';
                i := i - 1;
            end if;
        end if;
    end process;
end architecture;

