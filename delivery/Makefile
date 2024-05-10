# ========================== #
#  Author : Baptiste Durand  #
# ========================== #

include ../common/common_utils/common.mk

DELIVERY_FOLDER_NAME := TO_BE_DELIVERED


.PHONY: all

super_clean:
	@$(RM) -r $(DELIVERY_FOLDER_NAME)
	@$(RM) -r $(DELIVERY_FOLDER_NAME).tar.gz

all:
	@$(MAKE) check_delivery_dir
	@$(MAKE) prepare_delivery
	@$(MAKE) rm_empty_dir
	@$(MAKE) archive


### Called by all target ########

check_delivery_dir:
	@if [ ! -d $(DELIVERY_FOLDER_NAME) ]; then \
		mkdir $(DELIVERY_FOLDER_NAME); \
	fi

prepare_delivery:
	@cp -r ../outcoming/* $(DELIVERY_FOLDER_NAME)

rm_empty_dir:
	@for dir in $(DELIVERY_FOLDER_NAME)/*/ ; do \
		if [ -z "$$(ls -A $$dir)" ]; then \
			$(RM) -r $$dir; \
		fi \
	done

archive:
	@tar -czf $(DELIVERY_FOLDER_NAME).tar.gz $(DELIVERY_FOLDER_NAME)