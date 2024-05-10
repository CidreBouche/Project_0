--==========================--
-- Author : Baptiste Durand --
--==========================--

library IEEE;
use IEEE.std_logic_1164.all;

-- This file contains the VHDL code of generate a x bit adder starting with a half adder.

entity x_bit_adder is
generic(
    ADDER_LENGTH : integer := $(ADDER_LENGTH)
);
port(
    a_i : in std_logic_vector(ADDER_LENGTH - 1 downto 0);
    b_i : in std_logic_vector(ADDER_LENGTH - 1 downto 0);
    sum_o : out std_logic_vector(ADDER_LENGTH - 1 downto 0);
    overflow : out std_logic
);
end entity;
architecture arch of x_bit_adder is

    component half_adder_1b is
        port(
            a_i : in std_logic;
            b_i : in std_logic;
            sum_o : out std_logic;
            carry_o : out std_logic
        );
    end component;
    
    component full_adder_1b is
        port(
            a_i : in std_logic;
            b_i : in std_logic;
            c_i : in std_logic;
            sum_o : out std_logic;
            c_o : out std_logic
        );
    end component;

    signal carry_s : std_logic_vector(ADDER_LENGTH - 2 downto 0);

begin

    -- generate all the sub adders
    gen_adder : for i in 0 to (ADDER_LENGTH - 1) generate
        -- this adder design is for the bit 0 of the addition
        gen_lower_bits : if i = 0 generate 
            u0 : half_adder_1b port map(a_i => a_i(i), 
                                        b_i => b_i(i), 
                                        sum_o => sum_o(i),
                                        carry_o => carry_s(i)
                                        );
        end generate gen_lower_bits;

        -- this adder design is for the bits between the first and the last of the addition
        gen_mid_bits : if i > 0 and i < (ADDER_LENGTH - 1) generate
            ux : full_adder_1b port map(a_i => a_i(i), 
                                        b_i => b_i(i), 
                                        c_i => carry_s(i-1),
                                        sum_o => sum_o(i),
                                        c_o => carry_s(i)
                                        );
        end generate gen_mid_bits;

        -- this adder design is for the last bit of the addition
        gen_higher_bits : if i = (ADDER_LENGTH - 1) and i /= 0 generate
            uz : full_adder_1b port map(a_i => a_i(i), 
                                        b_i => b_i(i), 
                                        c_i => carry_s(i-1),
                                        sum_o => sum_o(i),
                                        c_o => overflow
                                        );
        end generate gen_higher_bits;
    end generate gen_adder;
end arch;