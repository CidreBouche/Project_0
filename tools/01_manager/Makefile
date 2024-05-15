# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

# include common.mk
include ../../common/common_utils/common.mk

# boolean to indicate if we want to unify the rtl or not (boolean so accepted values are true and false)
UNIFY ?= true
# boolean to indicate if we want to obfuscate the rtl or not (boolean so accepted values are true and false)
OBFUSCATE ?= false


# run all targets of this project
all: 
	@$(MAKE) run_manager_script


### Called by all target ########

# run the python doing the management
run_manager_script:
	python3 manager.py $(UNIFY) $(OBFUSCATE)


### Called by sub-all target ########
