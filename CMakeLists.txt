cmake_minimum_required(VERSION 2.8.0)
project(libjpeg)

find_package(qibuild)

qi_sanitize_compile_flags(HIDDEN_SYMBOLS)

include_directories(${CMAKE_CURRENT_SOURCE_DIR})

set(SOURCES
  jaricom.c jcapimin.c jcapistd.c jcarith.c jccoefct.c jccolor.c
  jcdctmgr.c jchuff.c jcinit.c jcmainct.c jcmarker.c jcmaster.c
  jcomapi.c jcparam.c jcprepct.c jcsample.c jctrans.c jdapimin.c
  jdapistd.c jdarith.c jdatadst.c jdatasrc.c jdcoefct.c jdcolor.c
  jddctmgr.c jdhuff.c jdinput.c jdmainct.c jdmarker.c jdmaster.c
  jdmerge.c jdpostct.c jdsample.c jdtrans.c jerror.c jfdctflt.c
  jfdctfst.c jfdctint.c jidctflt.c jidctfst.c jidctint.c jquant1.c
  jquant2.c jutils.c jmemmgr.c jmemnobs.c
  )
qi_create_lib(qijpeg STATIC ${SOURCES})
qi_stage_lib(qijpeg)
