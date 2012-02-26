#
#   Makefile S3C Camera driver
#
#   Copyright(c) 2004-2006, Samsung Electronics, Co., Ltd.
#

EXTRA_CFLAGS 	+= -DCONFIG_VIDEO_SAMSUNG_S5K4CA  

obj-m			:= s3c_camera.o

s3c_camera-y	:= s3c_camif.o s3c_camera_driver.o s5k4ca.o

all:
	@echo "$(MAKE) --no-print-directory -C $(KDIR) SUBDIRS=$(CURDIR) modules"
	@$(MAKE) --no-print-directory -C $(KDIR) \
		M=$(shell pwd) modules

clean:
	rm -rf *.o *.ko *.mod.c *~ .*.cmd Module.symvers modules.order .tmp_versions .*.o.d	

install:
	@$(MAKE) --no-print-directory -C $(KDIR) \
		SUBDIRS=$(CURDIR) modules_install
