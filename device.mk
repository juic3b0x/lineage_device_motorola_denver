#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Include GSI keys
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# A/B
PRODUCT_PACKAGES += \
    android.hardware.boot@1.2-impl \
    android.hardware.boot@1.2-impl.recovery \
    android.hardware.boot@1.2-service

PRODUCT_PACKAGES += \
    update_engine \
    update_engine_sideload \
    update_verifier

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_system=true \
    POSTINSTALL_PATH_system=system/bin/otapreopt_script \
    FILESYSTEM_TYPE_system=ext4 \
    POSTINSTALL_OPTIONAL_system=true

AB_OTA_POSTINSTALL_CONFIG += \
    RUN_POSTINSTALL_vendor=true \
    POSTINSTALL_PATH_vendor=bin/checkpoint_gc \
    FILESYSTEM_TYPE_vendor=ext4 \
    POSTINSTALL_OPTIONAL_vendor=true

PRODUCT_PACKAGES += \
    checkpoint_gc \
    otapreopt_script

# fastbootd
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.1-impl-mock \
    fastbootd

# Health
PRODUCT_PACKAGES += \
    android.hardware.health@2.1-impl \
    android.hardware.health@2.1-service

# Overlays
PRODUCT_ENFORCE_RRO_TARGETS := *

# Partitions
PRODUCT_BUILD_SUPER_PARTITION := false
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Product characteristics
PRODUCT_CHARACTERISTICS := default

# Rootdir
PRODUCT_PACKAGES += \
    init.qcom.early_boot.sh \
    init.qcom.usb.sh \
    init.mmi.usb.sh \
    apanic_save.sh \
    init.qti.chg_policy.sh \
    apanic_copy.sh \
    init.gbmods.sh \
    init.qcom.coex.sh \
    pstore_annotate.sh \
    init.mmi.wlan-getlogs.sh \
    init.qti.kernel.debug-blair.sh \
    init.qcom.efs.sync.sh \
    init.kernel.post_boot.sh \
    init.kernel.post_boot-holi.sh \
    hardware_revisions.sh \
    apanic_annotate.sh \
    init.class_main.sh \
    init.qcom.post_boot.sh \
    init.mmi.modules.sh \
    init.qti.qcv.sh \
    init.mmi.touch.sh \
    init.qti.kernel.sh \
    qca6234-service.sh \
    init.mmi.boot.sh \
    init.qti.display_boot.sh \
    init.qti.kernel.debug-holi.sh \
    init.qcom.sh \
    init.mdm.sh \
    init.qti.media.sh \
    vendor_modprobe.sh \
    init.qcom.sdio.sh \
    init.oem.hw.sh \
    init.mmi.block_perm.sh \
    init.mmi.mdlog-getlogs.sh \
    init.crda.sh \
    init.qcom.sensors.sh \
    init.mmi.shutdown.sh \
    init.oem.fingerprint2.sh \
    init.qcom.class_core.sh \
    init.kernel.post_boot-blair.sh \
    init.qti.kernel.debug.sh \

PRODUCT_PACKAGES += \
    fstab.qcom \
    init.mmi.debug.rc \
    init.qcom.usb.rc \
    init.target.rc \
    init.mmi.tcmd.rc \
    init.mmi.diag_mdlog.rc \
    init.mmi.wlan.rc \
    init.qti.ufs.rc \
    init.mmi.usb.rc \
    init.mmi.diag.rc \
    init.qcom.rc \
    init.qti.kernel.rc \
    init.mmi.overlay.rc \
    init.mmi.chipset.rc \
    init.mmi.rc \
    init.mmi.charge_only.rc \
    init.qcom.factory.rc \
    init.recovery.qcom.rc \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/etc/fstab.qcom:$(TARGET_COPY_OUT_RAMDISK)/fstab.qcom

# Shipping API level
PRODUCT_SHIPPING_API_LEVEL := 30

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)

# Inherit the proprietary files
$(call inherit-product, vendor/motorola/denver/denver-vendor.mk)
