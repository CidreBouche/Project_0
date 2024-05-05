# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

include ../common/common.mk


.PHONY: all clean

clean:
	@$(RM) -r result/
	# @$(RM) -r *__pycache__

all: clean check_result_dir copy_tb build_tb

check_result_dir:
	@if [ ! -d "result" ]; then \
		mkdir result/; \
	fi

copy_tb: check_result_dir
	@cp src/* result/

build_tb: check_result_dir
	@python3 script/tb_builder.py





#######################################
test_colors:
	@echo "\033[37mWhite Text\033[0m"
	@echo "\033[44mBlue Background\033[0m"
	@echo "\033[37;44mWhite Text on Blue Background\033[0m"