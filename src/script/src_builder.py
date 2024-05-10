# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

# import os library
import os
# import json library
import json

# import my common.py as a library
import common 


def __main__():
    # Path to PROJECT_0
    TOP_DIR = os.path.join("../")

    # Path to src/template/
    TEMPLATE_DIR = os.path.join(TOP_DIR, "src", "template/")
    # Path to src/result/
    RESULT_DIR = os.path.join(TOP_DIR, "src", "result/")
    
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

        # In the %content%, replace the %'word to replace'% by the %replacement% and put the result in the %output% variable
        # output = replace_placeholder(%content%, {'word to replace': replacement})
        output = common.replace_placeholder(template_content, {'ADDER_LENGTH': str(ADDER_LENGTH)})
    
        # Create the resulting file
        with open(RESULT_DIR + result_name, 'w') as result_file:
            result_file.write(output)

# call main method
__main__()