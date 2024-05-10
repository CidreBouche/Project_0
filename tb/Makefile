# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

include ../common/common_utils/common.mk


.PHONY: all clean

clean:
	@$(RM) -r result/
	@$(RM) -r script/__pycache__

all: copy_tb build_tb


check_result_dir:
	@if [ ! -d "result" ]; then \
		mkdir result/; \
	fi

copy_tb: check_result_dir
	@cp src/* result/

build_tb: check_result_dir
	@python3 script/tb_builder.py