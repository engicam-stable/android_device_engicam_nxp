# from BoardConfig.mk
TARGET_BOOTLOADER_POSTFIX := bin
UBOOT_POST_PROCESS := true

# u-boot target
TARGET_BOOTLOADER_CONFIG := imx8mp:imx8mp_icore_android_defconfig
#TARGET_BOOTLOADER_CONFIG += imx8mp-trusty:imx8mp_evk_android_trusty_defconfig
#TARGET_BOOTLOADER_CONFIG += imx8mp-trusty-secure-unlock:imx8mp_evk_android_trusty_secure_unlock_defconfig
#TARGET_BOOTLOADER_CONFIG += imx8mp-dual:imx8mp_evk_android_dual_defconfig
#TARGET_BOOTLOADER_CONFIG += imx8mp-trusty-dual:imx8mp_evk_android_trusty_dual_defconfig
#TARGET_BOOTLOADER_CONFIG += imx8mp-evk-uuu:imx8mp_evk_android_uuu_defconfig
ifeq ($(POWERSAVE),true)
TARGET_BOOTLOADER_CONFIG += imx8mp-powersave:imx8mp_evk_android_powersave_defconfig
TARGET_BOOTLOADER_CONFIG += imx8mp-trusty-powersave:imx8mp_evk_android_trusty_powersave_defconfig
endif

ifeq ($(IMX8MP_USES_GKI),true)
TARGET_KERNEL_DEFCONFIG := gki_defconfig
  ifeq ($(POWERSAVE),true)
    TARGET_KERNEL_GKI_DEFCONF:= imx8mp_powersave_gki.fragment
  else
    TARGET_KERNEL_GKI_DEFCONF:= imx8mp_icore_gki.fragment
  endif
else
TARGET_KERNEL_DEFCONFIG := imx_v8_android_defconfig
endif

TARGET_KERNEL_ADDITION_DEFCONF := android_addition_defconfig


# absolute path is used, not the same as relative path used in AOSP make
TARGET_DEVICE_DIR := $(patsubst %/, %, $(dir $(realpath $(lastword $(MAKEFILE_LIST)))))

# define bootloader rollback index
BOOTLOADER_RBINDEX ?= 0

