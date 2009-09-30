# Makefile for Independent JPEG Group's software
CLEANFILES =
EXTRA_DIST =

# Work around libtool issues.
build_aux_dir = $(top_srcdir)/build-aux
include build-aux/fix-libtool-la.mk

# That's where aclocal extensions are.
ACLOCAL_AMFLAGS = -I build-aux

# source files: JPEG library proper
if INSTALL_LIBRARY
lib_LTLIBRARIES = libjpeg.la
else
noinst_LTLIBRARIES = libjpeg.la
endif

libjpeg_la_SOURCES =							\
  jcapimin.c jcapistd.c jccoefct.c jccolor.c jcdctmgr.c jchuff.c	\
  jcinit.c jcmainct.c jcmarker.c jcmaster.c jcomapi.c jcparam.c		\
  jcphuff.c jcprepct.c jcsample.c jctrans.c jdapimin.c jdapistd.c	\
  jdatadst.c jdatasrc.c jdcoefct.c jdcolor.c jddctmgr.c jdhuff.c	\
  jdinput.c jdmainct.c jdmarker.c jdmaster.c jdmerge.c jdphuff.c	\
  jdpostct.c jdsample.c jdtrans.c jerror.c jfdctflt.c jfdctfst.c	\
  jfdctint.c jidctflt.c jidctfst.c jidctint.c jidctred.c jquant1.c	\
  jquant2.c jutils.c jmemmgr.c
libjpeg_la_SOURCES +=							\
  jchuff.h jdhuff.h jdct.h jerror.h jinclude.h jmemsys.h jmorecfg.h	\
  jpegint.h jpeglib.h jversion.h cdjpeg.h cderror.h transupp.h
# Export the shared library symbols.
libjpeg_la_CPPFLAGS = -DBUILDING_JPEG
libjpeg_la_LDFLAGS = -no-undefined -avoid-version
libjpeg_la_LIBADD =				\
  $(SYSDEPMEM)
libjpeg_la_DEPENDENCIES =			\
  $(SYSDEPMEM) jconfig.h

# memmgr back ends: compile only one of these into a working library
SYSDEPSOURCES = jmemansi.c jmemname.c jmemnobs.c jmemdos.c jmemmac.c
EXTRA_libjpeg_la_SOURCES = $(SYSDEPSOURCES)

# source files: cjpeg/djpeg/jpegtran applications, also rdjpgcom/wrjpgcom
APPSOURCES = cjpeg.c djpeg.c jpegtran.c rdjpgcom.c wrjpgcom.c cdjpeg.c	\
  rdcolmap.c rdswitch.c transupp.c rdppm.c wrppm.c rdgif.c wrgif.c	\
  rdtarga.c wrtarga.c rdbmp.c wrbmp.c rdrle.c wrrle.c
SOURCES = $(LIBSOURCES) $(SYSDEPSOURCES) $(APPSOURCES)

# files included by source files
dist_include_HEADERS = jpeglib.h jmorecfg.h jerror.h
nodist_include_HEADERS = jconfig.h

# jconfig.h.  No need for stamps: Automake already uses one for config.h.
jconfig.h: config.h
	@rm -f $@
	cd $(top_builddir) && $(SHELL) ./config.status jconfig.h
	@touch $@

CLEANFILES += _configs.sed jconfig.h
# Files created by VC++.
CLEANFILES += vc80.pdb *.exe.manifest *.exe.intermediate.manifest


# documentation, test, and support files
DOCS = README install.doc usage.doc			\
  wizard.doc example.c libjpeg.doc structure.doc	\
  coderules.doc filelist.doc change.log

# Makefile templates.
EXTRA_DIST +=								  \
  templates/makefile.cfg  templates/makefile.ansi templates/makefile.unix \
  templates/makefile.bcc  templates/makefile.mc6  templates/makefile.dj	  \
  templates/makefile.wat  templates/makefile.vc   templates/makelib.ds	  \
  templates/makeapps.ds   templates/makeproj.mac  templates/makcjpeg.st	  \
  templates/makdjpeg.st   templates/makljpeg.st   templates/maktjpeg.st	  \
  templates/makefile.manx templates/makefile.sas  templates/makefile.mms  \
  templates/makefile.vms  templates/makvms.opt

# Configuration file templates.
EXTRA_DIST +=								\
  templates/jconfig.bcc templates/jconfig.mc6  templates/jconfig.dj	\
  templates/jconfig.wat templates/jconfig.vc   templates/jconfig.mac	\
  templates/jconfig.st  templates/jconfig.manx templates/jconfig.sas	\
  templates/jconfig.vms templates/jconfig.doc

OTHERFILES = ckconfig.c jmemdosa.asm

TESTFILES = testorig.jpg testimg.ppm testimg.bmp testimg.jpg testprog.jpg \
 testimgp.jpg

EXTRA_DIST += $(DOCS) $(SOURCES) $(OTHERFILES) $(TESTFILES)


## ------------------------------------- ##
## Programs, man pages, and test suite.  ##
## ------------------------------------- ##

AM_LDADD = libjpeg.la
LDADD = $(AM_LDADD)
jpeg_programs = cjpeg djpeg jpegtran rdjpgcom wrjpgcom
man_mans = cjpeg.1 djpeg.1 jpegtran.1 rdjpgcom.1 wrjpgcom.1

cjpeg_SOURCES = cjpeg.c rdppm.c rdgif.c rdtarga.c rdrle.c rdbmp.c rdswitch.c \
  cdjpeg.c
djpeg_SOURCES = djpeg.c wrppm.c wrgif.c wrtarga.c wrrle.c wrbmp.c rdcolmap.c \
  cdjpeg.c
jpegtran_SOURCES = jpegtran.c rdswitch.c cdjpeg.c transupp.c


if PROGRAMS
bin_PROGRAMS = $(jpeg_programs)
dist_man_MANS = $(man_mans)

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
CLEANFILES += testout*
else
EXTRA_PROGRAMS = $(jpeg_programs)
EXTRA_MANS = $(man_mans)
endif
