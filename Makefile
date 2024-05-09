# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

include common/common_utils/common.mk


.PHONY: all clean

clean:
	@$(MAKE) -C src/ clean
	@$(MAKE) -C tb/ clean

super_clean: clean
	@$(RM) -r outcoming/

all: 
	@$(MAKE) elaborate
	# @$(MAKE) behavioral_sim
	# @$(MAKE) syn
	# @$(MAKE) post_syn_sim

elaborate: check_outcoming_dir
	@$(MAKE) -C src/ all
	@cp src/result/* outcoming/rtl
	@$(MAKE) -C tb/ all
	@cp tb/result/* outcoming/tb
	

behavioral_sim:
	# ====================================== #
	# Not implemented yet and might never be #
	# ====================================== #

syn:
	# ====================================== #
	# Not implemented yet and might never be #
	# ====================================== #

post_syn_sim:
	# ====================================== #
	# Not implemented yet and might never be #
	# ====================================== #


# Insert text here because the following targets are not the same to me than the ones above
check_outcoming_dir:
	@if [ ! -d "outcoming" ]; then \
		mkdir outcoming; \
		mkdir outcoming/rtl; \
		mkdir outcoming/tb; \
		mkdir outcoming/doc; \
	fi


#######################################
test_colors:
	@echo "\033[37mWhite Text\033[0m"
	@echo "\033[44mBlue Background\033[0m"
	@echo "\033[37;44mWhite Text on Blue Background\033[0m"