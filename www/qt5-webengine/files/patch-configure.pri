--- configure.pri.orig	2020-11-07 01:22:36 UTC
+++ configure.pri
@@ -12,7 +12,7 @@
     python_version ~= s/[()]//g
     python_version = $$split(python_version, ',')
     python_major_version = $$first(python_version)
-    greaterThan(python_major_version, 2) {
+    greaterThan(python_major_version, 3) {
         qtLog("Python version 3 is not supported by Chromium.")
         return(false)
     }
@@ -123,6 +123,9 @@ defineTest(qtConfTest_detectPlatform) {
     macos:qtwebengine_isMacOsPlatformSupported() {
         $${1}.platform = "macos"
     }
+    unix:qtwebengine_isLinuxPlatformSupported() {
+        $${1}.platform = "linux"
+    }
     ios:qtwebengine_isMacOsPlatformSupported() {
         $${1}.platform = "ios"
     }
