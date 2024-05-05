--==========================--
-- Author : Baptiste Durand --
--==========================--

-- This file is OK

library IEEE;
use IEEE.std_logic_1164.all;

entity tb_half_adder_1b is 
-- empty
end entity;
architecture arch of tb_half_adder_1b is
    signal a_i : std_logic :='0';
    signal b_i : std_logic :='0';
    signal sum_o : std_logic;
    signal carry_o : std_logic;

    component half_adder_1b is
        port(
            a_i : in std_logic;
            b_i : in std_logic;
            sum_o : out std_logic;
            carry_o : out std_logic
        );
    end component;
begin

    half_adder_1b_0 : half_adder_1b port map(a_i, b_i, sum_o, carry_o);

    process
    begin
        wait for 100 ns;
        a_i <= '0';
        b_i <= '0';
        
        wait for 100 ns;
        a_i <= '1';
        b_i <= '0';
        
        wait for 100 ns;
        a_i <= '0';
        b_i <= '1';
        
        wait for 100 ns;
        a_i <= '1';
        b_i <= '1';
    end process;
    
end arch;