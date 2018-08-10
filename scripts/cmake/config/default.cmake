#
# Bareflank Hypervisor
# Copyright (C) 2018 Assured Information Security, Inc.
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA

# include(${CMAKE_CURRENT_LIST_DIR}/../macros.cmake)

# ------------------------------------------------------------------------------
# Source tree
# ------------------------------------------------------------------------------

set(HAVOC_SRC_ROOT_DIR ${CMAKE_CURRENT_LIST_DIR}/../../..
    CACHE INTERNAL
    "Havoc source root directory"
)

set(HAVOC_SRC_CONFIG_DIR ${HAVOC_SRC_ROOT_DIR}/config
    CACHE INTERNAL
    "Directory for storing build config.in files for guests"
)

set(HAVOC_SRC_CMAKE_DIR ${HAVOC_SRC_ROOT_DIR}/scripts/cmake
    CACHE INTERNAL
    "CMake root directory"
)

set(HAVOC_SRC_CMAKE_DEPENDS_DIR ${HAVOC_SRC_CMAKE_DIR}/depends
    CACHE INTERNAL
    "CMake depends directory"
)

# ------------------------------------------------------------------------------
# Links
# ------------------------------------------------------------------------------

set(LINUX_URL "https://git.kernel.org/torvalds/t/linux-4.18-rc8.tar.gz"
    CACHE INTERNAL FORCE
    "Linux URL"
)

set(LINUX_URL_MD5 "95478cfbfbffac542c847a76199b4541"
    CACHE INTERNAL FORCE
    "Linux URL MD5 hash"
)

set(GCC_URL "https://ftp.gnu.org/gnu/gcc/gcc-7.3.0/gcc-7.3.0.tar.gz"
    CACHE INTERNAL FORCE
    "GCC URL"
)

set(GCC_URL_MD5 "747d5010b7c6938b480bc6e4d7c4be9a"
    CACHE INTERNAL FORCE
    "GCC URL MD5 hash"
)

set(GMP_URL "https://gmplib.org/download/gmp/gmp-6.1.2.tar.xz"
    CACHE INTERNAL FORCE
    "GMP URL"
)

set(GMP_URL_MD5 "f58fa8001d60c4c77595fbbb62b63c1d"
    CACHE INTERNAL FORCE
    "GMP URL MD5 hash"
)

set(MPFR_URL "https://www.mpfr.org/mpfr-current/mpfr-4.0.1.tar.xz"
    CACHE INTERNAL FORCE
    "MPFR URL"
)

set(MPFR_URL_MD5 "b8dd19bd9bb1ec8831a6a582a7308073"
    CACHE INTERNAL FORCE
    "MPFR URL MD5 hash"
)

set(MPC_URL "https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz"
    CACHE INTERNAL FORCE
    "MPC URL"
)

set(MPC_URL_MD5 "4125404e41e482ec68282a2e687f6c73"
    CACHE INTERNAL FORCE
    "MPC URL MD5 hash"
)

# ------------------------------------------------------------------------------
# Linux guest configs
# ------------------------------------------------------------------------------

add_config(
    CONFIG_NAME LINUX_BUILD_DIR
    CONFIG_TYPE STRING
    DEFAULT_VAL ${DEPENDS_DIR}/linux/${USERSPACE_PREFIX}/build
    DESCRIPTION "The build directory for the guest kernel"
)

add_config(
    CONFIG_NAME LINUX_CONFIG_IN
    CONFIG_TYPE STRING
    DEFAULT_VAL ${HAVOC_SRC_CONFIG_DIR}/linux/tiny.config.in
    DESCRIPTION "The .config file for the guest kernel"
)

add_config(
    CONFIG_NAME LINUX_INITRAMFS_IN
    CONFIG_TYPE STRING
    DEFAULT_VAL ${HAVOC_SRC_CONFIG_DIR}/linux/tiny.initramfs.in
    DESCRIPTION "The input to linux' usr/gen_init_cpio binary"
)

add_config(
    CONFIG_NAME LINUX_INITRAMFS_ROOT
    CONFIG_TYPE STRING
    DEFAULT_VAL ""
    DESCRIPTION "The root of the initramfs to build"
)

add_config(
    CONFIG_NAME LINUX_INITRAMFS_IMAGE
    CONFIG_TYPE STRING
    DEFAULT_VAL ""
    DESCRIPTION "Path to an existing initramfs image fit for the guest kernel"
)
