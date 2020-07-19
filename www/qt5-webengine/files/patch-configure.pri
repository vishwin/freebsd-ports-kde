--- configure.pri.orig	2020-04-08 09:41:36 UTC
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
@@ -114,7 +114,7 @@ defineTest(qtwebengine_platformError) {
 defineTest(qtConfTest_detectPlatform) {
     QT_FOR_CONFIG += gui-private
 
-    !linux:!win32:!macos:!ios {
+    !linux:!win32:!macos:!ios:!unix: {
         qtwebengine_platformError("Unknown platform. Qt WebEngine only supports Linux, Windows, and macOS.")
     } else {
         linux:qtwebengine_isLinuxPlatformSupported() {
@@ -125,6 +125,9 @@ defineTest(qtConfTest_detectPlatform) {
         }
         macos:qtwebengine_isMacOsPlatformSupported() {
             $${1}.platform = "macos"
+        }
+        unix:qtwebengine_isLinuxPlatformSupported() {
+            $${1}.platform = "linux"
         }
         ios:qtwebengine_isMacOsPlatformSupported() {
             $${1}.platform = "ios"
