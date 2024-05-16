--==========================--
-- Author : Baptiste Durand --
--==========================--

-- This file is OK

library IEEE;
use IEEE.std_logic_1164.all;

entity tb_x_bit_adder is
    -- empty
end entity;
architecture arch of tb_x_bit_adder is

    constant ADDER_LENGTH : integer := $(ADDER_LENGTH);

    signal a_i : std_logic_vector(ADDER_LENGTH - 1 downto 0) := $(zeroes);
    signal b_i : std_logic_vector(ADDER_LENGTH - 1 downto 0) := $(zeroes);
    signal sum_o : std_logic_vector(ADDER_LENGTH - 1 downto 0) := $(zeroes);
    signal overflow : std_logic;

    component x_bit_adder is
        generic(
            ADDER_LENGTH : integer := $(ADDER_LENGTH)
        );
        port(
            a_i : in std_logic_vector(ADDER_LENGTH - 1 downto 0);
            b_i : in std_logic_vector(ADDER_LENGTH - 1 downto 0);
            sum_o : out std_logic_vector(ADDER_LENGTH - 1 downto 0);
            overflow : out std_logic
        );
    end component;

begin

    x_bit_adder_0 : x_bit_adder port map(a_i, b_i, sum_o, overflow);

    process
    begin

        $(input_waves)

    end process;

end arch;