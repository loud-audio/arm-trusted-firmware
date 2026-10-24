#
# Copyright (c) 2025 Sipeed
#
# SPDX-License-Identifier: BSD-3-Clause
#

# Allwinner A523 supports Armv8.2 extensions
ARM_ARCH_MAJOR := 8
ARM_ARCH_MINOR := 2

# There are 8 cores in 1 cluster
PLATFORM_MAX_CPUS_PER_CLUSTER := 8

# A523 has new style of watchdog core
STANDALONE_WATCHDOG := 1

# The differences between the platforms are covered by the include files.
include plat/allwinner/common/allwinner-common.mk
include plat/allwinner/common/allwinner-common-a55.mk

# Put NOBITS memory in the first 64K of SRAM A2, overwriting U-Boot's SPL.
SEPARATE_NOBITS_REGION	:=	1

# DL48 #1212: BL31 in DRAM amends the DTB (reserved-memory), which needs the FDT wrappers.
ifeq (${SUNXI_BL31_IN_DRAM},1)
BL31_SOURCES		+=	common/fdt_wrappers.c
endif
