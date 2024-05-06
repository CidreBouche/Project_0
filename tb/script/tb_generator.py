# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

def tb_generator(ADDER_LENGTH, number_of_tabs):
    s = ""
    
    indent = ' ' * number_of_tabs
    
    time_to_wait = 100
    waiter = f"wait for {time_to_wait} ns;"

    s += f"-- Run time needed : {2**(ADDER_LENGTH*2)*time_to_wait + time_to_wait} ns" + "\n"

    for case_number in range(2**(ADDER_LENGTH*2)):
        a = int(case_number / 2**(ADDER_LENGTH))
        b = int(case_number % 2**(ADDER_LENGTH))
        
        s += indent + waiter + "\n"
        s += indent + f'a_i <= "{a:0{ADDER_LENGTH}b}";' + "\n"
        s += indent + f'b_i <= "{b:0{ADDER_LENGTH}b}";' + "\n"
        if case_number != 2**(ADDER_LENGTH*2) - 1: s += "\n"

    return s