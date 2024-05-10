# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

include ../common/common_utils/common.mk


.PHONY: all clean

clean:
	@$(RM) -r result/
	@$(RM) -r script/__pycache__

all: copy_src build_src


check_result_dir:
	@if [ ! -d "result" ]; then \
		mkdir result/; \
	fi

copy_src: check_result_dir
	@cp src/* result/

build_src: check_result_dir
	@python3 script/src_builder.py