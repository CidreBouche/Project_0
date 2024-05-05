--==========================--
-- Author : Baptiste Durand --
--==========================--

-- This file is OK

library IEEE;
use IEEE.std_logic_1164.all;

-- This file contains the VHDL code of the full adder
-- Operation done by the full adder 1b : a_i + b_i + c_i = carry_o & sum_o

entity full_adder_1b is 
port(
	a_i : in std_logic;
	b_i : in std_logic;
	c_i : in std_logic;
    sum_o : out std_logic;
    c_o : out std_logic
);
end entity;
architecture arch of full_adder_1b is

    component half_adder_1b is
        port(
            a_i : in std_logic;
            b_i : in std_logic;
            sum_o : out std_logic;
            carry_o : out std_logic
        );
    end component;

    signal sum_temp_0_to_1_s : std_logic;
    signal carry_temp_0_to_or_s : std_logic;
    signal carry_temp_1_to_or_s : std_logic;

begin
    -- syntaxe of port map : component => entity
    ha_0 : half_adder_1b port map (a_i => a_i, b_i => b_i, sum_o => sum_temp_0_to_1_s, carry_o => carry_temp_0_to_or_s);
    ha_1 : half_adder_1b port map (a_i => sum_temp_0_to_1_s, b_i => c_i, sum_o => sum_o, carry_o => carry_temp_1_to_or_s);

    c_o <= carry_temp_0_to_or_s or carry_temp_1_to_or_s;

end arch;