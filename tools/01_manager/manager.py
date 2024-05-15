# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

# import os library
import os
# import sys library
import sys


# fetching UNIFY arg
UNIFY = sys.argv[1]
# fetching OBFUSCATE arg
OBFUSCATE = sys.argv[2]


def __main__():
    
    # unification but no obfuscation
    if (UNIFY == "true") and (OBFUSCATE== "false"):
        print("unification but no obfuscation")
        
        # setting up the folders
        os.system("make -C ../02_hdl_unifier prepare_dirs")
        
        # filling the buffer before unification
        os.system("cp -f ../../src/result/* ../02_hdl_unifier/buffer/src/")
        os.system("cp -f ../../tb/result/* ../02_hdl_unifier/buffer/tb/")
        
        # running unification
        os.system("make -C ../02_hdl_unifier/ all")
        
        # filling outcoming with the result of the unification
        os.system("cp -r ../02_hdl_unifier/result/* ../../outcoming/")
    
    
    # no unification but obfuscation    
    elif (UNIFY == "false") and (OBFUSCATE== "true"):
        print("no unification but obfuscation")
        
        # setting up the folders
        os.system("make -C ../03_obfuscator prepare_dirs")
        
        # filling the buffer before obfuscation
        os.system("cp ../../src/result/* ../03_obfuscator/buffer/src/")
        os.system("cp ../../tb/result/* ../03_obfuscator/buffer/tb/")
        
        # running obfuscation
        os.system("make -C ../03_obfuscator/ all")
        
        # filling outcoming with the result of the obfuscation
        os.system("cp -r ../03_obfuscator/result/* ../../outcoming/")
        

    # unification and obfuscation  
    elif (UNIFY == "true") and (OBFUSCATE== "true"):
        print("unification and obfuscation")
        
        # setting up the folders
        os.system("make -C ../02_hdl_unifier prepare_dirs")
        os.system("make -C ../03_obfuscator prepare_dirs")
        
        # filling the buffer before unification
        os.system("cp ../../src/result/* ../02_hdl_unifier/buffer/src/")
        os.system("cp ../../tb/result/* ../02_hdl_unifier/buffer/tb/")
        
        # running unification
        os.system("make -C ../02_hdl_unifier/ all")
        
        # filling the buffer before obfuscation with the result of the unification
        os.system("cp -r ../02_hdl_unifier/result/* ../03_obfuscator/buffer/")
        
        # running obfuscation
        os.system("make -C ../03_obfuscator/ all")
        
        # filling outcoming with the result of the obfuscation
        os.system("cp -r ../03_obfuscator/result/* ../../outcoming/")
    
    # no unification nor obfuscation
    # end up here when their is anything else than true in the tested values 
    else:
        print("no unification nor obfuscation")
        
        # filling outcoming
        os.system("cp ../../src/result/* ../../outcoming/src/")
        os.system("cp ../../tb/result/* ../../outcoming/tb/")
        
        

__main__()