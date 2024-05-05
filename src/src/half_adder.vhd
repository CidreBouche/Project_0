--==========================--
-- Author : Baptiste Durand --
--==========================--

-- This file is OK

library IEEE;
use IEEE.std_logic_1164.all;

-- This file contains the VHDL code of the half adder
-- Operation done by the half adder 1b : a_i + b_i = carry_o & sum_o

entity half_adder_1b is
port(
    a_i : in std_logic;
	b_i : in std_logic;
    sum_o : out std_logic;
    carry_o : out std_logic
);
end entity;
architecture arch of half_adder_1b is
    -- no signal nor component needed
begin

    sum_o <= a_i xor b_i;
    carry_o <= a_i and b_i;

end arch ;