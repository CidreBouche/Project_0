# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

def tb_generator(ADDER_LENGTH, number_of_tabs):
    # s is my string
    s = ""
    # calculate the number of indents to put before the string
    indent = ' ' * number_of_tabs
    # time to wait between each bit toggle
    time_to_wait = 100
    # prepare the wait message
    waiter = f"wait for {time_to_wait} ns;"

    # start the string with the time needed to fully run the tb
    s += f"-- Run time needed : {2**(ADDER_LENGTH*2)*time_to_wait + time_to_wait} ns" + "\n"

    # loop to parse all cases
    for case_number in range(2**(ADDER_LENGTH*2)):
        # value of a_i
        a = int(case_number / 2**(ADDER_LENGTH))
        # value of b_i
        b = int(case_number % 2**(ADDER_LENGTH))
        
        # file my string
        s += indent + waiter + "\n"
        s += indent + f'a_i <= "{a:0{ADDER_LENGTH}b}";' + "\n"
        s += indent + f'b_i <= "{b:0{ADDER_LENGTH}b}";' + "\n"
        # put one more \n as long as it is not the last case
        if case_number != 2**(ADDER_LENGTH*2) - 1: s += "\n"

    # return the string
    return s