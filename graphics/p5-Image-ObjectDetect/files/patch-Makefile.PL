--- Makefile.PL.orig	2010-12-19 07:00:27 UTC
+++ Makefile.PL
@@ -3,8 +3,8 @@ use warnings;
 use ExtUtils::MakeMaker;
 
 link("lib/Image/ObjectDetect.xs", "ObjectDetect.xs");
-chomp(my $libs    = `pkg-config opencv --libs`);
-chomp(my $ccflags = `pkg-config opencv --cflags`);
+chomp(my $libs    = `pkg-config opencv4 --libs`);
+chomp(my $ccflags = `pkg-config opencv4 --cflags`);
 die "cannot find opencv library." unless $libs;
 $ccflags .= '-Isrc '.$ccflags;
 WriteMakefile(
@@ -16,7 +16,7 @@ WriteMakefile(
         'Test::More' => 0.32,
     },
     LIBS                => $libs,
-    CCFLAGS             => $ccflags,
+    INC             	=> $ccflags,
     dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
     clean               => { FILES => 'Image-ObjectDetect-*' },
 );
