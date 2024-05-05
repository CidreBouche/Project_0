# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

import os
import sys

import tb_generator

sys.path.append(os.path.abspath('../../common'))
from common import common 


def __main__():
    # Path to tb/
    TB_DIR = os.path.join("./")

    # Path to tb/template/
    TEMPLATE_DIR = os.path.join(TB_DIR, "template/")
    # Path to tb/result/
    RESULT_DIR = os.path.join(TB_DIR, "result/")

    # Getting template file name list
    template_names = os.listdir('template/')

    # Loading templates in var
    for template_name in template_names:
        # Create the name of the result file
        result_name = (template_name.replace(".template", ""))
        # Load the content of the template in a variable
        with open(TEMPLATE_DIR + template_name, 'r') as template:
            template_content = template.read()

        # Call of the tb_generator method
        tb_content = tb_generator()

        # In the %content%, replace the %'word to replace'% by the %replacement% and put the result in the %output% variable
        # output = replace_placeholder(%content%, {'word to replace': replacement})
        output = common.replace_placeholder(template_content, {'input_waves': tb_content, 'ADDER_LENGTH': '4'})
    
        # Create the resulting file
        with open(RESULT_DIR + result_name, 'w') as result_file:
            result_file.write(output)
            


# tb generator method
# def tb_generator():
#     pass

__main__()