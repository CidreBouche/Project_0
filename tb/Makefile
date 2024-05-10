# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

# include common.mk
include ../common/common_utils/common.mk


# clean temp file / dir
clean:
	@$(RM) -r result/
	@$(RM) -r script/__pycache__

# run all targets to generate the tb
all: copy_tb build_tb


### Called by all target ########

# copy existing tb to result folder
copy_tb: check_result_dir
	@cp src/* result/

# build testbenches using templates
build_tb: check_result_dir
	@python3 script/tb_builder.py


### Called by sub-all target ########

# check if result dir exist, if it does not, creates it
check_result_dir:
	@if [ ! -d "result" ]; then \
		mkdir result/; \
	fi