# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

# import os library
import os
# import sys library
import sys


# fetching the name of the resulting file
RESULTING_FILE_NAME = sys.argv[1]


def __main__():
    
    # only srcs are unified as tbs can not
    # Path to buffer/src/
    BUFFER_SRC_DIR = os.path.join("buffer", "src/")
    # Path to result/src/
    RESULT_SRC_DIR = os.path.join("result", "src/")
    
    # Getting src file name list
    src_names = os.listdir('buffer/src/')

    # variable that contains the content of the srcs
    src_content = ""
    # navigate through all files in buffer/src/
    for src_name in src_names:
        # Load the content of the srcs in a variable
        with open(BUFFER_SRC_DIR + src_name, 'r') as src:
            src_content += src.read() + 3*"\n"

    # Create the resulting file
    with open(RESULT_SRC_DIR + RESULTING_FILE_NAME, 'w') as result_file:
        result_file.write(src_content)
        
    # simply copy the tbs because they do not need to be unified
    os.system("cp -f buffer/tb/* result/tb/")

__main__()