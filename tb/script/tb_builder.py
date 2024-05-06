# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

import os
import sys
import json

from tb_generator import tb_generator
import common 


def __main__():
    ADDER_LENGTH = 4
    
    # Path to PROJECT_0
    TOP_DIR = os.path.join("../")

    # Path to tb/template/
    TEMPLATE_DIR = os.path.join(TOP_DIR, "tb", "template/")
    # Path to tb/result/
    RESULT_DIR = os.path.join(TOP_DIR, "tb", "result/")
    
    # Load config.json file
    try:
        with open(TOP_DIR + "common/config.json", 'r') as config_file:
            config_dict = json.load(config_file)
    except FileNotFoundError:
        print(f"ERROR : The file config file does not exist.")
    # Get ADDER_LENGTH from config.json file
    ADDER_LENGTH = config_dict.get('ADDER_LENGTH')

    # Getting template file name list
    template_names = os.listdir('template/')

    # Loading templates in var
    for template_name in template_names:
        # Create the name of the result file
        result_name = (template_name.replace(".template", ""))
        # Load the content of the template in a variable
        with open(TEMPLATE_DIR + template_name, 'r') as template:
            template_content = template.read()

        number_of_spaces = common.get_number_of_spaces(template_content, '$(input_waves)')
        # Call of the tb_generator method
        tb_content = tb_generator(ADDER_LENGTH, number_of_spaces)

        # In the %content%, replace the %'word to replace'% by the %replacement% and put the result in the %output% variable
        # output = replace_placeholder(%content%, {'word to replace': replacement})
        output = common.replace_placeholder(template_content, {'input_waves': tb_content, 'ADDER_LENGTH': str(ADDER_LENGTH)})
    
        # Create the resulting file
        with open(RESULT_DIR + result_name, 'w') as result_file:
            result_file.write(output)

__main__()