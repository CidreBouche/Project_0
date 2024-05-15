# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

# include common.mk
include ../../common/common_utils/common.mk


# clean temp file / dir
clean:
	@$(RM) -r buffer/
	@$(RM) -r result/

# run all targets of this project
all:
	echo 03

### Called by all target ########



### Called by sub-all target ########

# make buffer and result dir
prepare_dirs:
	@mkdir -p buffer/src
	@mkdir -p buffer/tb
	@mkdir -p result/src
	@mkdir -p result/tb