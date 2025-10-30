--- src/libexec/spamd-setup/spamd-setup.c.orig	2025-09-16 16:14:07.000000000 +0000
+++ src/libexec/spamd-setup/spamd-setup.c	2025-10-30 19:10:15.712035000 +0000
@@ -45,7 +45,7 @@
 
 #define PATH_FTP		"/usr/bin/ftp"
 #define PATH_PFCTL		"/sbin/pfctl"
-#define PATH_SPAMD_CONF		"/etc/mail/spamd.conf"
+#define PATH_SPAMD_CONF		"/srv/etc/spamd/spamd.conf"
 #define SPAMD_ARG_MAX		256 /* max # of args to an exec */
 #define SPAMD_USER		"_spamd"
 
