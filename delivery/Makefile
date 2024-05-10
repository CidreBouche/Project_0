# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

# include common.mk
include ../common/common_utils/common.mk

# name of the delivered folder
DELIVERY_FOLDER_NAME := TO_BE_DELIVERED


# clean delivery content
super_clean:
	@$(RM) -r $(DELIVERY_FOLDER_NAME)
	@$(RM) -r $(DELIVERY_FOLDER_NAME).tar.gz

# run all targets to generate the delivery content
all:
	@$(MAKE) copy_outcoming
	@$(MAKE) rm_empty_dir
	@$(MAKE) archive


### Called by all target ########

# copy outoming in the delivery directory
copy_outcoming: check_delivery_dir
	@cp -r ../outcoming/* $(DELIVERY_FOLDER_NAME)

# remove empty directories
rm_empty_dir:
	@for dir in $(DELIVERY_FOLDER_NAME)/*/ ; do \
		if [ -z "$$(ls -A $$dir)" ]; then \
			$(RM) -r $$dir; \
		fi \
	done

# archive the delivery directory in a tar.gz file
archive:
	@tar -czf $(DELIVERY_FOLDER_NAME).tar.gz $(DELIVERY_FOLDER_NAME)


### Called by sub-all target ########

# check if delivery directory exist, if it does not, creates it
check_delivery_dir:
	@if [ ! -d $(DELIVERY_FOLDER_NAME) ]; then \
		mkdir $(DELIVERY_FOLDER_NAME); \
	fi
