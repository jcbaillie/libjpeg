# Makefile for Independent JPEG Group's software

# This makefile is suitable for Unix-like systems with non-ANSI compilers.
# If you have an ANSI compiler, makefile.ansi is a better starting point.

# Read installation instructions before saying "make" !!

# source files: JPEG library proper
lib_LTLIBRARIES = libjpeg.la

libjpeg_la_SOURCES = \
	jcapimin.c jcapistd.c jccoefct.c jccolor.c jcdctmgr.c jchuff.c \
        jcinit.c jcmainct.c jcmarker.c jcmaster.c jcomapi.c jcparam.c \
        jcphuff.c jcprepct.c jcsample.c jctrans.c jdapimin.c jdapistd.c \
        jdatadst.c jdatasrc.c jdcoefct.c jdcolor.c jddctmgr.c jdhuff.c \
        jdinput.c jdmainct.c jdmarker.c jdmaster.c jdmerge.c jdphuff.c \
        jdpostct.c jdsample.c jdtrans.c jerror.c jfdctflt.c jfdctfst.c \
        jfdctint.c jidctflt.c jidctfst.c jidctint.c jidctred.c jquant1.c \
        jquant2.c jutils.c jmemmgr.c
libjpeg_la_SOURCES += \
	jchuff.h jdhuff.h jdct.h jerror.h jinclude.h jmemsys.h jmorecfg.h \
        jpegint.h jpeglib.h jversion.h cdjpeg.h cderror.h transupp.h
libjpeg_la_LIBADD = \
	$(SYSDEPMEM)
libjpeg_la_DEPENDENCIES = \
	$(SYSDEPMEM)

# memmgr back ends: compile only one of these into a working library
SYSDEPSOURCES = jmemansi.c jmemname.c jmemnobs.c jmemdos.c jmemmac.c
EXTRA_libjpeg_la_SOURCES = $(SYSDEPSOURCES)

# source files: cjpeg/djpeg/jpegtran applications, also rdjpgcom/wrjpgcom
APPSOURCES = cjpeg.c djpeg.c jpegtran.c rdjpgcom.c wrjpgcom.c cdjpeg.c \
        rdcolmap.c rdswitch.c transupp.c rdppm.c wrppm.c rdgif.c wrgif.c \
        rdtarga.c wrtarga.c rdbmp.c wrbmp.c rdrle.c wrrle.c
SOURCES = $(LIBSOURCES) $(SYSDEPSOURCES) $(APPSOURCES)

# files included by source files
dist_include_HEADERS = jconfig.h jpeglib.h jmorecfg.h jerror.h

# documentation, test, and support files
DOCS = README install.doc usage.doc \
	wizard.doc example.c libjpeg.doc structure.doc \
        coderules.doc filelist.doc change.log

dist_man_MANS = cjpeg.1 djpeg.1 jpegtran.1 rdjpgcom.1 wrjpgcom.1 

MKFILES = makefile.cfg makefile.ansi makefile.unix makefile.bcc \
        makefile.mc6 makefile.dj makefile.wat makefile.vc makelib.ds \
        makeapps.ds makeproj.mac makcjpeg.st makdjpeg.st makljpeg.st \
        maktjpeg.st makefile.manx makefile.sas makefile.mms makefile.vms \
        makvms.opt

CONFIGFILES = jconfig.cfg jconfig.bcc jconfig.mc6 jconfig.dj jconfig.wat \
        jconfig.vc jconfig.mac jconfig.st jconfig.manx jconfig.sas \
        jconfig.vms

OTHERFILES = jconfig.doc ckconfig.c jmemdosa.asm

TESTFILES = testorig.jpg testimg.ppm testimg.bmp testimg.jpg testprog.jpg \
        testimgp.jpg

EXTRA_DIST = $(DOCS) $(MKFILES) $(CONFIGFILES) $(SOURCES) $(INCLUDES) \
        $(OTHERFILES) $(TESTFILES)

# library object files common to compression and decompression
#COMOBJECTS= jcomapi.o jutils.o jerror.o jmemmgr.o $(SYSDEPMEM)

# compression library object files
#CLIBOBJECTS= jcapimin.o jcapistd.o jctrans.o jcparam.o jdatadst.o jcinit.o \
#        jcmaster.o jcmarker.o jcmainct.o jcprepct.o jccoefct.o jccolor.o \
#        jcsample.o jchuff.o jcphuff.o jcdctmgr.o jfdctfst.o jfdctflt.o \
#        jfdctint.o

# decompression library object files
#DLIBOBJECTS= jdapimin.o jdapistd.o jdtrans.o jdatasrc.o jdmaster.o \
#        jdinput.o jdmarker.o jdhuff.o jdphuff.o jdmainct.o jdcoefct.o \
#        jdpostct.o jddctmgr.o jidctfst.o jidctflt.o jidctint.o jidctred.o \
#        jdsample.o jdcolor.o jquant1.o jquant2.o jdmerge.o

# These objectfiles are included in libjpeg.a
#LIBOBJECTS = $(CLIBOBJECTS) $(DLIBOBJECTS) $(COMOBJECTS)

# object files for sample applications (excluding library files)
#COBJECTS= cjpeg.o rdppm.o rdgif.o rdtarga.o rdrle.o rdbmp.o rdswitch.o \
#        cdjpeg.o
#DOBJECTS= djpeg.o wrppm.o wrgif.o wrtarga.o wrrle.o wrbmp.o rdcolmap.o \
#        cdjpeg.o
#TROBJECTS= 

AM_LDADD = libjpeg.la
LDADD = $(AM_LDADD)
bin_PROGRAMS = cjpeg djpeg jpegtran rdjpgcom wrjpgcom

cjpeg_SOURCES = cjpeg.c rdppm.c rdgif.c rdtarga.c rdrle.c rdbmp.c rdswitch.c \
        cdjpeg.c
djpeg_SOURCES = djpeg.c wrppm.c wrgif.c wrtarga.c wrrle.c wrbmp.c rdcolmap.c \
        cdjpeg.c
jpegtran_SOURCES = jpegtran.c rdswitch.c cdjpeg.c transupp.c

jconfig.h: jconfig.doc
	echo You must prepare a system-dependent jconfig.h file.
	echo Please read the installation directions in install.doc.
	exit 1

check-local: cjpeg djpeg jpegtran
	$(RM) testout*
	./djpeg -dct int -ppm -outfile testout.ppm $(srcdir)/testorig.jpg
	./djpeg -dct int -bmp -colors 256 -outfile testout.bmp $(srcdir)/testorig.jpg
	./cjpeg -dct int -outfile testout.jpg $(srcdir)/testimg.ppm
	./djpeg -dct int -ppm -outfile testoutp.ppm $(srcdir)/testprog.jpg
	./cjpeg -dct int -progressive -opt -outfile testoutp.jpg $(srcdir)/testimg.ppm
	./jpegtran -outfile testoutt.jpg $(srcdir)/testprog.jpg
	cmp $(srcdir)/testimg.ppm testout.ppm
	cmp $(srcdir)/testimg.bmp testout.bmp
	cmp $(srcdir)/testimg.jpg testout.jpg
	cmp $(srcdir)/testimg.ppm testoutp.ppm
	cmp $(srcdir)/testimgp.jpg testoutp.jpg
	cmp $(srcdir)/testorig.jpg testoutt.jpg
CLEANFILES = testout*
