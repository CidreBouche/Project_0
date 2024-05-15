# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

# include common.mk
include ../../common/common_utils/common.mk

# name of the resulting file
RESULTING_FILE_NAME ?= "adder.vhd"


# clean temp file / dir
clean:
	@$(RM) -r buffer/
	@$(RM) -r result/

# run all targets of this project
all:
	@$(MAKE) run_unifier_script

# make buffer and result dir
prepare_dirs:
	@mkdir -p buffer/src
	@mkdir -p buffer/tb
	@mkdir -p result/src
	@mkdir -p result/tb


### Called by all target ########

# run the unifying script
run_unifier_script:
	@python3 hdl_unifier.py $(RESULTING_FILE_NAME)


### Called by sub-all target ########
