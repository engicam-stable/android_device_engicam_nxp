LOCAL_PATH := $(call my-dir)

$(shell rm -rf $(TARGET_OUT_VENDOR)/firmware/brcm)
$(shell mkdir -p $(TARGET_OUT_VENDOR)/firmware/brcm)
$(shell cp -rf $(LOCAL_PATH)/firmware/* $(TARGET_OUT_VENDOR)/firmware/)
