/* jconfig.st --- jconfig.h for Atari ST/STE/TT using Pure C or Turbo C. */
/* see jconfig.doc for explanations */

#define LIBJPEG_HAVE_PROTOTYPES
#define LIBJPEG_HAVE_UNSIGNED_CHAR
#define LIBJPEG_HAVE_UNSIGNED_SHORT
/* #define void char */
/* #define const */
#undef CHAR_IS_UNSIGNED
#define LIBJPEG_HAVE_STDDEF_H
#define LIBJPEG_HAVE_STDLIB_H
#undef LIBJPEG_NEED_BSD_STRINGS
#undef LIBJPEG_NEED_SYS_TYPES_H
#undef LIBJPEG_NEED_FAR_POINTERS
#undef LIBJPEG_NEED_SHORT_EXTERNAL_NAMES
#define INCOMPLETE_TYPES_BROKEN	/* suppress undefined-structure warnings */

#ifdef JPEG_INTERNALS

#undef RIGHT_SHIFT_IS_UNSIGNED

#define ALIGN_TYPE  long	/* apparently double is a weird size? */

#endif /* JPEG_INTERNALS */

#ifdef JPEG_CJPEG_DJPEG

#define BMP_SUPPORTED		/* BMP image file format */
#define GIF_SUPPORTED		/* GIF image file format */
#define PPM_SUPPORTED		/* PBMPLUS PPM/PGM image file format */
#undef RLE_SUPPORTED		/* Utah RLE image file format */
#define TARGA_SUPPORTED		/* Targa image file format */

#define TWO_FILE_COMMANDLINE	/* optional -- undef if you like Unix style */
/* Note: if you undef TWO_FILE_COMMANDLINE, you may need to define
 * USE_SETMODE.  Some Atari compilers require it, some do not.
 */
#define LIBJPEG_NEED_SIGNAL_CATCHER	/* needed if you use jmemname.c */
#undef DONT_USE_B_MODE
#undef PROGRESS_REPORT		/* optional */

#endif /* JPEG_CJPEG_DJPEG */
