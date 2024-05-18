# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

# include common.mk
include ../../common/common_utils/common.mk

# boolean to indicate if we want to obfuscate the rtl or not (boolean so accepted values are true and false)
OBFUSCATE ?= true


# clean temp file / dir
clean:
	@$(RM) -r buffer/
	@$(RM) -r result/

# run all targets of this project
all:
ifeq ($(OBFUSCATE),true)
# Running obfuscation
	@echo Running obfuscation
	@$(MAKE) prepare_dirs
	@$(MAKE) fetch_inputs
	@$(MAKE) run_obfuscation_script
else
# No obfuscation so preparing for next step
	@echo No obfuscation
	@$(MAKE) buffer_to_result
endif


### Called by all target ########

# make buffer and result dir
prepare_dirs:
	@mkdir -p buffer/src
	@mkdir -p buffer/tb
	@mkdir -p result/src
	@mkdir -p result/tb

# fetch inputs from src
fetch_inputs:
	@cp -f ../01_unifier/result/src/* ../02_obfuscator/buffer/src/
	@cp -f ../01_unifier/result/tb/* ../02_obfuscator/buffer/tb/

# copy inputs to outputs because unification is not done
buffer_to_result:
	@cp -f buffer/src/* result/src/
	@cp -f buffer/tb/* result/tb/

# run the script that obfuscate the RTL
run_obfuscation_script:



### Called by sub-all target ########
