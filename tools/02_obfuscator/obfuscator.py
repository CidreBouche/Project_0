# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

# import os library
import os
# import sys library
import sys


# their will be methods to :
# 1. build the json
# 2. obfuscate the names using the json
# 3. obfuscate the gates

def __main__():
    # Path to buffer/src/
    BUFFER_SRC_DIR = os.path.join("buffer", "src/")
    # Path to buffer/tb/
    BUFFER_TB_DIR = os.path.join("buffer", "tb/")
    # Path to result/src/
    RESULT_SRC_DIR = os.path.join("result", "src/")
    # Path to result/tb/
    RESULT_TB_DIR = os.path.join("result", "tb/")
    
    # Getting src file name list
    src_names = os.listdir('buffer/src/')




__main__()