--==========================--
-- Author : Baptiste Durand --
--==========================--

-- This file is OK

library IEEE;
use IEEE.std_logic_1164.all;

entity tb_full_adder_1b is 
-- empty
end entity;
architecture arch of tb_full_adder_1b is
    
    signal a_i : std_logic := '0';
    signal b_i : std_logic := '0';
    signal c_i : std_logic := '0';
    signal sum_o : std_logic;
    signal c_o : std_logic;

    component full_adder_1b is
        port(
            a_i : in std_logic;
            b_i : in std_logic;
            c_i : in std_logic;
            sum_o : out std_logic;
            c_o : out std_logic
        );
    end component;
begin

    full_adder_1b_0 : full_adder_1b port map(a_i, b_i, c_i, sum_o, c_o);

    process
    begin
        wait for 100 ns;
        a_i <= '0';
        b_i <= '0';
        c_i <= '0';
        
        wait for 100 ns;
        a_i <= '1';
        b_i <= '0';
        c_i <= '0';
        
        wait for 100 ns;
        a_i <= '0';
        b_i <= '1';
        c_i <= '0';
        
        wait for 100 ns;
        a_i <= '1';
        b_i <= '1';
        c_i <= '0';
        
        wait for 100 ns;
        a_i <= '0';
        b_i <= '0';
        c_i <= '1';
        
        wait for 100 ns;
        a_i <= '1';
        b_i <= '0';
        c_i <= '1';
        
        wait for 100 ns;
        a_i <= '0';
        b_i <= '1';
        c_i <= '1';
        
        wait for 100 ns;
        a_i <= '1';
        b_i <= '1';
        c_i <= '1';

    end process;
    
end arch;