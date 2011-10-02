#
# Appcelerator Titanium Mobile
# Copyright (c) 2011 by Appcelerator, Inc. All Rights Reserved.
# Licensed under the terms of the Apache Public License
# Please see the LICENSE included with this distribution for details.
#
# Source files, and other common properties

GENERATED_DIR := $(LOCAL_PATH)/../../generated
OBJ_DIR = $(THIS_DIR)/../../obj
SRC_JS_DIR := $(LOCAL_PATH)/../js
UI_JS_DIR := $(LOCAL_PATH)/../../../../modules/ui/src/ti/modules/titanium/ui

CFLAGS := $(PROXY_CFLAGS) -I$(GENERATED_DIR) -I$(LOCAL_PATH)/modules -g
ifeq ($(TI_DEBUG),1)
CFLAGS += -DTI_DEBUG=1
endif

LDLIBS := -L$(SYSROOT)/usr/lib -ldl -llog -L$(TARGET_OUT)
ABS_SRC_FILES := \
	$(wildcard $(LOCAL_PATH)/*.cpp) \
	$(wildcard $(LOCAL_PATH)/modules/*.cpp) \
	$(PROXY_SOURCES)

SRC_FILES := $(patsubst $(LOCAL_PATH)/%,%,$(ABS_SRC_FILES))

ABS_JS_FILES := \
	$(GENERATED_DIR)/bootstrap.js \
	$(wildcard $(SRC_JS_DIR)/*.js) \
	$(UI_JS_DIR)/window.js

JS_FILES = $(subst $(SRC_JS_DIR),../js,$(ABS_JS_FILES))

$(LOCAL_PATH)/KrollBindings.cpp: $(GEN_SOURCES)

clean: ti-clean

ti-clean:
	rm -f $(GENERATED_DIR)/*
	rm -rf $(OBJ_DIR)/*