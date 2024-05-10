# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

# include common.mk
include common/common_utils/common.mk


# run clean target in child dir
clean:
	@$(MAKE) -C src/ clean
	@$(MAKE) -C tb/ clean

# run clean and remove outcoming and delivery dirss
super_clean: clean
	@$(MAKE) -C delivery/ super_clean
	@$(RM) -r outcoming/

# run all targets of this project
all: 
	@$(MAKE) elaborate
	# @$(MAKE) behavioral_sim
	# @$(MAKE) syn
	# @$(MAKE) post_syn_sim
	@$(MAKE) pack


### Called by all target ########

# build everything
elaborate: check_outcoming_dir
	@$(MAKE) -C src/ all
	@cp src/result/* outcoming/rtl
	@$(MAKE) -C tb/ all
	@cp tb/result/* outcoming/tb

# run behavioral sim
behavioral_sim:
	# ====================================== #
	# Not implemented yet and might never be #
	# ====================================== #

# run synthesis
syn:
	# ====================================== #
	# Not implemented yet and might never be #
	# ====================================== #

# run post synthesis sim - requirement : syn
post_syn_sim:
	# ====================================== #
	# Not implemented yet and might never be #
	# ====================================== #

# prepare the delivery
pack:
	@$(MAKE) -C delivery/ all


### Called by sub-all target ########

# check if the outcoming dir exist, if it does not, creates it and all it's childs
check_outcoming_dir:
	@if [ ! -d "outcoming" ]; then \
		mkdir outcoming; \
		mkdir outcoming/rtl; \
		mkdir outcoming/tb; \
		mkdir outcoming/doc; \
	fi




#######################################
# TEST
#######################################
test_colors:
	@echo "\033[37mWhite Text\033[0m"
	@echo "\033[44mBlue Background\033[0m"
	@echo "\033[37;44mWhite Text on Blue Background\033[0m"