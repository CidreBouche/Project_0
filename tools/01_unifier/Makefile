# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

# include common.mk
include ../../common/common_utils/common.mk

# boolean to indicate if we want to unify the rtl or not (boolean so accepted values are true and false)
UNIFY ?= true
# name of the resulting file
RESULTING_FILE_NAME ?= "adder.vhd"


# clean temp file / dir
clean:
	@$(RM) -r buffer/
	@$(RM) -r result/

# run all targets of this project
all:
	@$(MAKE) prepare_dirs
	@$(MAKE) fetch_inputs
ifeq ($(UNIFY),true)
# Running unification
	@echo Running unification
	@$(MAKE) run_unifier_script
else
# No unification so preparing for next step
	@echo No unification
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
	@cp -f ../../src/result/* ../01_unifier/buffer/src/
	@cp -f ../../tb/result/* ../01_unifier/buffer/tb/

# copy inputs to outputs because unification is not done
buffer_to_result:
	@cp -f buffer/src/* result/src/
	@cp -f buffer/tb/* result/tb/

# run the unifying script if needed
run_unifier_script:
	@echo Run unifier_script
	@python3 unifier.py $(RESULTING_FILE_NAME)


### Called by sub-all target ########
