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
dist_include_HEADERS = jpeglib.h jmorecfg.h jerror.h
nodist_include_HEADERS = jconfig.h

# documentation, test, and support files
DOCS = README install.doc usage.doc \
	wizard.doc example.c libjpeg.doc structure.doc \
        coderules.doc filelist.doc change.log

dist_man_MANS = cjpeg.1 djpeg.1 jpegtran.1 rdjpgcom.1 wrjpgcom.1 

# Makefile templates.
EXTRA_DIST = 								 \
templates/makefile.cfg	 templates/makefile.ansi templates/makefile.unix \
templates/makefile.bcc	 templates/makefile.mc6  templates/makefile.dj	 \
templates/makefile.wat	 templates/makefile.vc   templates/makelib.ds	 \
templates/makeapps.ds	 templates/makeproj.mac  templates/makcjpeg.st	 \
templates/makdjpeg.st	 templates/makljpeg.st   templates/maktjpeg.st	 \
templates/makefile.manx	 templates/makefile.sas  templates/makefile.mms	 \
templates/makefile.vms	 templates/makvms.opt

# Configuration file templates.
EXTRA_DIST +=								\
templates/jconfig.bcc templates/jconfig.mc6 templates/jconfig.dj	\
templates/jconfig.wat templates/jconfig.vc templates/jconfig.mac	\
templates/jconfig.st templates/jconfig.manx templates/jconfig.sas	\
templates/jconfig.vms

OTHERFILES = jconfig.doc ckconfig.c jmemdosa.asm

TESTFILES = testorig.jpg testimg.ppm testimg.bmp testimg.jpg testprog.jpg \
        testimgp.jpg

EXTRA_DIST += $(DOCS) $(SOURCES) $(OTHERFILES) $(TESTFILES)


## ------------------------- ##
## Programs and test suite.  ##
## ------------------------- ##

AM_LDADD = libjpeg.la
LDADD = $(AM_LDADD)
jpeg_programs = cjpeg djpeg jpegtran rdjpgcom wrjpgcom

cjpeg_SOURCES = cjpeg.c rdppm.c rdgif.c rdtarga.c rdrle.c rdbmp.c rdswitch.c \
        cdjpeg.c
djpeg_SOURCES = djpeg.c wrppm.c wrgif.c wrtarga.c wrrle.c wrbmp.c rdcolmap.c \
        cdjpeg.c
jpegtran_SOURCES = jpegtran.c rdswitch.c cdjpeg.c transupp.c


if PROGRAMS
bin_PROGRAMS = $(jpeg_programs)
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
else
EXTRA_PROGRAMS = $(jpeg_programs)
endif
