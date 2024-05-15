# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

# include common.mk
include ../common/common_utils/common.mk


# clean temp file / dir
clean:
	@$(RM) -r result/
	@$(RM) -r script/__pycache__

# run all targets to generate the src
all: 
	@$(MAKE) copy_src
	@$(MAKE) build_src

### Called by all target ########

# copy existing src to result folder
copy_src: prepare_result_dir
	@cp src/* result/

# build sources using templates
build_src: prepare_result_dir
	@python3 script/src_builder.py


### Called by sub-all target ########

# make the result dir
prepare_result_dir:
	@mkdir -p result/
