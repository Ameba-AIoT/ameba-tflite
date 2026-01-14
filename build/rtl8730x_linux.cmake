# 配置 ARM 交叉编译
set(CMAKE_SYSTEM_NAME Linux)       #设置目标系统名字
set(CMAKE_SYSTEM_PROCESSOR "armv7") #设置目标处理器架构
set(CMAKE_CROSSCOMPILING FALSE)

set(CMAKE_CXX_STANDARD 11)  # 将 C++ 标准设置为 C++ 11
set(CMAKE_CXX_STANDARD_REQUIRED ON)  # C++ 11 是强制要求，不会衰退至低版本
set(CMAKE_CXX_EXTENSIONS OFF)  # 禁止使用编译器特有扩展

set(YOCTO_NDK_HOME  /opt/yocto/toolchain/gcc-yocto-11.3.0-a32hf-neon-arm-linux-gnueabi/sysroots)
set(YOCTO_TOOLCHAIN ${YOCTO_NDK_HOME}/x86_64-rtksdk-linux/usr)
set(YOCTO_PLATFORM  ${YOCTO_NDK_HOME}/cortexa32hf-neon-rtk-linux-gnueabi)
set(YOCTO_STL       ${YOCTO_NDK_HOME}/cortexa32hf-neon-rtk-linux-gnueabi/usr/include/c++/11.3.0)
set(YOCTO_NDK_PREFIX arm-rtk-linux-gnueabi/arm-rtk-linux-gnueabi-)
set(ARM_FLAGS  " -mcpu=cortex-a32 -march=armv8-a+crc -mfpu=neon -mfloat-abi=hard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security -fPIC")

#set(ARM_FLAGS  " -mfpu=neon -mfloat-abi=hard -fstack-protector-strong  -O2 -D_FORTIFY_SOURCE=2 -Wformat -Wformat-security -Werror=format-security")

string(CONCAT ARM_FLAGS        ${ARM_FLAGS}       " --sysroot=${YOCTO_PLATFORM}")
string(CONCAT ARM_FLAGS        ${ARM_FLAGS}       " -I${YOCTO_STL} -I${YOCTO_STL}/arm-rtk-linux-gnueabi")
string(CONCAT CMAKE_C_FLAGS    ${CMAKE_C_FLAGS}   ${ARM_FLAGS})
string(CONCAT CMAKE_CXX_FLAGS  ${CMAKE_CXX_FLAGS} ${ARM_FLAGS})
string(CONCAT CMAKE_AS_FLAGS   ${CMAKE_AS_FLAGS}  ${ARM_FLAGS})

#set( CMAKE_ASM_FLAGS ${CMAKE_C_FLAGS} CACHE STRING "" FORCE )
#set(CMAKE_C_LINK_FLAGS      " --sysroot=${YOCTO_PLATFORM} -pie -fPIE")
#set(CMAKE_CXX_LINK_FLAGS    " --sysroot=${YOCTO_PLATFORM} -pie -fPIE")
set(CMAKE_C_LINK_FLAGS      " --sysroot=${YOCTO_PLATFORM} -L${YOCTO_PLATFORM}/usr/lib -pie -fPIE")
set(CMAKE_CXX_LINK_FLAGS    " --sysroot=${YOCTO_PLATFORM} -L${YOCTO_PLATFORM}/usr/lib -pie -fPIE")

set(CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS "${CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS} -shared")
#set(CMAKE_CXX_CREATE_SHARED_LIBRARY "<CMAKE_CXX_COMPILER> <LANGUAGE_COMPILE_FLAGS> <CMAKE_SHARED_LIBRARY_CREATE_CXX_FLAGS> <LINK_FLAGS> -o <TARGET> <OBJECTS> -lstdc++")
set(CMAKE_SKIP_BUILD_RPATH TRUE)

set(CMAKE_SYSROOT      "${YOCTO_NDK_HOME}/cortexa32hf-neon-rtk-linux-gnueabi")
set(CMAKE_C_COMPILER   "${YOCTO_TOOLCHAIN}/bin/${YOCTO_NDK_PREFIX}gcc")
set(CMAKE_CXX_COMPILER "${YOCTO_TOOLCHAIN}/bin/${YOCTO_NDK_PREFIX}g++")
set(CMAKE_RANLIB       "${YOCTO_TOOLCHAIN}/bin/${YOCTO_NDK_PREFIX}ranlib")
set(CMAKE_AR           "${YOCTO_TOOLCHAIN}/bin/${YOCTO_NDK_PREFIX}ar")
set(CMAKE_AS           "${YOCTO_TOOLCHAIN}/bin/${YOCTO_NDK_PREFIX}as")

