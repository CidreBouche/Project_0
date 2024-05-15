# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

# include common.mk
include common/common_utils/common.mk

# boolean to indicate if we want to unify the rtl or not (boolean so accepted values are true and false)
UNIFY ?= true
# boolean to indicate if we want to obfuscate the rtl or not (boolean so accepted values are true and false)
OBFUSCATE ?= false


# run clean target in child dir
clean:
	@$(MAKE) -C src/ clean
	@$(MAKE) -C tb/ clean
	@$(MAKE) -C tools/01_manager clean
	@$(MAKE) -C tools/02_hdl_unifier clean
	@$(MAKE) -C tools/03_obfuscator clean

# run clean and remove outcoming and delivery dirs
super_clean: clean
	@$(MAKE) -C delivery/ super_clean
	@$(RM) -r outcoming/

# run all targets of this project
all: 
	@$(MAKE) elaborate
	# @$(MAKE) behavioral_sim
	# @$(MAKE) syn
	# @$(MAKE) post_syn_sim
	# @$(MAKE) pack


### Called by all target ########

# build everything
elaborate: prepare_outcoming_dir
	@$(MAKE) -C src/ all
	@$(MAKE) -C tb/ all
	@$(MAKE) -C tools/01_manager all UNIFY=$(UNIFY) OBFUSCATE=$(OBFUSCATE)

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

# make the outcoming dir and it's childs
prepare_outcoming_dir:
	mkdir -p outcoming/src
	mkdir -p outcoming/tb
	mkdir -p outcoming/doc




#######################################
# TEST
#######################################
test_colors:
	@echo "\033[37mWhite Text\033[0m"
	@echo "\033[44mBlue Background\033[0m"
	@echo "\033[37;44mWhite Text on Blue Background\033[0m"